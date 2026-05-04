from django.urls import path 
from .api import ContactFormAPIView

urlpatterns = [
    path("form/", ContactFormAPIView.as_view(), name="contact_form_api"),
]
