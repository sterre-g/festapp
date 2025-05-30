import nodemailer from "npm:nodemailer@6.9.16";

const _SMTP_HOSTNAME = Deno.env.get("SMTP_HOSTNAME") || "";
const _SMTP_USER_NAME = Deno.env.get("SMTP_USER_NAME") || "";
const _SMTP_USER_PASSWORD = Deno.env.get("SMTP_USER_PASSWORD") || "";
const _DEFAULT_EMAIL = Deno.env.get("DEFAULT_EMAIL") || "";

/**
 * Sanitize HTML to avoid Gmail-specific issues
 */
export function sanitizeHtml(html: string) {
  return html.replace(/(\r\n|\n|\r)/gm, "").replace(/ {2,}/g, " ").trim();
}

/**
 * Create a reusable transporter object using SMTP transport.
 *
 * Note: This may fail at runtime in Deno Edge Functions because
 * Nodemailer depends on Node APIs.
 */
const transporter = nodemailer.createTransport({
  host: _SMTP_HOSTNAME,
  port: 465,
  secure: true,
  auth: {
    user: _SMTP_USER_NAME,
    pass: _SMTP_USER_PASSWORD,
  },
});

export async function sendEmail({
  to,
  subject,
  html,
  attachments = [],
  from = _DEFAULT_EMAIL,
}: {
  to: string;
  subject: string;
  html: string;
  attachments?: Array<{
    filename: string;
    content: any;
    contentType: string;
    encoding: string;
  }>;
  from?: string;
}) {
  try {
    await transporter.sendMail({
      from,
      to,
      subject,
      html,
      attachments: attachments.map((attachment) => ({
        filename: attachment.filename,
        content: attachment.content,
        contentType: attachment.contentType,
        encoding: attachment.encoding,
      })),
    });
    console.log("Email sent successfully to:", to);
  } catch (error) {
    console.error("Failed to send email:", error);
  }
}

export async function sendEmailWithSubs({
  to,
  subject,
  content,
  subs,
  attachments = [],
  from = _DEFAULT_EMAIL,
  wrapper = null,
}: {
  to: string;
  subject: string;
  content: string;
  subs: Record<string, string>;
  attachments?: Array<{
    filename: string;
    content: any;
    contentType: string;
    encoding: string;
  }>;
  from?: string;
  wrapper?: string | null;
}) {
  // Replace placeholders in subject and content with values from subs
  let processedSubject = subject;
  let processedHtml = content;

  for (const [key, value] of Object.entries(subs)) {
    const placeholder = `{{${key}}}`;
    processedHtml = processedHtml.replaceAll(placeholder, value);
    processedSubject = processedSubject.replaceAll(placeholder, value);
  }

  // If a wrapper is provided, inject the processedHtml into the wrapper
  if (wrapper) {
    processedHtml = wrapper.replace("{{content}}", processedHtml);
  }

  // Sanitize the processed HTML content
  const sanitizedHtml = sanitizeHtml(processedHtml);

  // Send the email using the processed and sanitized content
  await sendEmail({
    to,
    subject: processedSubject,
    html: sanitizedHtml,
    attachments,
    from,
  });
}
