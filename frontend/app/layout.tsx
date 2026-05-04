import type { Metadata } from "next";
import "./globals.css";
import Header from "@/components/Header";
import PageTransition from "@/components/PageTransition";
import StairTransition from "@/components/StairTransition";
import { Toaster } from "@/components/ui/toaster";
import Script from "next/script";

export const metadata: Metadata = {
  title: "Engr Robin | Developer Portfolio",
  description:
    "Explore the portfolio of Engr Robin, a skilled developer specializing in web development, UI/UX design, and modern JavaScript frameworks. View projects, services, and contact details.",
  keywords:
    "developer portfolio, web developer, Engr Robin, UI/UX design, JavaScript, Next.js, frontend developer",
  authors: [{ name: "Engr Robin" }],
  robots: "index, follow",
  openGraph: {
    type: "website",
    url: "https://robin.dataceil.com/",
    title: "Engr Robin | Developer Portfolio",
    description:
      "Discover Engr Robin's portfolio showcasing expertise in web development, UI/UX, and modern frameworks. Contact for services or collaboration.",
    images: [
      {
        url: "https://robin.dataceil.com/images/og-image.jpg",
        width: 1200,
        height: 630,
        alt: "Engr Robin Portfolio Preview",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    site: "@YourTwitterHandle", // Replace with your Twitter handle
    title: "Engr Robin | Developer Portfolio",
    description:
      "Check out Engr Robin's portfolio for web development and UI/UX design projects.",
    images: ["https://robin.dataceil.com/images/og-image.jpg"],
  },
  alternates: {
    canonical: "https://robin.dataceil.com/",
  },
  other: {
    "theme-color": "#000000",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) { 
  return (
    <html lang="en">
      <head>
        {/* Structured Data (JSON-LD) for WebSite */}

        {/* Manifest for PWA */}
        <link rel="manifest" href="/manifest.json" />
        {/* Apple Touch Icon */}
        <link rel="apple-touch-icon" href="/assets/apple-touch-icon.png" />
      </head>
      <body>
        <Header />
        <StairTransition />
        <PageTransition>{children}</PageTransition>
        <Toaster />       
        <Script
          id="application"
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "WebSite",
              name: "Engr Robin Portfolio",
              url: "https://robin.dataceil.com/",
              potentialAction: {
                "@type": "SearchAction",
                target:
                  "https://robin.dataceil.com/search?q={search_term_string}",
                "query-input": "required name=search_term_string",
              },
            }),
          }}
        />
      </body>
    </html>
  );
}
