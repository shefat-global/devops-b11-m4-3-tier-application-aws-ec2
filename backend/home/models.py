from django.db import models
from wagtail.models import Page, Orderable
from wagtail.admin.panels import ( 
    FieldPanel, 
    InlinePanel, 
    MultiFieldPanel,    
)
from modelcluster.fields import ParentalKey
from wagtail.api import APIField
from wagtail.images.api.fields import ImageRenditionField



class HeroCounter(Orderable):
    """Between 1 and 4 counter item for the home page counter"""
    page = ParentalKey("home.HomePage", related_name="counter_items", on_delete=models.CASCADE)
    
    counter_number = models.IntegerField(      
        blank=True,
        null=True
    )

    counter_text = models.CharField(
        max_length=100,
        blank=True,
        default="Counter Text"
    )    

    panels = [
        FieldPanel("counter_number"),
        FieldPanel("counter_text"),
    ]

    api_fields = [
        APIField("counter_number"),
        APIField("counter_text"),
    ]



class HomePage(Page):
    """Home Page Model"""
    parent_page_types = [
        'wagtailcore.Page'
    ]
    max_count = 1

    hero_title = models.CharField(
        max_length=100,
        blank=True,
        default="Hero Title"
    )

    hero_subtitle = models.CharField(
        max_length=100,
        blank=True,
        default="Hero Subtitle"
    )

    hero_sub_subtitle = models.CharField(
        max_length=100,
        blank=True,
        default="Hero Subtitle"
    )

    hero_description = models.TextField(
        max_length=500,  
        blank = True,
        default = "Hero Description"
    )

    hero_image = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )

    content_panels = Page.content_panels + [
        MultiFieldPanel([
            FieldPanel("hero_title"),
            FieldPanel("hero_subtitle"),
            FieldPanel("hero_sub_subtitle"),
            FieldPanel("hero_description"),
            FieldPanel("hero_image"),
        ], heading="Hero Options"),

        MultiFieldPanel([
            InlinePanel("counter_items", min_num=1, max_num=4, label="Counter Item")
        ], heading="Hero Counters"),
    ]

    api_fields = [
        APIField("hero_title"),
        APIField("hero_subtitle"),
        APIField("hero_sub_subtitle"),
        APIField("hero_description"),
        APIField("counter_items"),
        APIField("hero_image"),
        APIField("hero_image_url",
                 serializer=ImageRenditionField("fill-600x780", source="hero_image")   
        )
    ]


    class Meta:
        verbose_name = "Home Page"
        verbose_name_plural = "Home Pages"