import ContactForm from "@/components/ContactForm";
import Container from "@/components/Container";
import { Mail, MapPinCheck, Phone } from "lucide-react";

/* Interface (only what you use) */
interface SiteSettings {
  phone: string;
  email: string;
  address: string;
}

/* fetch data function */
const getSiteSettings = async (): Promise<SiteSettings> => {
  const res = await fetch("http://127.0.0.1:8000/api/v2/site-settings", {
    next: { revalidate: 2592000 }, // 30 days
  });

  if (!res.ok) {
    throw new Error("Failed to fetch site settings");
  }

  return res.json();
};

/* Page component */
const ContactPage = async () => {
  const data = await getSiteSettings();

  const infoData = [
    {
      icon: <Phone />,
      title: "Phone",
      description: data.phone,
    },
    {
      icon: <Mail />,
      title: "Email",
      description: data.email,
    },
    {
      icon: <MapPinCheck />,
      title: "Address",
      description: data.address,
    },
  ];

  return (
    <Container className="py-6 md:py-12">
      <div className="flex flex-col md:flex-row gap-6 md:gap-14">
        
        {/* LEFT SIDE */}
        <div className="w-full md:w-2/3">
          <ContactForm />
        </div>

        {/* RIGHT SIDE */}
        <div className="w-full md:w-1/3 flex flex-col justify-center gap-4 md:gap-8">
          {infoData.map((item) => (
            <div key={item.title} className="flex items-center space-x-4">
              <span className="bg-lightSky/5 p-4 rounded-md">
                {item.icon}
              </span>
              <div>
                <h3 className="text-white/60 text-sm font-semibold">
                  {item.title}
                </h3>
                <p>{item.description}</p>
              </div>
            </div>
          ))}
        </div>

      </div>
    </Container>
  );
};

export default ContactPage;