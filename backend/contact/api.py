from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework import status

from .serializers import ContactSubmissionSerializer

# contact form API endpoint

class ContactFormAPIView(APIView):
    permission_classes = [AllowAny]

    def post(self, request, *args, **kwargs):
        serializer = ContactSubmissionSerializer(data=request.data)

        if not serializer.is_valid():
            return Response(
                {
                    "success": False,
                    "errors": serializer.errors,
                },
                status=status.HTTP_400_BAD_REQUEST,
            )
        
        submission = serializer.save()


        return Response(
            {
                "success": True, 
                "message": "Your message has been received. We will get back to you shortly.",
                "data": {
                    "id" : submission.id,
                    "name": submission.name,
                    "email": submission.email,
                    "subject": submission.subject,
                    "phone": submission.phone,    
                    "address": submission.address,
                    "service_category": submission.service_category,                
                    "status": submission.status,
                    "created_at": submission.created_at.isoformat(),
                }
            }, 
            status = status.HTTP_201_CREATED,
        )