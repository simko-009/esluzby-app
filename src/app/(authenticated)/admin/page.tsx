import { createClient } from "@/lib/supabase/server";
import { getCurrentUserAndProfile } from "@/lib/supabase/current-user";
import { redirect } from "next/navigation";
import { AdminClient } from "@/components/admin/AdminClient";
import type { Profile } from "@/lib/types/database";
import { isAdmin } from "@/lib/types/database";

export default async function AdminPage() {
  const { profile } = await getCurrentUserAndProfile();
  if (!profile) {
    redirect("/login");
  }

  const supabase = await createClient();

  if (!profile || !isAdmin(profile)) {
    redirect("/domov");
  }

  const { data: allProfiles } = (await supabase
    .from("profiles")
    .select("*")
    .order("priezvisko", { ascending: true })) as { data: Profile[] | null };

  return <AdminClient profiles={allProfiles || []} currentProfile={profile} />;
}
