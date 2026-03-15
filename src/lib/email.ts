import nodemailer from "nodemailer";

let transporter: ReturnType<typeof nodemailer.createTransport> | null = null;

export function createTransporter() {
  if (transporter) {
    return transporter;
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  transporter = (nodemailer.createTransport as any)({
    host: "smtp.gmail.com",
    port: 587,
    secure: false,
    family: 4,
    pool: true,
    maxConnections: 2,
    maxMessages: 50,
    auth: {
      user: process.env.GMAIL_USER,
      pass: process.env.GMAIL_APP_PASSWORD,
    },
  }) as ReturnType<typeof nodemailer.createTransport>;

  return transporter;
}

export const FROM = `"e-jano" <${process.env.GMAIL_USER}>`;

/** Deterministic Message-ID for a given tema — allows threading without DB changes */
export function temaMessageId(temaId: string) {
  return `<tema-${temaId}@e-jano>`;
}

export async function sendMail(options: nodemailer.SendMailOptions) {
  const transporter = createTransporter();
  return transporter.sendMail(options);
}
