from django.db import models
from wagtail.admin.panels import FieldPanel, MultiFieldPanel
from wagtail.contrib.settings.models import BaseSiteSetting, register_setting
from wagtail.api import APIField
from wagtail.images.api.fields import ImageRenditionField

# Create your models here.

@register_setting
class SiteSetting(BaseSiteSetting):
    site_title = models.CharField(max_length=255, default='My Site')

    site_logo = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    site_favicon = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    cv = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    email = models.EmailField(blank=True)
    phone = models.CharField(max_length=20, blank=True)
    address = models.TextField(blank=True)

    facebook_url = models.URLField(blank=True)
    twitter_url = models.URLField(blank=True)
    linkedin_url = models.URLField(blank=True)
    youtube_url = models.URLField(blank=True)
    instagram_url = models.URLField(blank=True)

    panels = [
        MultiFieldPanel(
            [
                FieldPanel('site_title'),
                FieldPanel('site_logo'),
                FieldPanel('site_favicon'),
                FieldPanel('cv'),
                FieldPanel('email'),
                FieldPanel('phone'),
                FieldPanel('address'),
                FieldPanel('facebook_url'),
                FieldPanel('twitter_url'),
                FieldPanel('linkedin_url'),
                FieldPanel('youtube_url'),
                FieldPanel('instagram_url'),
            ], heading="Site Settings"
        )
    ]


    def cv_url(self):
        return self.cv.file.url if self.cv else ""


    api_fields = [
        APIField('site_title'),
        APIField(
            "site_logo_url",
            serializer=ImageRenditionField("fill-200x80", source="site_logo"),
        ),
        APIField(
            "site_favicon_url",
            serializer=ImageRenditionField("fill-64x64", source="site_favicon"),
        ),
        APIField("cv_url"),
        APIField('email'),
        APIField('phone'),
        APIField('address'),
        APIField('facebook_url'),
        APIField('twitter_url'),
        APIField('linkedin_url'),
        APIField('youtube_url'),
        APIField('instagram_url'),
    ]


    class Meta: 
        verbose_name = 'Site Setting'

    def __str__(self):
        return self.site_title or "Site Settings"
