import Container from "@/components/Container";
import HomeDescription from "@/components/HomeDescription";
import Photo from "@/components/Photo";
import SocialLinks from "@/components/SocialLinks";
import Statistics from "@/components/Statistics";
import { Button } from "@/components/ui/button";
import { Download } from "lucide-react";
import Link from "next/link";

interface CounterItem {
  id: number;
  counter_number: number;
  counter_text: string;
}

interface HeroImage {
  id: number;
  full_url: string;
  alt: string;
}

interface PageData {
  title: string;
  hero_title: string;
  hero_subtitle: string;
  hero_sub_subtitle: string;
  hero_description: string;
  counter_items: CounterItem[];
  hero_image: HeroImage;
}

interface SiteSettings {
  cv_url?: string;
  facebook_url?: string;
  twitter_url?: string;
  linkedin_url?: string;
  youtube_url?: string;
  instagram_url?: string;
}

const getHomePageData = async (): Promise<PageData> => {
  const res = await fetch("http://127.0.0.1:8000/api/v2/pages/3/", {
    next: { revalidate: 2592000 },
  });

  if (!res.ok) throw new Error("Failed to fetch home data");

  const data = await res.json();

  return {
    title: data.title,
    hero_title: data.hero_title,
    hero_subtitle: data.hero_subtitle,
    hero_sub_subtitle: data.hero_sub_subtitle,
    hero_description: data.hero_description,
    counter_items: data.counter_items,
    hero_image: data.hero_image,
  };
};

const getSiteSettings = async (): Promise<SiteSettings> => {
  const res = await fetch("http://127.0.0.1:8000/api/v2/site-settings", {
    next: { revalidate: 2592000 },
  });

  if (!res.ok) throw new Error("Failed to fetch site settings");

  return res.json();
};

const Home = async () => {
  const page = await getHomePageData();
  const siteSettings = await getSiteSettings();

  return (
    <div>
      <Container className="py-10 grid grid-cols-1 md:grid-cols-2 gap-10">
        <div className="flex flex-col items-center md:items-start gap-5 md:gap-7 text-center md:text-start">

          <div>
            <h3 className="font-semibold text-white/70 mb-1">
              {page.hero_title}
            </h3>
            <h2 className="text-3xl md:text-5xl mb-2">
              {page.hero_subtitle}
            </h2>
            <h1 className="text-lightSky text-5xl md:text-7xl">
              {page.hero_sub_subtitle}
            </h1>
          </div>

          <div className="w-full h-[170px] md:h-[140px] relative">
            <div className="absolute inset-0">
              <HomeDescription description={page.hero_description} />
            </div>
          </div>

          {/* Safe CV Link */}
          {siteSettings.cv_url && (
            <Button className="bg-transparent rounded-full border border-lightSky/50 text-lightSky hover:bg-hoverColor hover:text-black">
              <Link
                href={`http://127.0.0.1:8000${siteSettings.cv_url}`}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-1"
              >
                Download CV <Download />
              </Link>
            </Button>
          )}

          {/* Pass props safely */}
          <SocialLinks
            facebookUrl={siteSettings.facebook_url}
            twitterUrl={siteSettings.twitter_url}
            linkedinUrl={siteSettings.linkedin_url}
            youtubeUrl={siteSettings.youtube_url}
            instagramUrl={siteSettings.instagram_url}
          />

          <Statistics counter_items={page.counter_items} />
        </div>

        <Photo />
      </Container>
    </div>
  );
};

export default Home;