<%@ Import Namespace="ASC.Api.Web.Help.Models" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<MarkDownViewModel>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Integration Examples
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%= Html.Raw(Model.Content) %>

    <table class="demo-tab-panel">
        <tr>
            <td>
                <a class="<%= Request["type"] != "spreadsheet" && Request["type"] != "presentation"  ? "active" : "" %>" href="<%= Url.Action("demopreview") %>?type=text#DemoPreview">Demo Document editor</a>
            </td>
            <td>
                <a class="<%= Request["type"] == "spreadsheet" ? "active" : "" %> demo-tab-center" href="<%= Url.Action("demopreview") %>?type=spreadsheet#DemoPreview">Demo Spreadsheet editor</a>
            </td>
            <td>
                <a class="<%= Request["type"] == "presentation" ? "active" : "" %>" href="<%= Url.Action("demopreview") %>?type=presentation#DemoPreview">Demo Presentation editor</a>
            </td>
        </tr>
    </table>

    <div class="demo-block">
        <div id="placeholder"></div>
    </div>

    <p>
        If you have any further questions, please contact us at
        <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceholder" runat="server">

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <% var ext = Request["type"] == "spreadsheet" ? "xlsx" : Request["type"] == "presentation" ? "pptx" : "docx"; %>
    <script type="text/javascript">
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = ext,
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Title." + ext,
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + ext,
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Download = false,
                                        Print = false
                                    }
                            },
                        DocumentType = Request["type"] ?? "text",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                                            {
                                                Visible = true
                                            },
                                        HideRightMenu = true
                                    }
                            },
                        Height = "550px",
                        Width = "100%"
                    }) %>
            );
    </script>

</asp:Content>
