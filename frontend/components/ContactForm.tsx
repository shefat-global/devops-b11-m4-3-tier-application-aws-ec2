"use client";

import React, { useState } from "react";
import { Input } from "./ui/input";
import { Textarea } from "./ui/textarea";
import { Button } from "./ui/button";
import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectLabel,
  SelectTrigger,
  SelectValue,
} from "./ui/select";
import SuccessMsg from "./SuccessMsg";
import { useToast } from "@/hooks/use-toast";

const ContactForm = () => {
  const { toast } = useToast();
  const [status, setStatus] = useState("");
  const [success, setSuccess] = useState(false);
  const [isLoading, setLoading] = useState(false);

  const [formData, setFormData] = useState({
    Name: "",
    Email: "",
    Subject: "",
    Phone: "",
    Address: "",
    Message: "",
    ServiceCategory: "",
  });

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSelectChange = (value: string) => {
    setFormData((prevData) => ({
      ...prevData,
      ServiceCategory: value,
    }));
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (
      !formData.Name.trim() ||
      !formData.Email.trim() ||
      !formData.Subject.trim() ||
      !formData.Message.trim()
    ) {
      toast({
        title: "Error",
        description: "Please fill in name, email, subject, and message",
        variant: "destructive",
      });
      return;
    }

    try {
      setLoading(true);

      const response = await fetch("http://127.0.0.1:8000/api/contact/form/", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name: formData.Name,
          email: formData.Email,
          subject: formData.Subject,
          message: formData.Message,
          phone: formData.Phone,
          address: formData.Address,
          service_category: formData.ServiceCategory,
        }),
      });

      const data = await response.json();

      if (response.ok) {
        setSuccess(true);
        setStatus(data.message || "Success! Your message has been sent.");
        setFormData({
          Name: "",
          Email: "",
          Subject: "",
          Phone: "",
          Address: "",
          Message: "",
          ServiceCategory: "",
        });

        toast({
          title: "Success",
          description: data.message || "Message sent successfully",
        });
      } else {
        setStatus(data.error || "Error! Unable to send your message.");
        toast({
          title: "Error",
          description: data.error || "Something went wrong",
          variant: "destructive",
        });
      }
    } catch (error) {
      console.error("Error:", error);
      setStatus("Error! Something went wrong.");
      toast({
        title: "Error",
        description: "Server connection failed",
        variant: "destructive",
      });
    } finally {
      setLoading(false);
    }
  };

  return (
    <form className="space-y-4" onSubmit={handleSubmit}>
      <h3 className="text-2xl md:text-4xl text-lightSky">
        Let&apos;s work together
      </h3>

      <p className="text-white/60 text-sm md:text-base">
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nihil velit
        vel saepe fugiat ex aperiam, totam quae et tenetur deleniti.
      </p>

      {success ? (
        <SuccessMsg status={status} />
      ) : (
        <>
          <div className="flex flex-col gap-4">
            <div className="flex flex-col md:flex-row gap-4 items-center">
              <Input
                type="text"
                id="Name"
                name="Name"
                required
                placeholder="Your name"
                value={formData.Name}
                onChange={handleChange}
              />
              <Input
                type="email"
                id="Email"
                name="Email"
                required
                placeholder="Email address"
                value={formData.Email}
                onChange={handleChange}
              />
            </div>

            <Input
              type="text"
              id="Subject"
              name="Subject"
              required
              placeholder="Subject"
              value={formData.Subject}
              onChange={handleChange}
            />

            <div className="flex flex-col md:flex-row gap-4 items-center">
              <Input
                type="text"
                id="Phone"
                name="Phone"
                placeholder="Phone number"
                value={formData.Phone}
                onChange={handleChange}
              />
              <Input
                type="text"
                id="Address"
                name="Address"
                placeholder="Address"
                value={formData.Address}
                onChange={handleChange}
              />
            </div>

            <Textarea
              name="Message"
              placeholder="Text here"
              value={formData.Message}
              onChange={handleChange}
              rows={5}
            />

            <Select
              onValueChange={handleSelectChange}
              value={formData.ServiceCategory}
            >
              <SelectTrigger>
                <SelectValue placeholder="Select a service" />
              </SelectTrigger>
              <SelectContent className="bg-bodyColor text-white border-white/20">
                <SelectGroup>
                  <SelectLabel>Select a service</SelectLabel>
                  <SelectItem value="Web Development">Web Development</SelectItem>
                  <SelectItem value="UI/UX Design">UI/UX Design</SelectItem>
                  <SelectItem value="Logo Design">Logo Design</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>

          <Button
            disabled={isLoading}
            type="submit"
            className="w-full py-4 bg-lightSky/5 text-white/80 border border-lightSky/20 hover:bg-lightSky/10 hover:border-lightSky hover:text-hoverColor hoverEffect"
          >
            {isLoading ? "Submitting message..." : "Send Message"}
          </Button>
        </>
      )}
    </form>
  );
};

export default ContactForm;