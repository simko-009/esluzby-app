import { createClient } from "@/lib/supabase/server";
import { NextResponse } from "next/server";

export async function GET() {
  const supabase = await createClient();
  await supabase.auth.signOut();
  try {
    return NextResponse.redirect(
      new URL("/login", process.env.NEXT_PUBLIC_SITE_URL),
    );
  } catch (error) {
    console.error("Error:", error);
    return NextResponse.json({ error: "Failed to sign out" }, { status: 500 });
  }
}
