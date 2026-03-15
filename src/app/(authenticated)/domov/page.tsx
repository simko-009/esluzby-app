import { createClient } from "@/lib/supabase/server";
import { getCurrentUserAndProfile } from "@/lib/supabase/current-user";
import { DomovClient } from "@/components/domov/DomovClient";
import type { Profile } from "@/lib/types/database";
import { redirect } from "next/navigation";

export default async function DomovPage() {
  const { profile } = await getCurrentUserAndProfile();
  if (!profile) {
    redirect("/login");
  }

  const supabase = await createClient();

  const { data: allProfiles } = (await supabase
    .from("profiles")
    .select("*")
    .order("priezvisko")) as { data: Profile[] | null };

  return (
    <DomovClient currentProfile={profile!} allProfiles={allProfiles || []} />
  );
}
