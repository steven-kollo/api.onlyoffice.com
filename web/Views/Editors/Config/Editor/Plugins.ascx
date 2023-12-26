<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">Plugins</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The plugins section allows to connect the special add-ons to your Document Server installation which will help you add additional features to document editors.</p>

<div class="header-gray">Parameters</div>
<div id="mobile-content"></div>
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
            <td id="autostart" class="copy-link">autostart</td>
            <td>Defines the array of the identifiers (as entered in <a href="<%= Url.Action("config", "plugin") %>#guid">config.json</a>) for the plugins, which will automatically start when the editor opens, and the order the plugins will run one-by-one.</td>
            <td>array of string</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="pluginsData" class="copy-link">pluginsData</td>
            <td>Defines the array of absolute URLs to the plugin configuration files (<a href="<%= Url.Action("config", "plugin") %>">config.json</a>).</td>
            <td>array of string</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="url" class="copy-link">url</td>
            <td>
                Defines the absolute URL to the directory where the plugins are stored.
                Deprecated since version 4.3, please use the absolute URLs in <a href="#pluginsData">pluginsData</a> field.
            </td>
            <td>string</td>
            <td>"https://example.com/plugins/"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/plugins.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<p>
    The <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed and the plugins are placed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<p>
    If you have any further questions, please contact us at
    <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
</p>


<div id="controlFields" style="padding-right:20px;">
    <div id="plugins" class="control-panel">
        <div id="holder_editorConfig_plugins_autostart" class="config_object_holder">
            <div class="line">
                <label for="editorConfig_plugins_autostart">Autostart</label>
                <div id="plugins_autostart_0" class="line plugins_autostart">
                    <input type="text" id="editorConfig_plugins_autostart_0" name="editorConfig_plugins_autostart_0" value="asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}">
                </div>
            </div>
        </div>
        <button id="addButton_plugins_autostart" class="add-button" style="margin-top: 4px;">+</button>
        <div id="holder_editorConfig_plugins_pluginsData" class="config_object_holder">
            <div class="line">
                <label for="editorConfig_plugins_pluginsData">Plugins Data</label>
                <div id="plugins_pluginsData_0" class="line plugins_pluginsData">
                    <input type="text" id="editorConfig_plugins_pluginsData_0" name="editorConfig_plugins_pluginsData_0" value="https://example.com/plugins/chess-plugin/config.json">
                </div>
            </div>
        </div>
        <button id="addButton_plugins_pluginsData" class="add-button" style="margin-top: 4px;">+</button>
    </div>
</div>
<div id="configPreHolder">
    <pre style="word-wrap: break-word;" id="configPre"></pre>
</div>


<div id="editorSpace">
    <div style="min-width: 832px; min-height: 550px;" id="placeholder"></div>
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
                    //CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
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

    $('#addButton_plugins_autostart').click(addItem);
    $('#addButton_plugins_pluginsData').click(addItem);
    function addItem(e) {
        var itemType = "autostart";
        if (e.target.id == "addButton_plugins_pluginsData") {
            itemType = "pluginsData";
        }

        var elements = document.getElementsByClassName(`plugins_${itemType}`);
        var i = 0;
        while (elements[i] != undefined) {
            i++;
        }
        console.log(i)
        let div = document.createElement("div");
        div.innerHTML = `
        <div class="plugins_${itemType}" id="plugins_${itemType}_${i}" class="line">
            <input type="text" id="editorConfig_plugins_${itemType}_${i}" name="editorConfig_plugins_${itemType}_${i}" value="">
        </div>`;
        document.getElementById(`holder_editorConfig_plugins_${itemType}`).appendChild(div);
        $("#controlFields").find("input,select").change(function () {
            updateConfig();
        });
        resizeCodeInput();
        updateConfig();
    }

    $("#controlFields").find("input,select").change(function () {
        updateConfig();
    });

    function showHideConfigObject(e) {
        var hidden = document.getElementById(`holder_${e.target.id}`).hidden;
        document.getElementById(`holder_${e.target.id}`).hidden = !hidden;
        resizeCodeInput();
    }

    function getParamStr(param) {
        var string = "";
        var elements = document.getElementsByClassName(`plugins_${param}`);
        var i = 0;
        while (elements[i] != undefined) {
            var value = getFieldValue(`editorConfig_plugins_${param}_${i}`);
            if (value.toString().indexOf("asc.{") != -1 || value.toString().indexOf("http") != -1) {
                string += string == "" ? value : "," + "\n        " + value;
            }
            i++;
        }
        var param_str = `
      "${param}": [
        ${string}
      ]`;
        return param_str;
    }

    function updateConfig() {
        var config_str = `{${getParamStr("autostart")},${getParamStr("pluginsData")}
    }`;
        config_string =`var docEditor = new DocsAPI.DocEditor("placeholder", {
  "editorConfig": {
    "plugins": ${config_str},
    ...
  },
  ...          
});
`;
        var config_object = JSON.parse(config_str);

        config.editorConfig.plugins = config_object;
        
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
            if (controlFieldInputs[i].id.includes("plugins") && controlFieldInputs[i].type == "text") {
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