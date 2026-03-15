import { getCurrentUserAndProfile } from "@/lib/supabase/current-user";
import { redirect } from "next/navigation";
import { Navbar } from "@/components/layout/Navbar";
import { MobileNav } from "@/components/layout/MobileNav";
import type { Profile } from "@/lib/types/database";

export default async function AuthenticatedLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const { user, profile } = await getCurrentUserAndProfile();

  if (!user) {
    redirect("/login");
  }

  if (!profile) {
    redirect("/api/auth/signout");
  }

  return (
    <div className="min-h-screen bg-slate-50">
      <Navbar profile={profile as Profile} />
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        {children}
      </main>
      <MobileNav profile={profile as Profile} />
    </div>
  );
}
