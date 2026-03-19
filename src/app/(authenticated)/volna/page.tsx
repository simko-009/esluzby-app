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
    .select(
      "id, reporter_id, datum_od, datum_do, dovod, typ, stav, schvalil_id, poznamka, created_at",
    )
    .order("datum_od", { ascending: false })) as { data: Volno[] | null };

  const { data: allProfiles } = (await supabase
    .from("profiles")
    .select(
      "id, email, meno, priezvisko, roly, telefon, region, je_regionalny, created_at",
    )) as { data: Profile[] | null };

  return (
    <VolnaClient
      currentProfile={profile!}
      volna={volna || []}
      allProfiles={allProfiles || []}
    />
  );
}
