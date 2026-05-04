"use client";
import CountUp from "react-countup";

interface CounterItem {
  counter_number: number;
  counter_text: string;
}

const Statistics = ({counter_items}: {counter_items: CounterItem[]}) => {
  return (
    <section>
      <div className="flex items-center flex-col md:flex-row gap-2.5 md:gap-5">
        {counter_items?.map((item, index) => (
          <div
            key={index}
            className="flex flex-1 gap-2 md:gap-4 flex-col md:flex-row items-center justify-center lg:justify-start"
          >
            <CountUp
              end={item.counter_number}
              duration={5}
              delay={2}
              className="text-4xl lg:text-6xl font-extrabold"
            />
            <p
              className={`${
                item.counter_text.length < 15 ? "max-w-[100px]" : "max-w-[150px]"
              } leading-snug text-white/80 text-sm`}
            >
              {item?.counter_text}
            </p>
          </div>
        ))}
      </div>
    </section>
  );
};

export default Statistics;
