// src/lib/env.ts

const requiredEnv = {
  BACKEND_API_URL: process.env.BACKEND_API_URL,
};

for (const [key, value] of Object.entries(requiredEnv)) {
  if (!value) {
    throw new Error(`Missing environment variable: ${key}`);
  }
}

export const env = {
  backendApiUrl: requiredEnv.BACKEND_API_URL!,
};