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
                                contentControls = preparingArrayContentControls(data);

                                renderForm();
                            }
                        });
                    }
                }, 0);
            });

            connector.attachEvent("onChangeContentControl", onChangeContentControl);
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

                switch (element.Type) {
                    case "input":
                        targetElement.append($("<label>", {
                            "text": element["Tag"].replace(/([a-z])([A-Z])/g, "$1 $2")
                        })).append($("<input>", {
                            "id": element["InternalId"],
                            "value": element["Value"],
                            "class": "content-control-input"
                        }));
                        break;
                    case "radio":
                        targetElement.append($("<label>", {
                            "text": element["Tag"].replace(/([a-z])([A-Z])/g, "$1 $2")
                        }));

                        for (const option of element["Value"]) {
                            targetElement.append($("<input>", {
                                "id": option["InternalId"],
                                "type": "radio",
                                "checked": option["checked"] == true,
                                "name": element["Tag"],
                                "class": "content-control-radio"
                            })).append($("<label>", {
                                "text": option["Tag"].replace(/([a-z])([A-Z])/g, "$1 $2"),
                                "for": option["Tag"],
                                "class": "label-radio"
                            }));
                        }
                }
                
            }

            $(".content-control-input").keyup(updateContent);
            $(".content-control-radio").change(updateContent);
        };

        function updateContent(e) {
            var id = e.target.id;
            var value = e.target.value;

            if (e.target.classList.contains("content-control-radio")) {
                value = true;
            }

            connector.executeMethod(
                "SetFormValue",
                [id, value],
                null
            );
        };

        function onChangeContentControl(e) {
            connector.executeMethod("GetFormValue", [e["InternalId"]], function (value) {
                if ($("#" + e["InternalId"]).hasClass("content-control-radio")) {
                    $("#" + e["InternalId"]).prop("checked", value);
                } else {
                    $("#" + e["InternalId"]).val(value || "");
                }
            });
        }

        function preparingArrayContentControls(data) {
            data = data.filter(function (element) {
                return element["Tag"] != "";
            });

            let groupsRadioControls = data.filter(contentControl => contentControl["Tag"] != "" && contentControl["Type"] == "radio").reduce((r, a) => {
                r[a["GroupKey"]] = r[a["GroupKey"]] || [];
                r[a["GroupKey"]].push({ Tag: a["Tag"], checked: a["Value"], InternalId: a["InternalId"] });
                return r;
            }, {});

            for (const [key, value] of Object.entries(groupsRadioControls)) {
                let index = [];
                let first = true;

                for (var i = 0; i < data.length; i++) {
                    if (data[i]["GroupKey"] && data[i]["GroupKey"] == key) {
                        index.push(i);
                    }
                }

                for (var i = 0; i < index.length; i++) {
                    if (first) {
                        data[index[i]]["Tag"] = key;
                        data[index[i]]["Value"] = value;
                        first = false;
                    } else {
                        data.splice(index[i], 1);
                    }
                }
            }

            return data;
        };
    </script>

</asp:Content>
