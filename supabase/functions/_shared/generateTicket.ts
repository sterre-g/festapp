import { createClient } from "https://esm.sh/@supabase/supabase-js@2.46.2";
import QRCode from "npm:qrcode";
import { PDFDocument, rgb } from "npm:pdf-lib";
// Import all exports from fontkit (do not try to import a default)
import * as fontkit from "npm:fontkit";
import * as path from "https://deno.land/std/path/mod.ts";

// Set constant for custom font URL.
const CUSTOM_FONT_URL =
  "https://github.com/google/fonts/raw/refs/heads/main/apache/robotoslab/RobotoSlab%5Bwght%5D.ttf";

const supabaseAdmin = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
);

export async function fetchTicketResources(ticket: any) {
  // Fetch the occasion data.
  const { data: occasion, error: occasionError } = await supabaseAdmin
    .from("occasions")
    .select("id, data")
    .eq("id", ticket.occasion)
    .single();

  if (occasionError || !occasion) {
    throw new Error(
      `Occasion not found or error fetching occasion: ${occasionError?.message}`
    );
  }

  let backgroundUrl: string | undefined;
  let darkColor = "000000";
  let lightColor = "FFFFFF";

  if (Array.isArray(occasion.data?.features)) {
    const ticketFeature = occasion.data.features.find(
      (feature: any) => feature.code === "ticket"
    );
    if (ticketFeature) {
      if (typeof ticketFeature.background === "string") {
        backgroundUrl = ticketFeature.background;
      }
      if (typeof ticketFeature.darkColor === "string") {
        const hexColorRegex = /^[A-Fa-f0-9]{6}$/;
        if (hexColorRegex.test(ticketFeature.darkColor)) {
          darkColor = ticketFeature.darkColor;
        }
      }
      if (typeof ticketFeature.lightColor === "string") {
        const hexColorRegex = /^[A-Fa-f0-9]{6}$/;
        if (hexColorRegex.test(ticketFeature.lightColor)) {
          lightColor = ticketFeature.lightColor;
        }
      }
    }
  }

  if (!backgroundUrl) {
    throw new Error(
      "Background image URL not found in occasion.data.features."
    );
  }

  // Fetch product types.
  const { data: productTypes, error: productTypesError } = await supabaseAdmin
    .schema("eshop")
    .from("product_types")
    .select("id, type");

  if (productTypesError || !productTypes) {
    throw new Error(
      `Error fetching product types: ${productTypesError?.message}`
    );
  }

  const productTypeMap: Record<number, string> = {};
  productTypes.forEach((pt: any) => {
    productTypeMap[pt.id] = pt.type;
  });

  // Fetch products.
  const productIds = ticket.order_product_ticket.map(
    (opt: any) => opt.product
  );
  const { data: products, error: productsError } = await supabaseAdmin
    .schema("eshop")
    .from("products")
    .select(`id, title, title_short, product_type, data`)
    .in("id", productIds);

  if (productsError || !products) {
    throw new Error(`Error fetching products: ${productsError?.message}`);
  }

  const productMap: Record<string, any> = {};
  products.forEach((product: any) => {
    const typeStr = productTypeMap[product.product_type];
    if (typeStr) {
      productMap[typeStr] = product;
    }
  });

  // Download the background image.
  const bgResponse = await fetch(backgroundUrl);
  if (!bgResponse.ok) {
    throw new Error(`Failed to download background: ${backgroundUrl}`);
  }
  const backgroundBytes = new Uint8Array(await bgResponse.arrayBuffer());

  // Download the custom font.
  const fontResponse = await fetch(CUSTOM_FONT_URL);
  if (!fontResponse.ok) {
    throw new Error(`Failed to download custom font: ${CUSTOM_FONT_URL}`);
  }
  const customFontBytes = new Uint8Array(await fontResponse.arrayBuffer());

  return {
    darkColor,
    lightColor,
    productMap,
    backgroundBytes,
    customFontBytes,
  };
}

export async function generateTicketImage(
  ticket: any,
  resources: {
    darkColor: string;
    lightColor: string;
    productMap: Record<string, any>;
    backgroundBytes: Uint8Array;
    customFontBytes: Uint8Array;
  }
): Promise<Uint8Array> {
  try {
    const {
      darkColor,
      lightColor,
      productMap,
      backgroundBytes,
      customFontBytes,
    } = resources;

    // (For demonstration: using product types if needed)
    const spotProduct = productMap["spot"];
    const foodProduct = productMap["food"];
    const taxiProduct = productMap["taxi"];

    // Create the PDF document.
    const pdfDoc = await PDFDocument.create();

    // Register fontkit to enable embedding custom fonts.
    pdfDoc.registerFontkit(fontkit);

    const pageWidth = 595.28;
    const pageHeight = 841.89;
    const page = pdfDoc.addPage([pageWidth, pageHeight]);

    // Embed and draw the background image.
    let bgImage;
    try {
      bgImage = await pdfDoc.embedJpg(backgroundBytes);
    } catch (e) {
      bgImage = await pdfDoc.embedPng(backgroundBytes);
    }

    const bgWidth = bgImage.width;
    const bgHeight = bgImage.height;
    const marginPercentage = 0.05;
    const margin = (pageWidth * (marginPercentage * 2)) / 2;
    const scale = (pageWidth * (1 - marginPercentage * 2)) / bgWidth;
    const bgX = (pageWidth - bgWidth * scale) / 2;
    const bgY = (pageHeight - margin) - bgHeight * scale;

    page.drawImage(bgImage, {
      x: bgX,
      y: bgY,
      width: bgWidth * scale,
      height: bgHeight * scale,
    });

    // Generate QR Code and embed it.
    const qrSize = 240 * scale;
    const qrX = bgX + (bgWidth * scale) - qrSize - 150 * scale;
    const qrY = bgY + 140 * scale;

    const qrData = await QRCode.toDataURL(ticket.ticket_symbol, {
      width: qrSize,
      margin: 1.6,
      color: {
        dark: `#${darkColor}`,
        light: `#${lightColor}C0`,
      },
    });

    const rawQR = qrData.split(",")[1];
    // Convert base64 string to Uint8Array.
    const qrBytes = Uint8Array.from(atob(rawQR), (c) => c.charCodeAt(0));
    const qrImage = await pdfDoc.embedPng(qrBytes);

    page.drawImage(qrImage, {
      x: qrX,
      y: qrY,
      width: qrSize,
      height: qrSize,
    });

    // Draw the ticket symbol text directly below the QR Code.
    // Set some padding and choose a font size for the QR text.
    const qrTextPadding = 10 * scale;
    const qrFontSize = 28 * scale;
    const ticketSymbol = ticket.ticket_symbol;
    // Embed the custom font.
    const customFont = await pdfDoc.embedFont(customFontBytes);
    // Measure text width so that it can be centered under QR code.
    const ticketSymbolTextWidth = customFont.widthOfTextAtSize(
      ticketSymbol,
      qrFontSize
    );
    const ticketSymbolX = qrX + qrSize / 2 - ticketSymbolTextWidth / 2;
    const ticketSymbolY = qrY - qrTextPadding - qrFontSize;
    // Reuse the same text color as for other texts.
    const textColor = hexToRgb(darkColor);

    page.drawText(ticketSymbol, {
      x: ticketSymbolX,
      y: ticketSymbolY,
      size: qrFontSize,
      font: customFont,
      color: textColor,
    });

    // Convert hex color to PDF-lib rgb.
    // (Reusing darkColor for main text; textColor was already defined above.)
    let textX = bgX + 150 * scale;
    let textY = bgY + 280 * scale;

    const texts = [];

    // Add Spot Title.
    const spotOrder = ticket.order_product_ticket.find(
      (opt: any) => opt.product === spotProduct.id
    );
    if (spotOrder && spotOrder.spot_group_title) {
      texts.push(`Stůl: ${spotOrder.spot_group_title}`);
    } else {
      texts.push(`Stůl: N/A`);
    }

    // Add Food Title.
    if (foodProduct) {
      const foodTitle = foodProduct.title_short || foodProduct.title || "N/A";
      texts.push(`Večeře: ${foodTitle}`);
    }

    // Add Taxi Title.
    if (taxiProduct) {
      const taxiTitle =
        taxiProduct.title_short || taxiProduct.title || "N/A";
      texts.push(`Odvoz: ${taxiTitle}`);
    }

    texts.forEach((text) => {
      page.drawText(text, {
        x: textX,
        y: textY,
        size: 40 * scale,
        font: customFont,
        color: textColor,
      });
      textY -= 50 * scale;
    });

    const pdfBytes = await pdfDoc.save();
    return pdfBytes;
  } catch (error) {
    console.error("Error generating ticket PDF:", error);
    throw error;
  }

  // Helper function to convert a hex color string to PDF-lib rgb color.
  function hexToRgb(hex: string) {
    const r = parseInt(hex.substring(0, 2), 16) / 255;
    const g = parseInt(hex.substring(2, 4), 16) / 255;
    const b = parseInt(hex.substring(4, 6), 16) / 255;
    return rgb(r, g, b);
  }
}
