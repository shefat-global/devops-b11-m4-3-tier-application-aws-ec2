import {
  Facebook,
  Instagram,
  Linkedin,
  Twitter,
  Youtube,
} from "lucide-react";
import Link from "next/link";

interface SocialLinksProps {
  facebookUrl?: string;
  twitterUrl?: string;
  linkedinUrl?: string;
  youtubeUrl?: string;
  instagramUrl?: string;
}

const SocialLinks = ({
  facebookUrl,
  twitterUrl,
  linkedinUrl,
  youtubeUrl,
  instagramUrl,
}: SocialLinksProps) => {

  const socialData = [
    { title: "Youtube", icon: <Youtube size={20} />, link: youtubeUrl },
    { title: "Twitter", icon: <Twitter size={20} />, link: twitterUrl },
    { title: "Linkedin", icon: <Linkedin size={20} />, link: linkedinUrl },
    { title: "Facebook", icon: <Facebook size={20} />, link: facebookUrl },
    { title: "Instagram", icon: <Instagram size={20} />, link: instagramUrl },
  ].filter((item) => item.link && item.link.trim() !== "");

  return (
    <div className="flex items-center gap-3">
      {socialData.map((item) => (
        <div
          key={item.title}
          className="text-lightSky/80 border border-lightSky/30 p-2.5 rounded-full hover:bg-lightSky/10 hover:border-lightSky hover:text-lightSky"
        >
          <Link
            href={item.link as string}
            target="_blank"
            rel="noopener noreferrer"
          >
            {item.icon}
          </Link>
        </div>
      ))}
    </div>
  );
};

export default SocialLinks;