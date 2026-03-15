import { updateSession } from "@/lib/supabase/middleware";
import type { NextRequest } from "next/server";

export async function middleware(request: NextRequest) {
  return await updateSession(request);
}

export const config = {
  matcher: [
    "/domov/:path*",
    "/admin/:path*",
    "/profil/:path*",
    "/nova-tema/:path*",
    "/volna/:path*",
  ],
};
