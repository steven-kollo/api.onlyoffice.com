<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">插件</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">插件部分允许将特殊附加组件连接到您的文档服务器安装，这将帮助您向文档编辑器添加附加功能。</p>

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
                <img src="<%= Url.Content("~/content/img/editor/plugins.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>

<div class="header-gray">示例</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "plugins": {
             "autostart": [
                 "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
                 "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
                 ...
             ],
             "pluginsData": [
                 "https://example.com/plugin1/config.json",
                 "https://example.com/plugin2/config.json",
                 ...
             ]
        },
        ...
    },
    ...
});
</pre>
<p>
    其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 以及放置插件的服务器的名称。
    有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
</p>

<p>
    如果您有任何其他问题，
    请通过 <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com与我们联系</a>。
</p>

