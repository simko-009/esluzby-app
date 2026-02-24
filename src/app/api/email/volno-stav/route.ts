import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { sendMail, FROM } from "@/lib/email";
import type { VolnoStav, TypVolna } from "@/lib/types/database";
import { typVolnaLabels } from "@/lib/types/database";

interface RequestBody {
  reporterEmail: string;
  reporterMeno: string;
  novyStav: VolnoStav;
  zmenilMeno: string;
  datumOd: string;
  datumDo: string;
  typVolna: TypVolna;
  poznamka?: string | null;
}

const stavLabel: Record<VolnoStav, string> = {
  schvalene: "Schválené ✅",
  neschvalene: "Neschválené ❌",
  caka: "Čaká na schválenie ⏳",
};

const stavColor: Record<VolnoStav, string> = {
  schvalene: "#16a34a",
  neschvalene: "#dc2626",
  caka: "#d97706",
};

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
  const {
    reporterEmail,
    reporterMeno,
    novyStav,
    zmenilMeno,
    datumOd,
    datumDo,
    typVolna,
    poznamka,
  } = body;

  if (!reporterEmail || !novyStav || !zmenilMeno || !datumOd || !datumDo) {
    return NextResponse.json(
      { error: "Chýbajú povinné polia" },
      { status: 400 },
    );
  }

  const stavText = stavLabel[novyStav] ?? novyStav;
  const color = stavColor[novyStav] ?? "#64748b";
  const typLabel = typVolnaLabels[typVolna] ?? typVolna;

  const formatDatum = (datum: string) => {
    const [year, month, day] = datum.split("-");
    return `${day}. ${month}. ${year}`;
  };

  const formattedDatumText =
    datumOd === datumDo
      ? formatDatum(datumOd)
      : `${formatDatum(datumOd)} — ${formatDatum(datumDo)}`;

  const subject =
    novyStav === "schvalene"
      ? `Voľno schválené: ${typLabel} (${formattedDatumText})`
      : `Voľno neschválené: ${typLabel} (${formattedDatumText})`;

  try {
    await sendMail({
      from: FROM,
      to: reporterEmail,
      subject,
      html: `
        <div style="font-family: Arial, sans-serif; max-width: 520px; margin: 0 auto; color: #1e293b;">
          <div style="background: ${color}; padding: 16px 24px; border-radius: 12px 12px 0 0;">
            <h2 style="margin: 0; color: #fff; font-size: 18px;">Zmena stavu voľna</h2>
          </div>
          <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-top: none; border-radius: 0 0 12px 12px; padding: 24px;">
            <p style="margin-top: 0;">Ahoj <strong>${reporterMeno}</strong>,</p>
            <p>Stav tvojho voľna bol zmenený.</p>

            <table style="width:100%; border-collapse: collapse; margin: 16px 0; font-size: 14px;">
              <tr>
                <td style="padding: 10px 12px; background: #f1f5f9; font-weight: 600; width: 40%; border-radius: 6px 0 0 0;">Typ voľna</td>
                <td style="padding: 10px 12px; background: #fff; border-radius: 0 6px 0 0;">${typLabel}</td>
              </tr>
              <tr>
                <td style="padding: 10px 12px; background: #f1f5f9; font-weight: 600;">Dátum</td>
                <td style="padding: 10px 12px; background: #fff;">${formattedDatumText}</td>
              </tr>
              <tr>
                <td style="padding: 10px 12px; background: #f1f5f9; font-weight: 600;">Nový stav</td>
                <td style="padding: 10px 12px; background: #fff; font-weight: 700; color: ${color};">${stavText}</td>
              </tr>
              <tr>
                <td style="padding: 10px 12px; background: #f1f5f9; font-weight: 600; border-radius: 0 0 0 6px;">Zmenil/a</td>
                <td style="padding: 10px 12px; background: #fff; border-radius: 0 0 6px 0;">${zmenilMeno}</td>
              </tr>
            </table>

            ${
              poznamka
                ? `<div style="border-left: 3px solid ${color}; padding: 12px 16px; background: #fff; border-radius: 0 8px 8px 0; margin-top: 16px;">
                    <p style="margin: 0; font-size: 14px; font-style: italic; color: #475569;">"${poznamka}"</p>
                  </div>`
                : ""
            }

            <hr style="border: none; border-top: 1px solid #e2e8f0; margin: 24px 0;" />
            <p style="color: #94a3b8; font-size: 12px; margin: 0;">
              Tento email bol odoslaný automaticky systémom e-jano. Neodpovedajte naň.
            </p>
          </div>
        </div>
      `,
    });

    return NextResponse.json({ success: true });
  } catch (err) {
    console.error("Failed to send volno-stav email:", err);
    return NextResponse.json(
      { error: "Nepodarilo sa odoslať email" },
      { status: 500 },
    );
  }
}
