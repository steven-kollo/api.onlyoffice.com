<%@ Page
    Title=""
    Language="C#"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<%@ Import Namespace="ASC.Web.Core.Files" %>

<!DOCTYPE html>
<html style="height: 100%;">
<head>
    <title>ONLYOFFICE™ Api Documentation</title>
</head>
<body style="height: 100%; margin: 0;">
    <div id="placeholder" style="height: 100%"></div>
    <script type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_api_url"] ?? "" %>"></script>

    <script type="text/javascript">
        <% switch (Request["method"])
           { %>

        <% case "docxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "xlsxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "spreadsheet",
                "document": {
                    "fileType": "xlsx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xlsx",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "pptxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "presentation",
                "document": {
                    "fileType": "pptx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.pptx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pptx",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "docEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "doc",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.doc",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.doc",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "xlsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "spreadsheet",
                "document": {
                    "fileType": "xls",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.xls",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xls",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "pptEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "presentation",
                "document": {
                    "fileType": "ppt",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.ppt",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.ppt",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "odtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "odt",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.odt",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.odt",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "odsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "spreadsheet",
                "document": {
                    "fileType": "ods",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.ods",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.ods",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "odpEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "presentation",
                "document": {
                    "fileType": "odp",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.odp",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.odp",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "txtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "txt",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.txt",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.txt",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "csvEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "spreadsheet",
                "document": {
                    "fileType": "csv",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.csv",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.csv",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "pdfViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "pdf",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.pdf",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pdf",
                },
                "editorConfig": {
                    "mode": "view",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "docxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "editorConfig": {
                    "mode": "view",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "xlsxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "spreadsheet",
                "document": {
                    "fileType": "xlsx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xlsx",
                },
                "editorConfig": {
                    "mode": "view",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "pptxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "presentation",
                "document": {
                    "fileType": "pptx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.pptx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pptx",
                },
                "editorConfig": {
                    "mode": "view",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "docxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= Request["key"] %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "editorConfig": {
                    "user": {
                        "firstname": "<%= Request["firstname"] %>",
                        "id": "<%= Guid.NewGuid().ToString() %>",
                        "lastname": "<%= Request["lastname"] %>",
                    },
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "xlsxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "spreadsheet",
                "document": {
                    "fileType": "xlsx",
                    "key": "apiwh<%= Request["key"] %>",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xlsx",
                },
                "editorConfig": {
                    "user": {
                        "firstname": "<%= Request["firstname"] %>",
                        "id": "<%= Guid.NewGuid().ToString() %>",
                        "lastname": "<%= Request["lastname"] %>",
                    },
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "pptxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "presentation",
                "document": {
                    "fileType": "pptx",
                    "key": "apiwh<%= Request["key"] %>",
                    "title": "Example Presentation Title.pptx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pptx",
                },
                "editorConfig": {
                    "user": {
                        "firstname": "<%= Request["firstname"] %>",
                        "id": "<%= Guid.NewGuid().ToString() %>",
                        "lastname": "<%= Request["lastname"] %>",
                    },
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "rebrandingDocxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "editorConfig": {
                    "customization": {
                        "customer": {
                            "address": "My City, 123a-45",
                            "info": "Some additional information",
                            "logo": "<%= new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString() %>",
                            "mail": "john@example.com",
                            "name": "John Smith and Co.",
                            "www": "example.com",
                        },
                        "logo": {
                            "image": "<%= new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString() %>",
                            "url": "http://example.com",
                        },
                    },
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "rebrandingXlsxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "spreadsheet",
                "document": {
                    "fileType": "xlsx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xlsx",
                },
                "editorConfig": {
                    "customization": {
                        "customer": {
                            "address": "My City, 123a-45",
                            "info": "Some additional information",
                            "logo": "<%= new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString() %>",
                            "mail": "john@example.com",
                            "name": "John Smith and Co.",
                            "www": "example.com",
                        },
                        "logo": {
                            "image": "<%= new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString() %>",
                            "url": "http://example.com",
                        },
                    },
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "rebrandingPptxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "presentation",
                "document": {
                    "fileType": "pptx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.pptx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pptx",
                },
                "editorConfig": {
                    "customization": {
                        "customer": {
                            "address": "My City, 123a-45",
                            "info": "Some additional information",
                            "logo": "<%= new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString() %>",
                            "mail": "john@example.com",
                            "name": "John Smith and Co.",
                            "www": "example.com",
                        },
                        "logo": {
                            "image": "<%= new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString() %>",
                            "url": "http://example.com",
                        },
                    },
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "docxReview": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                    "permissions": {
                        "edit": false,
                        "review": true,
                    },
                },
                "editorConfig": {
                    "mode": "edit",
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "docxPlugins": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "documentType": "text",
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "editorConfig": {
                    "plugins": {
                        "pluginsData": [
                            "chess/config.json",
                            "clipart/config.json",
                            "ocr/config.json",
                            "speech/config.json",
                            "youtube/config.json"
                        ],
                        "url": "https://d2ettrnqo7v976.cloudfront.net/sdkjs-plugins/4.1/",
                    },
                },
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% } %>
    </script>
</body>
</html>
