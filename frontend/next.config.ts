import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
    unoptimized: true, // Keep the image configuration as is (if you have unoptimized images)
  },

  // CORS Headers - allow only requests from your frontend domain
  async headers() {
    return [
      {
        source: "/api/:path*", // Define path pattern for your API
        headers: [
          {
            key: "Access-Control-Allow-Origin",
            value: "http://localhost:3000", // Only allow requests from your frontend (localhost:3000)
          },
          {
            key: "Access-Control-Allow-Methods",
            value: "GET, POST, PUT, DELETE, OPTIONS", // Allow common HTTP methods
          },
          {
            key: "Access-Control-Allow-Headers",
            value: "X-Requested-With, Content-Type", // Allow necessary headers
          },
        ],
      },
    ];
  },

  // Rewrites to proxy requests to your Wagtail backend
  async rewrites() {
    return [
      {
        source: "/api/:path*", // Catch all API requests
        destination: "http://127.0.0.1:8000/api/v2/:path*", // Proxy to your Wagtail API at localhost:8000
      },
    ];
  },
};

export default nextConfig;