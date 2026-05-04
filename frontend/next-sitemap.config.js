/** @type {import('next-sitemap').IConfig} */
module.exports = {
  siteUrl: process.env.SITE_URL || "https://robin.dataceil.com",
  generateRobotsTxt: true,
  sitemapSize: 5000,
  generateIndexSitemap: false, // Set to true for larger sites with multiple sitemaps
  exclude: ["/private/*"], // Exclude sensitive routes, adjust as needed
  robotsTxtOptions: {
    policies: [
      {
        userAgent: "*",
        allow: "/",
        disallow: ["/private/*"], // Adjust to exclude specific routes
      },
    ],
    additionalSitemaps: ["https://robin.dataceil.com/sitemap.xml"],
  },
};
