"use client";
import Container from "@/components/Container";
import Title from "@/components/Title";
import { motion } from "framer-motion";
import { ArrowUp } from "lucide-react";
import Link from "next/link";
import { useEffect, useState } from "react";

interface ServiceListTitle{
  service_list_title: string;
}

// define the structure of each service item 
interface ServiceItem {
  id: number;
  card_serial: number;
  card_title: string;
  card_summary: { type: string; value: string}[];
  cta_link: string;
  button_text: string;
}


const ServicePage = () => {
  const [serviceListTitle, setServiceListTitle] = useState<ServiceListTitle | null>(null);
  const [serviceItems, setServiceItems] = useState<ServiceItem[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(()=>{
    // fetch service data on the client side when the component mounts 
    const fetchServiceData = async () => {
      try{
        const response = await fetch("http://127.0.0.1:8000/api/v2/pages/4/");
        if(!response.ok){
          throw new Error(`Failed to fetch service data: ${response.status}`);
        }
        const data = await response.json();
        setServiceListTitle(data.service_list_title);
        setServiceItems(data.service_items);
      }catch(error){
        setError("Error loading service data");
        console.error("Error loading service data:", error);
      }finally{
        setLoading(false);
      }
    };

    fetchServiceData(); //call the fetch function 
  }, [])

  if(loading) {
    return <div>Loading...</div>;
  }

  if(error) {
    return <div>{error}</div>;
  }


  return (
    <section className="min-h-[80vh] flex flex-col justify-center py-5 md:py-10 text-white">
      <Container>
        <motion.div
          initial={{ opacity: 0 }}
          animate={{
            opacity: 1,
            transition: { delay: 2.4, duration: 0.4, ease: "easeIn" },
          }}
         >
          
        <Title>{serviceListTitle?.service_list_title}</Title>

          {/* Render service items */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-5 md:gap-12">
            {serviceItems?.map((item) => (
              <div
                key={item?.id}
                className="flex flex-col p-6 bg-lightSky/5 border border-lightSky/20 hover:border-lightSky/30 rounded-lg shadow-md group hover:shadow-lg transition-shadow duration-300 gap-2"
              >
                <div className="w-full flex items-center justify-between">
                  <p className="text-5xl font-extrabold text-outline text-transparent group-hover:text-outline-hover hoverEffect">
                    0{item?.card_serial}
                  </p>
                  <Link href={item?.cta_link} target="blank">
                   {item?.button_text} <ArrowUp className="rotate-45" />
                  </Link>
                </div>
                <h2 className="font-semibold">{item?.card_title}</h2>
                {/* <p className="text-sm md:text-base text-white/80">
                  {item?.card_summary[0]?.value}
                </p> */}

                {/* Render only the value of the first item in card_summary */}
                <div
                  className="text-sm md:text-base text-white/80"
                  dangerouslySetInnerHTML={{
                    __html: item?.card_summary[0]?.value || "", // Render the value of the first item
                  }}
                />

                <div className="border-b border-white/20 w-full mt-2" />
              </div>
            ))}
          </div>
        </motion.div>
      </Container>
    </section>
  );
};

export default ServicePage;


