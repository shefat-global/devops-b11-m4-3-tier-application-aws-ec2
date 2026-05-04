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


# Create your models here.

# @register_snippet
# class ServiceCategory(models.Model):
#     """Service category snippet model"""
#     title = models.CharField(max_length=100, unique=True)
#     slug = models.SlugField(
#         verbose_name="slug",
#         allow_unicode=True,
#         max_length=255,         
#         unique=True,
#         help_text="A slug to identify the category. It should be unique and can contain letters, numbers, hyphens, and underscores."
#         )

#     panels = [
#         FieldPanel("title"),
#         FieldPanel("slug"),
#     ]

#     class Meta:
#         verbose_name = "Service Category"
#         verbose_name_plural = "Service Categories"

#     def __str__(self):
#         return self.title
    

# Django Model to store contact form submissions

STATUS_CHOICES = [
    ("new", "New"),
    ("contacted", "Contacted"),
    ("closed", "Closed"),
]
class ContactSubmission(models.Model):
    name = models.CharField(max_length=120)
    email = models.EmailField()
    subject = models.CharField(max_length=255, blank=True)
    message = models.TextField()
    phone = models.CharField(max_length=20, blank=True)

    address = models.CharField(max_length=255, blank=True)
    service_category = models.CharField(max_length=150, blank=True)

    created_at = models.DateTimeField(auto_now_add=True, db_index=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default="new", db_index=True)

    class Meta: 
        ordering = ['-created_at']
        verbose_name = "Contact Submission"
        verbose_name_plural = "Contact Submissions"

    def __str__(self):
        return f"{self.name} - {self.email}"