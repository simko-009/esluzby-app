import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { sendMail, FROM } from "@/lib/email";
import type { TypVolna } from "@/lib/types/database";
import { typVolnaLabels } from "@/lib/types/database";

interface RequestBody {
  reporterMeno: string;
  datumOd: string;
  datumDo: string;
  typVolna: TypVolna;
  dovod?: string | null;
}

export async function POST(req: NextRequest) {
  // Require authenticated session
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const body: RequestBody = await req.json();
  const { reporterMeno, datumOd, datumDo, typVolna, dovod } = body;

  if (!reporterMeno || !datumOd || !datumDo || !typVolna) {
    return NextResponse.json(
      { error: "Chýbajú povinné polia" },
      { status: 400 },
    );
  }

  // Fetch only office manager recipients needed for email delivery.
  const { data: recipients } = await supabase
    .from("profiles")
    .select("id, email")
    .contains("roly", ["office_manazer"])
    .neq("id", user.id)
    .not("email", "is", null);

  if (!recipients || recipients.length === 0) {
    return NextResponse.json({ success: true, sent: 0 });
  }

  const typLabel = typVolnaLabels[typVolna] ?? typVolna;

  const formatDatum = (datum: string) => {
    const [year, month, day] = datum.split("-");
    return `${day}. ${month}. ${year}`;
  };

  const formattedDatumText =
    datumOd === datumDo
      ? formatDatum(datumOd)
      : `${formatDatum(datumOd)} — ${formatDatum(datumDo)}`;

  const subject = `Nová žiadosť o voľno: ${reporterMeno} — ${typLabel} (${formattedDatumText})`;

  const html = `
    <div style="font-family: Arial, sans-serif; max-width: 520px; margin: 0 auto; color: #1e293b;">
      <div style="background: #2563eb; padding: 16px 24px; border-radius: 12px 12px 0 0;">
        <h2 style="margin: 0; color: #fff; font-size: 18px;">Nová žiadosť o voľno</h2>
      </div>
      <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-top: none; border-radius: 0 0 12px 12px; padding: 24px;">
        <p style="margin-top: 0;"><strong>${reporterMeno}</strong> žiada o voľno.</p>

        <table style="width:100%; border-collapse: collapse; margin: 16px 0; font-size: 14px;">
          <tr>
            <td style="padding: 10px 12px; background: #f1f5f9; font-weight: 600; width: 40%; border-radius: 6px 0 0 0;">Typ voľna</td>
            <td style="padding: 10px 12px; background: #fff; border-radius: 0 6px 0 0;">${typLabel}</td>
          </tr>
          <tr>
            <td style="padding: 10px 12px; background: #f1f5f9; font-weight: 600; border-radius: 0 0 0 6px;">Dátum</td>
            <td style="padding: 10px 12px; background: #fff; border-radius: 0 0 6px 0;">${formattedDatumText}</td>
          </tr>
        </table>

        ${
          dovod
            ? `<div style="border-left: 3px solid #2563eb; padding: 12px 16px; background: #fff; border-radius: 0 8px 8px 0; margin-top: 16px;">
                <p style="margin: 0; font-size: 13px; color: #64748b; font-weight: 600;">Dôvod:</p>
                <p style="margin: 4px 0 0; font-size: 14px; font-style: italic; color: #475569;">"${dovod}"</p>
              </div>`
            : ""
        }

        <p style="margin-top: 20px; font-size: 14px;">Žiadosť čaká na schválenie v sekcii <strong>Voľná</strong>.</p>

        <hr style="border: none; border-top: 1px solid #e2e8f0; margin: 24px 0;" />
        <p style="color: #94a3b8; font-size: 12px; margin: 0;">
          Tento email bol odoslaný automaticky systémom e-jano. Neodpovedajte naň.
        </p>
      </div>
    </div>
  `;

  try {
    // Send to all office managers in parallel
    await Promise.all(
      recipients.map((manager) =>
        sendMail({
          from: FROM,
          to: manager.email,
          subject,
          html,
        }),
      ),
    );

    return NextResponse.json({ success: true, sent: recipients.length });
  } catch (err) {
    console.error("Failed to send volno-nove email:", err);
    return NextResponse.json(
      { error: "Nepodarilo sa odoslať email" },
      { status: 500 },
    );
  }
}
