<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/document") %>"></a>
    <span class="hdr">Document Info</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The document info section allows to change additional parameters for the document (document owner, folder where the document is stored, uploading date, sharing settings).</p>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="author" class="copy-link">author</td>
            <td>
                Defines the name of the document author/creator.
                Deprecated since version 5.4, please use <a href="#owner">owner</a> instead.
            </td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr class="tablerow">
            <td id="created" class="copy-link">created</td>
            <td>
                Defines the document creation date.
                Deprecated since version 5.4, please use <a href="#uploaded">uploaded</a> instead.
            </td>
            <td>string</td>
            <td>"2010-07-07 3:46 PM"</td>
        </tr>
        <tr>
            <td id="favorite" class="copy-link">favorite</td>
            <td>
                Defines the highlighting state of the <em>Favorite</em> icon.
                When the user clicks the icon, the <a href="<%= Url.Action("config/events") %>#onMetaChange">onMetaChange</a> event is called.
                If the parameter is <em>undefined</em>, the <em>Favorite</em> icon is not displayed at the editor window header.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/favorite.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="folder" class="copy-link">folder</td>
            <td>Defines the folder where the document is stored (can be empty in case the document is stored in the root folder).</td>
            <td>string</td>
            <td>"Example Files"</td>
        </tr>
        <tr class="tablerow">
            <td id="owner" class="copy-link">owner</td>
            <td>Defines the name of the document owner/creator.</td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr>
            <td id="sharingSettings" class="copy-link">sharingSettings</td>
            <td>Displays the information about the settings which allow to share the document with other users:
                <ul>
                    <li>
                        <b>isLink</b> - changes the user icon to the link icon,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: false;
                    </li>
                    <li>
                        <b>permissions</b> - the access rights for the user with the name above.
                        Can be <b>Full Access</b>, <b>Read Only</b> or <b>Deny Access</b>,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Full Access";
                    </li>
                    <li>
                        <b>user</b> - the name of the user the document will be shared with,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "John Smith".
                    </li>
                </ul>
            </td>
            <td>array of object</td>
            <td>[
    {
        "permissions": "Full Access",
        "user": "John Smith"
    }
]</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/sharing_settings.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="uploaded" class="copy-link">uploaded</td>
            <td>Defines the document uploading date.</td>
            <td>string</td>
            <td>"2010-07-07 3:46 PM"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/info.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>

<div id="controlFields" style="padding-right:20px;">
    <div id="info" class="control-panel">
        <div class="line">
            <label for="documentConfig_info_folder">Folder</label>
            <input type="text" id="documentConfig_info_folder" name="documentConfig_info_folder" value="Example Files">
        </div>
        <div class="line">
            <label for="documentConfig_info_owner">Owner</label>
            <input type="text" id="documentConfig_info_owner" name="documentConfig_info_owner" value="John Smith">
        </div>
        <div class="line">
            <label for="documentConfig_info_uploaded">Uploaded</label>
            <input type="text" id="documentConfig_info_uploaded" name="documentConfig_info_uploaded" value="2010-07-07 3:46 PM">
        </div>
        <div class="line">
            <input type="checkbox" id="documentConfig_info_favorite" name="documentConfig_info_favorite" checked>
            <label for="documentConfig_info_favorite">Favorite</label>
        </div>
        <div class="line">
            <input type="checkbox" id="documentConfig_info_sharingSettings" name="documentConfig_info_sharingSettings" checked>
            <label for="documentConfig_info_sharingSettings">Sharing Settings</label>
        </div>
        <div id="holder_documentConfig_info_sharingSettings" class="config_object_holder" style="padding-left: 20px;">
            <div id="holder_documentConfig_info_sharingSettings_0" class="documentConfig_info_sharingSettingsItem">
                <div class="line">
                    <label for="documentConfig_info_sharingSettings_permissions_0">Permissions</label>
                    <select id="documentConfig_info_sharingSettings_permissions_0" name="documentConfig_info_sharingSettings_permissions_0">
                        <option value="Full Access" selected>Full Access</option>
                        <option value="Read Only">Read Only</option>
                        <option value="Deny Access">Deny Access</option>
                    </select>
                </div>
                <div class="line">
                    <label for="documentConfig_info_sharingSettings_user_0">User</label>
                    <input type="text" id="documentConfig_info_sharingSettings_user_0" name="documentConfig_info_sharingSettings_user_0" value="John Smith">
                </div>
                <div class="line">
                    <input type="checkbox" id="documentConfig_info_sharingSettings_isLink_0" name="documentConfig_info_sharingSettings_isLink_0">
                    <label for="documentConfig_info_sharingSettings_isLink_0">Is Link</label>
                </div>
                <hr />
            </div> 
        </div>
        <div style="padding-left: 20px;">
            <button id="addButton_info_sharingSettings" class="add-button">+</button>
        </div>
    </div>
</div>
<div id="configPreHolder">
    <pre id="configPre"></pre>
</div>


<div id="editorSpace">
    <div id="placeholder"></div>
</div>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
<script type="text/javascript">

    // Editor window
    var config = <%= Config.Serialize(
    new Config {
        Document = new Config.DocumentConfig
            {
                FileType = "docx",
                Key = "apiwh" + Guid.NewGuid(),
                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                Title = "Example Title." + "docx",
                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "docx" 
            },
        DocumentType = "word",
        EditorConfig = new Config.EditorConfigConfiguration
            {
                CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                    {
                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                            {
                                Request = false
                            },
                        Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                            {
                                Visible = true
                            },
                        IntegrationMode = "embed",
                }
            },
        Height = "550px",
        Width = "100%"
    }) %>;
    window.docEditor = new DocsAPI.DocEditor("placeholder", config);
</script>

<script>
    $(document).ready(function () {
        resizeCodeInput();
        updateConfig();
    });

    $("#controlFields").find("input,select").change(function () {
        updateConfig();
    });

    $('#addButton_info_sharingSettings').click(addSharingSettingItem);
    $("#documentConfig_info_sharingSettings").change(showHideConfigObject);
   
    function showHideConfigObject(e) {
        var hidden = document.getElementById(`holder_${e.target.id}`).hidden;
        document.getElementById(`holder_${e.target.id}`).hidden = !hidden;
        resizeCodeInput();
    }

    function addSharingSettingItem() {
        var sharingSettingElements = document.getElementsByClassName("documentConfig_info_sharingSettingsItem");
        var i = 0;
        while (sharingSettingElements[i] != undefined) {
            i++;
        }
        let div = document.createElement("div");
        div.innerHTML = `
        <div id="holder_documentConfig_info_sharingSettings_${i}" class="documentConfig_info_sharingSettingsItem">
            <div class="line">
                <label for="documentConfig_info_sharingSettings_permissions_${i}">Permissions</label>
                <select id="documentConfig_info_sharingSettings_permissions_${i}" name="documentConfig_info_sharingSettings_permissions_${i}">
                    <option value="Full Access">Full Access</option>
                    <option value="Read Only" selected>Read Only</option>
                    <option value="Deny Access">Deny Access</option>
                </select>
            </div>
            <div class="line">
                <label for="documentConfig_info_sharingSettings_user_${i}">User</label>
                <input type="text" id="documentConfig_info_sharingSettings_user_${i}" name="documentConfig_info_sharingSettings_user_${i}" value="New user ${i}">
            </div>
            <div class="line">
                <input type="checkbox" id="documentConfig_info_sharingSettings_isLink_${i}" name="documentConfig_info_sharingSettings_isLink_${i}">
                <label for="documentConfig_info_sharingSettings_isLink_${i}">Is Link</label>
            </div>
            <hr />
        </div>`;
        document.getElementById("holder_documentConfig_info_sharingSettings").appendChild(div);
        $("#controlFields").find("input,select").change(function () {
            updateConfig();
        });
        resizeCodeInput();
        updateConfig();
    }

    function getSharingSettings() {
        if (!getFieldValue("documentConfig_info_sharingSettings")) {
            return "";
        }
        var sharingSettingsString = "";
        var sharingSettingElements = document.getElementsByClassName("documentConfig_info_sharingSettingsItem");
        var i = 0;
        while (sharingSettingElements[i] != undefined) {
            var isLink = !getFieldValue("documentConfig_info_sharingSettings_isLink_" + i) ? "" : `,
                    "isLink": ${true}`;
        
            var string = `
                {
                    "permissions": ${getFieldValue("documentConfig_info_sharingSettings_permissions_" + i)},
                    "user": ${getFieldValue("documentConfig_info_sharingSettings_user_" + i)}${isLink}
                }`;
            sharingSettingsString += sharingSettingsString == "" ? string : "," + string;
            i++;
        }
        return sharingSettingsString == "" ? "" : `"sharingSettings": [${sharingSettingsString}
            ],
            `;
    }

    function updateConfig() {
        var sharingSettings = "";
        if (getFieldValue("documentConfig_info_sharingSettings")) {
            sharingSettings = getSharingSettings();
            document.getElementById("addButton_info_sharingSettings").hidden = false;
        } else {
            document.getElementById("addButton_info_sharingSettings").hidden = true;
        }

        var info = `{
            "favorite": ${getFieldValue("documentConfig_info_favorite")},
            "folder": ${getFieldValue("documentConfig_info_folder")},
            "owner": ${getFieldValue("documentConfig_info_owner")},
            ${sharingSettings}"uploaded": ${getFieldValue("documentConfig_info_uploaded")}     
        }`;
        var config_string =
            `var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "info": ${info}
        ,
        ...
    },
    ...
});
`;
        var info_object = JSON.parse(info);
        config.document.info = info_object;
        window.docEditor.destroyEditor();
        window.docEditor = new DocsAPI.DocEditor("placeholder", config);

        var pre = document.getElementById("configPre");
        pre.innerHTML = config_string;
        hljs.highlightBlock(pre);
    }

    function getFieldValue(id) {
        var element = document.getElementById(id);
        if (element.type == "checkbox") {
            return element.checked;
        } else if (isNaN(element.value)) {
            return `"${element.value}"`;
        } else {
            return Number(element.value);
        }
    }

    function resizeCodeInput() {
        var controlFieldPaddingBottom = 0;
        var controlFieldInputs = document.getElementsByTagName("input");
        var i = 0;
        while (controlFieldInputs[i] != undefined) {
            if (controlFieldInputs[i].id.includes("customization") && controlFieldInputs[i].type == "text") {
                controlFieldPaddingBottom = Number(getComputedStyle(controlFieldInputs[i]).paddingBottom.split("px")[0]);
                break;
            }
            i++;
        }
        var paddingTop = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingTop.split("px")[0]);
        var paddingBottom = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingBottom.split("px")[0]);
        var borderSize = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).border.split("px")[0]);
        var fieldsHeight = Number(getComputedStyle(document.getElementById("controlFields")).height.split("px")[0]);

        var offset = (paddingTop + paddingBottom + (borderSize * 2) + controlFieldPaddingBottom);
        var configPreHeight = fieldsHeight - (offset) + "px";
        document.getElementById("configPre").style.height = configPreHeight;
    }
</script>