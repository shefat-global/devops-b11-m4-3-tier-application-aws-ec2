from django.db import models
from wagtail.models import Page, Orderable
from wagtail.admin.panels import ( 
    FieldPanel, 
    InlinePanel, 
    MultiFieldPanel,    
)
from wagtail.fields import StreamField
from modelcluster.fields import ParentalKey
from wagtail.api import APIField
from wagtail import blocks


# Create your models here.


class ServiceListOrderable(Orderable):
    """Service list item for service list page"""
    page = ParentalKey("service.ServicePage", related_name="service_items", on_delete=models.CASCADE)

    card_serial = models.IntegerField(
        blank = True,
        null = True
    )

    card_title = models.CharField(
        max_length = 100,
        blank = True,
        default = "Card Title"
    )

    card_summary = StreamField([
            (
                "content", blocks.RichTextBlock(
                    features=['bold','italic', 'link', 'ol', 'li', 'ul', 'hr', 'h3'],
                    template = 'blocks/richtext.html'
                )
            ),
        ],
        blank=True
    )

    cta_text = models.CharField(max_length=100, blank=True)
    cta_page = models.ForeignKey(
        Page,
        null = True,
        blank = True,
        on_delete = models.SET_NULL,
        related_name = "+"
    )
    cta_url = models.URLField(blank=True)

    @property
    def cta_link(self):
        if self.cta_page: 
            return self.cta_page.url
        elif self.cta_url:
            return self.cta_url
        return None
    
    @property
    def button_text(self):
        return self.cta_text if self.cta_text else "Read More"

    panels = [
        FieldPanel("card_serial"),
        FieldPanel("card_title"),
        FieldPanel("card_summary"),
        FieldPanel("cta_text"),
        FieldPanel("cta_page"),
        FieldPanel("cta_url"),
    ]

    api_fields = [
        APIField("card_serial"),
        APIField("card_title"),
        APIField("card_summary"),
        APIField("cta_link"),
        APIField("button_text"),
    ]


class ServicePage(Page):
    """Service page model"""
  
    subpage_types = []
    parent_page_types = ['home.HomePage']
    max_count=1

    service_list_title = models.CharField(
        max_length = 100,
        blank = True,
        default = "Service List Title"
    ) 

    content_panels = Page.content_panels + [
        FieldPanel("service_list_title"),
        MultiFieldPanel([
            InlinePanel("service_items", label="Service Item")
            ],
            heading="Service Items"
        )
    ]
    
    api_fields = [
        APIField("service_list_title"),
        APIField("service_items")        
    ]

    class Meta: 
        verbose_name = "Service Page"
        verbose_name_plural = "Service Pages"


# api output at http://127.0.0.1:8000/api/v2/pages/4/