from rest_framework import serializers
from .models import ContactSubmission

# contact submission serializer for API endpoint

class ContactSubmissionSerializer(serializers.ModelSerializer):
    class Meta: 
        model = ContactSubmission
        fields = ["name", "email", "subject", "message", "phone", "address", "service_category"]

    def validate_name(self, value):
        value = value.strip()
        if len(value) < 2:
            raise serializers.ValidationError("Name must be at least 2 characters long.")
        return value 
    
    def validate_email(self, value):
        return value.strip().lower()
    
    def validate_message(self, value):
        value = value.strip()
        if len(value) < 10:
            raise serializers.ValidationError("Message must be at least 10 characters long.")
        return value
    
    def validate_phone(self, value):
        value = value.strip()
        if value and len(value) < 11:
            raise serializers.ValidationError("Phone number must be at least 11 characters long.")
        return value 
    


