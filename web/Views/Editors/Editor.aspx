<%@ Page
    Title=""
    Language="C#"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<!DOCTYPE html>
<html style="height: 100%;">
<head>
    <title>ONLYOFFICE Api Documentation</title>
</head>
<body style="height: 100%; margin: 0;">

    <div id="placeholder" style="height: 100%"></div>
    <script type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_api_url"] ?? "" %>"></script>

    <script type="text/javascript">
        <% switch (Request["method"])
           { %>

        <% case "docxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "xlsxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "spreadsheet",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "pptxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "presentation",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "docEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "doc",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.doc",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.doc"
                            },
                        DocumentType = "text",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "xlsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xls",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xls",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xls"
                            },
                        DocumentType = "spreadsheet",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "pptEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "ppt",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.ppt",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.ppt"
                            },
                        DocumentType = "presentation",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "odtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "odt",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.odt",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.odt"
                            },
                        DocumentType = "text",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "odsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "ods",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.ods",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.ods"
                            },
                        DocumentType = "spreadsheet",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "odpEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "odp",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.odp",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.odp"
                            },
                        DocumentType = "presentation",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "txtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "txt",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.txt",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.txt"
                            },
                        DocumentType = "text",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "csvEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "csv",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.csv",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.csv"
                            },
                        DocumentType = "spreadsheet",
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "pdfViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pdf",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.pdf",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pdf"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "docxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "xlsxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "pptxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "docxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "xlsxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "pptxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "docxStrictCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Autosave = false
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "xlsxStrictCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Autosave = false
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "pptxStrictCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Autosave = false
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "rebrandingDocxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Customer = new Config.EditorConfigConfiguration.CustomizationConfig.CustomerConfig
                                            {
                                                Address = "My City, 123a-45",
                                                Info = "Some additional information",
                                                Logo = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString(),
                                                Mail = "john@example.com",
                                                Name = "John Smith and Co.",
                                                Www = "example.com"
                                            },
                                        Logo = new Config.EditorConfigConfiguration.CustomizationConfig.LogoConfig
                                            {
                                                Image = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString(),
                                                Url = "http://example.com"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "rebrandingXlsxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Customer = new Config.EditorConfigConfiguration.CustomizationConfig.CustomerConfig
                                            {
                                                Address = "My City, 123a-45",
                                                Info = "Some additional information",
                                                Logo = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString(),
                                                Mail = "john@example.com",
                                                Name = "John Smith and Co.",
                                                Www = "example.com"
                                            },
                                        Logo = new Config.EditorConfigConfiguration.CustomizationConfig.LogoConfig
                                            {
                                                Image = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString(),
                                                Url = "http://example.com"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "rebrandingPptxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Customer = new Config.EditorConfigConfiguration.CustomizationConfig.CustomerConfig
                                            {
                                                Address = "My City, 123a-45",
                                                Info = "Some additional information",
                                                Logo = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString(),
                                                Mail = "john@example.com",
                                                Name = "John Smith and Co.",
                                                Www = "example.com"
                                            },
                                        Logo = new Config.EditorConfigConfiguration.CustomizationConfig.LogoConfig
                                            {
                                                Image = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString(),
                                                Url = "http://example.com"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "docxReview": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Edit = false,
                                        Review = true
                                    }
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "docxComment": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Comment = true,
                                        Edit = false
                                    }
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "xlsxComment": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Comment = true,
                                        Edit = false
                                    }
                            },
                        DocumentType = "spreadsheet",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "pptxComment": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Comment = true,
                                        Edit = false
                                    }
                            },
                        DocumentType = "presentation",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% case "docxPlugins": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Plugins = new Config.EditorConfigConfiguration.PluginsConfig
                                    {
                                        PluginsData = new List<string>
                                            {
                                                "https://d2ettrnqo7v976.cloudfront.net/sdkjs-plugins/4.1/chess/config.json",
                                                "https://d2ettrnqo7v976.cloudfront.net/sdkjs-plugins/4.1/clipart/config.json",
                                                "https://d2ettrnqo7v976.cloudfront.net/sdkjs-plugins/4.1/ocr/config.json",
                                                "https://d2ettrnqo7v976.cloudfront.net/sdkjs-plugins/4.1/speech/config.json",
                                                "https://d2ettrnqo7v976.cloudfront.net/sdkjs-plugins/4.1/youtube/config.json"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    },
                true) %>
            );
        <% break; %>

        <% } %>
    </script>
</body>
</html>
