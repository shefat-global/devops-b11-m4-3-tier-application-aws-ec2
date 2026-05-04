import re
from wagtail import blocks
from wagtail.rich_text import expand_db_html


class APIRichTextBlock(blocks.RichTextBlock):
    def get_api_representation(self, value, context=None):
        if not value:
            return ""

        html = expand_db_html(value.source)

        # remove Draftail editor-only attribute like data-block-key="abc12"
        html = re.sub(r'\sdata-block-key="[^"]*"', "", html)

        return html