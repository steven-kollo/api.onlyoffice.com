<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Work with review
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Work with review</span>
    </h1>
    <p class="dscr">We need to pull all of the tracked changes form the document </p>

    <ul class="list-buttons doc-builder-list-buttons">
        <li>
            <a id="accept" class="button disabled">ACCEPT</a>
        </li>
        <li>
            <a id="reject" class="button disabled">REJECRT</a>
        </li>
        <li>
            <a id="prev" class="button disabled"><</a>
        </li>
        <li>
            <a id="next" class="button disabled">></a>
        </li>
    </ul>

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <div id="editorSpace">
        <div id="placeholder"></div>
    </div>

    <script type="text/javascript">
        var contentControls = [];
        var indexComment = 0;

        var config = <%= Config.Serialize(
            new Config
                {
                    Document = new Config.DocumentConfig
                        {
                            FileType = "docx",
                            Key = "apiwh" + Guid.NewGuid(),
                            Permissions = new Config.DocumentConfig.PermissionsConfig
                            {
                                 Edit = false,
                                 Review = true
                            },
                            Title = "Demo.docx",
                            Url = ConfigurationManager.AppSettings["storage_demo_url"] + "review.docx"
                        },
                    DocumentType = "word",
                    EditorConfig = new Config.EditorConfigConfiguration
                        {
                            Mode = "edit",
                            CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                            Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                {
                                    HideRightMenu = true,
                                    HideRulers = true,
                                    IntegrationMode = "embed",
                                }
                        },
                    Height = "550px",
                    Width = "100%"
                }) %>;

        var onDocumentReady = function () {
            window.connector = docEditor.createConnector();

            $(".list-buttons a").removeClass("disabled");
        };

        config.events = {
            onDocumentReady: onDocumentReady,
        };

        window.docEditor = new DocsAPI.DocEditor("placeholder", config);

        $("#accept").on("click", function () {
            connector.executeMethod("AcceptReviewChanges");
        });

        $("#reject").on("click", function () {
            connector.executeMethod("RejectReviewChanges");
        });

        $("#prev").on("click", function () {
            connector.executeMethod("MoveToNextReviewChange", [false]);
        });

        $("#next").on("click", function () {
            connector.executeMethod("MoveToNextReviewChange");
        });
    </script>

</asp:Content>
