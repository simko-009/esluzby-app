import { NextRequest, NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { sendMail } from "@/lib/email";

function escapeHtml(str: string) {
  return str
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

export async function POST(req: NextRequest) {
  const body = await req.json().catch(() => ({}));
  const email =
    typeof body?.email === "string" ? body.email.trim().toLowerCase() : "";

  if (!email) {
    return NextResponse.json({ error: "Chýba email" }, { status: 400 });
  }

  try {
    const adminClient = createAdminClient();
    const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? "http://localhost:3000";
    const redirectTo = `${siteUrl}/obnovit-heslo`;

    const { data, error } = await adminClient.auth.admin.generateLink({
      type: "recovery",
      email,
      options: { redirectTo },
    });

    if (!error && data?.properties?.action_link) {
      // Supabase embeds its configured Site URL as the `redirect_to` param inside
      // the action_link regardless of what we pass in `options.redirectTo` when the
      // Site URL in the project settings is still localhost:3000.
      // We rewrite the redirect_to param here to guarantee it always points to
      // the real production URL.
      const rawLink = new URL(data.properties.action_link);
      rawLink.searchParams.set("redirect_to", redirectTo);
      const resetLink = rawLink.toString();
      const meta = data.user?.user_metadata;
      const userName = meta?.meno
        ? `${escapeHtml(meta.meno)} ${escapeHtml(meta.priezvisko ?? "")}`.trim()
        : escapeHtml(email);

      await sendMail({
        from: `"e-jano" <ejano.markiza@gmail.com>`,
        to: email,
        subject: "Obnovenie hesla – e-jano",
        html: `
          <div style="font-family: Arial, sans-serif; max-width: 480px; margin: 0 auto;">
            <h2 style="color: #1d4ed8;">Obnovenie hesla</h2>
            <p>Ahoj ${userName},</p>
            <p>Dostali sme žiadosť o obnovenie hesla pre váš účet v <strong>e-jano</strong>.</p>
            <p style="text-align:center; margin: 28px 0;">
              <a href="${resetLink}"
                style="background:#1d4ed8;color:#fff;padding:12px 28px;border-radius:6px;text-decoration:none;display:inline-block;font-size:15px;font-weight:bold;">
                Obnoviť heslo
              </a>
            </p>
            <p style="color:#64748b; font-size:13px;">
              Odkaz je platný <strong>1 hodinu</strong>. Ak ste o obnovenie hesla nežiadali, tento email ignorujte – vaše heslo zostane nezmenené.
            </p>
            <hr style="border: none; border-top: 1px solid #e2e8f0; margin: 24px 0;" />
            <p style="color: #64748b; font-size: 12px;">Tento email bol odoslaný automaticky. Neodpovedajte naň.</p>
          </div>
        `,
      });
    }
    // If user not found or any error — silently succeed to prevent email enumeration
  } catch {
    // Silently fail
  }

  // Always return 200 to prevent email enumeration
  return NextResponse.json({ ok: true });
}
