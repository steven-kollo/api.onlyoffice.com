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
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "documentType": "text",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "xlsxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xlsx",
                },
                "documentType": "spreadsheet",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "pptxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.pptx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pptx",
                },
                "documentType": "presentation",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "docEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "doc",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.doc",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.doc",
                },
                "documentType": "text",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "xlsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xls",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.xls",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xls",
                },
                "documentType": "spreadsheet",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "pptEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "ppt",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.ppt",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.ppt",
                },
                "documentType": "presentation",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "odtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "odt",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.odt",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.odt",
                },
                "documentType": "text",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "odsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "ods",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.ods",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.ods",
                },
                "documentType": "spreadsheet",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "odpEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "odp",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.odp",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.odp",
                },
                "documentType": "presentation",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "txtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "txt",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.txt",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.txt",
                },
                "documentType": "text",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "csvEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "csv",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.csv",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.csv",
                },
                "documentType": "spreadsheet",
                "height": "100%",
                "width": "100%",
            });
        <% break; %>

        <% case "pdfViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pdf",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.pdf",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pdf",
                },
                "documentType": "text",
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
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "documentType": "text",
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
                "document": {
                    "fileType": "xlsx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xlsx",
                },
                "documentType": "spreadsheet",
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
                "document": {
                    "fileType": "pptx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.pptx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pptx",
                },
                "documentType": "presentation",
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
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= Request["key"] %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "documentType": "text",
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
                "document": {
                    "fileType": "xlsx",
                    "key": "apiwh<%= Request["key"] %>",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xlsx",
                },
                "documentType": "spreadsheet",
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
                "document": {
                    "fileType": "pptx",
                    "key": "apiwh<%= Request["key"] %>",
                    "title": "Example Presentation Title.pptx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pptx",
                },
                "documentType": "presentation",
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
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "documentType": "text",
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
                "document": {
                    "fileType": "xlsx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.xlsx",
                },
                "documentType": "spreadsheet",
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
                "document": {
                    "fileType": "pptx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Presentation Title.pptx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.pptx",
                },
                "documentType": "presentation",
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
                "documentType": "text",
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
                "document": {
                    "fileType": "docx",
                    "key": "apiwh<%= DocumentService.GenerateRevisionId(Guid.NewGuid().ToString()) %>",
                    "title": "Example Document Title.docx",
                    "url": "<%= ConfigurationManager.AppSettings["storage_demo_url"] %>demo.docx",
                },
                "documentType": "text",
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
