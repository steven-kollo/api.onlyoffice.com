<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">插件</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">插件部分允许将特殊附加组件连接到您的文档服务器安装，这将帮助您向文档编辑器添加附加功能。</p>

<div class="header-gray">示例</div>
<p>
    The <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed and the plugins are placed.
    请参阅<a href="<%= Url.Action("howitworks") %>">工作原理</a>部分，了解有关文档服务器服务客户端与服务器交互的更多信息。
</p>

<p>
    If you have any further questions, please contact us at
    <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
</p>

<div id="controlFields">
    <div id="plugins" class="control-panel">
        <div id="holder_editorConfig_plugins_autostart">
            <div class="line input_line" style="margin-top: 0px;">
                <label for="plugins_autostart_0">Autostart</label>
                <div id="plugins_autostart_0" style="margin-top: 0px;" class="line input_line plugins_autostart">
                    <input type="text" id="editorConfig_plugins_autostart_0" name="editorConfig_plugins_autostart_0" value="asc.{7327FC95-16DA-41D9-9AF2-0E7F449F6800}">
                </div>
            </div>
        </div>
        <button id="addButton_plugins_autostart" class="add-button" style="margin-top: 12px;">+</button>
        <div id="holder_editorConfig_plugins_pluginsData">
            <div class="line input_line">
                <label for="plugins_pluginsData_0">Plugins Data</label>
                <div id="plugins_pluginsData_0" style="margin-top: 0px;" class="line input_line plugins_pluginsData">
                    <input type="text" id="editorConfig_plugins_pluginsData_0" name="editorConfig_plugins_pluginsData_0" value="https://example.com/plugins/chess-plugin/config.json">
                </div>
            </div>
        </div>
        <button id="addButton_plugins_pluginsData" class="add-button" style="margin-top: 12px;">+</button>
    </div>
</div>
<div id="configPreHolder">
    <pre style="word-wrap: break-word;" id="configPre"></pre>
</div>

<div id="editorSpace">
    <div style="min-width: 832px; min-height: 550px;" id="placeholder"></div>
</div>

<div class="header-gray">参数</div>
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
            <td>名称</td>
            <td>描述</td>
            <td>类型</td>
            <td>示例</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="autostart" class="copy-link">autostart</td>
            <td>定义插件的标识符数组（在 <a href="<%= Url.Action("config", "plugin") %>#guid">config.json</a>中输入），它将在编辑器打开时自动启动，并且插件将依次运行。</td>
            <td>string数组</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="pluginsData" class="copy-link">pluginsData</td>
            <td>定义插件配置文件 (<a href="<%= Url.Action("config", "plugin") %>">config.json</a>) 的绝对 URL 数组。</td>
            <td>string数组</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="url" class="copy-link">url</td>
            <td>
                定义存储插件的目录的绝对 URL。
                自 4.3 版起已弃用，请在 <a href="#pluginsData">pluginsData</a> 字段中使用绝对 URL。
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
                    Title = "Example Title",
                    Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "docx",
                    Info = new Config.DocumentConfig.InfoConfig()
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
        let div = document.createElement("div");
        div.innerHTML = `
        <div class="plugins_${itemType} line input_line" id="plugins_${itemType}_${i}">
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
        var paddingTop = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingTop.split("px")[0]);
        var paddingBottom = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingBottom.split("px")[0]);
        var borderSize = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).border.split("px")[0]);
        var controlFieldsHeight = Math.round(document.getElementById("controlFields").getBoundingClientRect().height * 100) / 100;

        var offset = paddingTop + paddingBottom + (borderSize * 2);
        var height = controlFieldsHeight - offset;

        document.getElementById("configPre").style.height = `${height}px`;
    }
</script>