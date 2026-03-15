import { createClient } from "@/lib/supabase/server";
import { getCurrentUserAndProfile } from "@/lib/supabase/current-user";
import { VolnaClient } from "@/components/volna/VolnaClient";
import type { Profile, Volno } from "@/lib/types/database";
import { redirect } from "next/navigation";

export default async function VolnaPage() {
  const { profile } = await getCurrentUserAndProfile();
  if (!profile) {
    redirect("/login");
  }

  const supabase = await createClient();

  const { data: volna } = (await supabase
    .from("volna")
    .select("*")
    .order("datum_od", { ascending: false })) as { data: Volno[] | null };

  const { data: allProfiles } = (await supabase
    .from("profiles")
    .select("*")) as { data: Profile[] | null };

  return (
    <VolnaClient
      currentProfile={profile!}
      volna={volna || []}
      allProfiles={allProfiles || []}
    />
  );
}
