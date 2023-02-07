<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Examples of editors working outside
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Examples of editors working outside</span>
    </h1>
    <p class="dscr">Fill in empty cells</p>

    <div id="controlsBlock" name="controlsBlock" class="docbuilder-script">
        <div class="left-half"></div>
        <div class="right-half"></div>
    </div>


    <ul class="list-buttons doc-builder-list-buttons">
        <li>
            <a id="load" class="button disabled">LOAD</a>
        </li>
        <li>
            <a id="delete" class="button disabled">DELETE</a>
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
                            FileType = "oform",
                            Key = "apiwh" + Guid.NewGuid(),
                            Permissions = new Config.DocumentConfig.PermissionsConfig(),
                            Title = "Demo.oform",
                            Url = ConfigurationManager.AppSettings["storage_demo_url"] + "withtags.oform"
                        },
                    DocumentType = "word",
                    EditorConfig = new Config.EditorConfigConfiguration
                        {
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

            connector.executeMethod("GetAllContentControls", null, function (data) {
                setTimeout(function () { // without setTimeout, the first time the loop is executed, an array of content controls is returned
                    for (let i = 0; i < data.length; i++) {
                        switch (data[i].Tag) {
                            case "Male":
                                data[i].GroupKey = "Sex";
                                data[i].Type = "radio";
                                break;
                            case "Female":
                                data[i].GroupKey = "Sex";
                                data[i].Type = "radio";
                                break;
                            default:
                                data[i].Type = "input";
                        }

                        connector.executeMethod("GetFormValue", [data[i]["InternalId"]], function (value) {
                            data[i].Value = value ? value : "";
                            if (data.length - 1 == i) {
                                contentControls = data.filter(function (element) {
                                    return element["Tag"] != "";
                                });

                                renderForm();
                            }
                        });
                    }
                }, 0);
            });
        };

        config.events = {
            onDocumentReady: onDocumentReady,
        };

        window.docEditor = new DocsAPI.DocEditor("placeholder", config);

        var renderForm = function () {
            var controlsBlockLeftHalf = $("#controlsBlock .left-half");
            var controlsBlockRightHalf = $("#controlsBlock .right-half");

            if (contentControls.length != 0) {
                $(".list-buttons a").removeClass("disabled");
            }

            for (const element of contentControls) {
                var targetElement = controlsBlockLeftHalf;

                if (contentControls.indexOf(element) >= contentControls.length / 2) { targetElement = controlsBlockRightHalf };

                targetElement.append($("<label>", {
                        "text": element["Tag"].replace(/([a-z])([A-Z])/g, '$1 $2')
                    }))
                    .append($("<input>", {
                        "value": element["Value"]
                    }));
            }
        };

        $("#load").on("click", function () {
            if ($(this).hasClass("disabled")) { return; }

            var values = Array.from($("#controlsBlock input"), input => input.value);

            for (var i = 0; i < contentControls.length; i++) {
                connector.executeMethod(
                    "SetFormValue",
                    [contentControls[i]["InternalId"], values[i]],
                    null
                );
            }
        });

        $("#delete").on("click", function () {
            if ($(this).hasClass("disabled")) { return; }

            $("#controlsBlock input").val("");

            for (var i = 0; i < contentControls.length; i++) {
                connector.executeMethod(
                    "SetFormValue",
                    [contentControls[i]["InternalId"], ""],
                    null
                );
            }
        });
    </script>

</asp:Content>
