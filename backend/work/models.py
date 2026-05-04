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
from wagtail.snippets.models import register_snippet
from wagtail.images.api.fields import ImageRenditionField
from modelcluster.models import ClusterableModel

from .blocks import APIRichTextBlock


# Create your models here.


@register_snippet
class WorkTag(models.Model):
    """Work tag snippet model"""
    title = models.CharField(max_length=100, unique=True)

    panels = [
        FieldPanel("title"),
    ]

    class Meta:
        verbose_name = "Work Tag"
        verbose_name_plural = "Work Tags"

    def __str__(self):
        return self.title
    

class WorkItemTag(Orderable):
    """Attach one work tag to one work item"""
    work_item = ParentalKey(
        "work.WorkOrderable",
        related_name="work_tag_items",
        on_delete=models.CASCADE
    )
    tag = models.ForeignKey(
        "work.WorkTag",
        on_delete=models.CASCADE,
        related_name="+"
    )
    panels = [
        FieldPanel("tag"),
    ] 
    def __str__(self):
        return str(self.tag)


class WorkOrderable(Orderable, ClusterableModel):
    """Work orderable model"""
    page = ParentalKey(
        "work.WorkIndexPage",
        related_name="work_items",
        on_delete=models.CASCADE
    )

    serial_number = models.IntegerField(
        blank=True,
        null=True,
        help_text="The order of the work item in the list"
    )  

    title = models.CharField(max_length=255)

    description = StreamField(
        [
            (
                "content",
                APIRichTextBlock(
                    features=["bold", "italic", "link", "ol", "li", "ul", "hr", "h3"],
                    template="blocks/richtext.html"
                )
            ),
        ],
        blank=True,
        use_json_field=True,        
    )  
 
    project_url = models.URLField(blank=True, help_text="URL to the project, e.g. live demo")
    repo_url = models.URLField(blank=True, help_text="URL to the code repository, e.g. GitHub")  

    work_image = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )


    panels = [
           
        MultiFieldPanel(
            [
                FieldPanel("serial_number"),
                FieldPanel("title"),
                FieldPanel("description"),  
                FieldPanel("project_url"),   
                FieldPanel("repo_url"),    
                FieldPanel("work_image"), 
                InlinePanel("work_tag_items", label="Work Tags"),
            ],
            heading="Work Item"
        ),       
    ]


    def tags(self):
        return [item.tag.title for item in self.work_tag_items.all()]


    api_fields = [
        APIField("serial_number"),
        APIField("title"),
        APIField("description"),
        APIField("project_url"),
        APIField("repo_url"),
        APIField("tags"),      
        APIField("work_image_url",
                 serializer=ImageRenditionField("fill-600x780", source="work_image")   
        )
    ]


    def __str__(self):
        return self.title


class WorkIndexPage(Page):
    """Work Index Page Model"""
    parent_page_types = ["home.HomePage"]
    subpage_types = []
    max_count = 1

    content_panels = Page.content_panels + [
        MultiFieldPanel(
            [
                InlinePanel("work_items", label="Work Items"),
            ],
            heading="Work Items"           
        )
    ]

    api_fields = [
        APIField("work_items"),
    ]

    class Meta:
        verbose_name = "Work Page"
        verbose_name_plural = "Work Pages"


