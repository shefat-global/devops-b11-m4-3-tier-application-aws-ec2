from wagtail import hooks
from wagtail.admin.viewsets.model import ModelViewSet
from .models import ContactSubmission 


# Register the ContactSubmission model in the Wagtail admin interface

class ContactSubmissionViewSet(ModelViewSet):
    model = ContactSubmission 
    menu_label = "Contact Submissions"
    icon = "mail"
    menu_icon = "mail"
    menu_order = 200
    add_to_admin_menu = True

    list_display = ("name", "email", "phone", "subject", "service_category", "status", "created_at")
    list_filter = ["status", "created_at"]
    search_fields =["name", "email", "subject", "phone", "service_category"]

    # Optional: control which fields appear in create/edit forms
    form_fields = ["name", "email", "subject", "message", "phone", "address", "service_category", "status"]

contact_submission_viewset = ContactSubmissionViewSet("contact_submissions")


@hooks.register("register_admin_viewset")
def register_contact_submission_viewset():
    return contact_submission_viewset