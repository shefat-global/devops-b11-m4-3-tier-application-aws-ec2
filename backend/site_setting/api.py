from rest_framework.response import Response
from rest_framework import serializers
from wagtail.api.v2.views import BaseAPIViewSet
from wagtail.images.api.fields import ImageRenditionField

from .models import SiteSetting


class SiteSettingsSerializer(serializers.ModelSerializer):
    site_logo_url = ImageRenditionField(
        "fill-200x80",
        source="site_logo",
        read_only=True
    )
    site_favicon_url = ImageRenditionField(
        "fill-64x64",
        source="site_favicon",
        read_only=True
    )
    cv_url = serializers.SerializerMethodField()

    class Meta: 
        model = SiteSetting
        fields = [
            "site_title",
            "site_logo_url",
            "site_favicon_url",
            "cv_url",
            "email",
            "phone",
            "address",
            "facebook_url",
            "twitter_url",
            "linkedin_url",
            "youtube_url",
            "instagram_url",
        ]

    def get_cv_url(self, obj):
        return obj.cv.file.url if obj.cv and obj.cv.file else ""


class SiteSettingsAPIViewSet(BaseAPIViewSet):
    model = SiteSetting
    name = "site-settings"

    def listing_view(self, request):
        settings_obj = SiteSetting.for_request(request=request)
        serializer = SiteSettingsSerializer(
            settings_obj,
            context={"request": request}
        )
        return Response(serializer.data)