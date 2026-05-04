from django.db import models
from wagtail.models import Page, Orderable
from wagtail.admin.panels import (
    FieldPanel,
    InlinePanel,
    MultiFieldPanel,
)
from wagtail.fields import StreamField
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
from wagtail.api import APIField
from wagtail import blocks
from wagtail.snippets.models import register_snippet


@register_snippet
class ResumeCategory(models.Model):
    """Resume category snippet model"""
    title = models.CharField(max_length=100, unique=True)

    panels = [
        FieldPanel("title"),
    ]

    class Meta:
        verbose_name = "Resume Category"
        verbose_name_plural = "Resume Categories"

    def __str__(self):
        return self.title


@register_snippet
class ResumeTag(models.Model):
    """Resume tag snippet model"""
    title = models.CharField(max_length=100, unique=True)

    panels = [
        FieldPanel("title"),
    ]

    class Meta:
        verbose_name = "Resume Tag"
        verbose_name_plural = "Resume Tags"

    def __str__(self):
        return self.title


@register_snippet
class LanguageTag(models.Model):
    """Language tag snippet model"""
    title = models.CharField(max_length=100, unique=True)

    panels = [
        FieldPanel("title"),
    ]

    class Meta:
        verbose_name = "Language Tag"
        verbose_name_plural = "Language Tags"

    def __str__(self):
        return self.title


class ResumeOrderable(Orderable, ClusterableModel):
    """Resume item for resume page"""
    page = ParentalKey(
        "resume.ResumeIndexPage",
        related_name="resume_items",
        on_delete=models.CASCADE
    )

    title = models.CharField(
        max_length=100,
        blank=True,
        default="Resume Title"
    )
    sub_title = models.CharField(
        max_length=100,
        blank=True,
        default="Resume Sub Title"
    )
    description = StreamField(
        [
            (
                "content",
                blocks.RichTextBlock(
                    features=["bold", "italic", "link", "ol", "li", "ul", "hr", "h3"],
                    template="blocks/richtext.html"
                )
            ),
        ],
        blank=True,
        use_json_field=True,        
    )

    panels = [
        FieldPanel("title"),
        FieldPanel("sub_title"),
        FieldPanel("description"),
        MultiFieldPanel(
            [
                InlinePanel("category_items", label="Category"),
            ],
            heading="Resume Categories"
        ),
        MultiFieldPanel(
            [
                InlinePanel("tag_items", label="Tag"),
            ],
            heading="Resume Tags"
        ),
        MultiFieldPanel(
            [
                InlinePanel("language_items", label="Language"),
            ],
            heading="Language Tags"
        ),
    ]

    @property
    def category_titles(self):
        return [item.category.title for item in self.category_items.all() if item.category]

    @property
    def resume_tag_titles(self):
        return [item.tag.title for item in self.tag_items.all() if item.tag]

    @property
    def language_tag_titles(self):
        return [item.language.title for item in self.language_items.all() if item.language]

    api_fields = [
        APIField("title"),
        APIField("sub_title"),
        APIField("description"),
        APIField("category_titles"),
        APIField("resume_tag_titles"),
        APIField("language_tag_titles"),
    ]

    def __str__(self):
        return self.title


class ResumeItemCategory(Orderable):
    """Attach one category to one resume item"""
    resume_item = ParentalKey(
        "resume.ResumeOrderable",
        related_name="category_items",
        on_delete=models.CASCADE
    )
    category = models.ForeignKey(
        "resume.ResumeCategory",
        on_delete=models.CASCADE,
        related_name="+"
    )

    panels = [
        FieldPanel("category"),
    ]

    def __str__(self):
        return str(self.category)


class ResumeItemTag(Orderable):
    """Attach one tag to one resume item"""
    resume_item = ParentalKey(
        "resume.ResumeOrderable",
        related_name="tag_items",
        on_delete=models.CASCADE
    )
    tag = models.ForeignKey(
        "resume.ResumeTag",
        on_delete=models.CASCADE,
        related_name="+"
    )

    panels = [
        FieldPanel("tag"),
    ]

    def __str__(self):
        return str(self.tag)


class ResumeItemLanguage(Orderable):
    """Attach one language to one resume item"""
    resume_item = ParentalKey(
        "resume.ResumeOrderable",
        related_name="language_items",
        on_delete=models.CASCADE
    )
    language = models.ForeignKey(
        "resume.LanguageTag",
        on_delete=models.CASCADE,
        related_name="+"
    )

    panels = [
        FieldPanel("language"),
    ]

    def __str__(self):
        return str(self.language)


class ResumeIndexPage(Page):
    """Resume index page model"""
    parent_page_types = ["home.HomePage"]
    subpage_types = []
    max_count = 1

    content_panels = Page.content_panels + [
        MultiFieldPanel(
            [
                InlinePanel("resume_items", label="Resume Items"),
            ],
            heading="Resume Items"           
        )
    ]

    api_fields = [
        APIField("resume_items"),
    ]

    class Meta:
        verbose_name = "Resume Page"
        verbose_name_plural = "Resume Pages"