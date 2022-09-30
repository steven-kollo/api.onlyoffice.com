<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">嵌入式</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">
    嵌入部分仅适用于 <b>嵌入</b> 文档类型（请参阅 <a href="<%= Url.Action("config/") %>#type">配置</a> 部分以了解如何定义 <b>嵌入</b> 文档类型）。
    它允许更改定义嵌入模式中按钮行为的设置。
</p>

<div class="header-gray">参数</div>
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
            <td id="embedUrl" class="copy-link">embedUrl</td>
            <td>定义文档的绝对 URL，作为嵌入网页的文档的源文件。</td>
            <td>string</td>
            <td>"https://example.com/embedded?doc=exampledocument1.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="fullscreenUrl" class="copy-link">fullscreenUrl</td>
            <td>定义将以全屏模式打开的文档的绝对 URL。</td>
            <td>string</td>
            <td>"https://example.com/embedded?doc=exampledocument1.docx#fullscreen"</td>
        </tr>
        <tr class="tablerow">
            <td id="saveUrl" class="copy-link">saveUrl</td>
            <td>定义允许将文档保存到用户个人计算机上的绝对 URL。</td>
            <td>string</td>
            <td>"https://example.com/download?doc=exampledocument1.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="shareUrl" class="copy-link">shareUrl</td>
            <td>定义允许其他用户共享此文档的绝对 URL。</td>
            <td>string</td>
            <td>"https://example.com/view?doc=exampledocument1.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="toolbarDocked" class="copy-link">toolbarDocked</td>
            <td>定义嵌入式查看器工具栏的位置，可以是 <b>top</b> 或 <b>bottom</b>。</td>
            <td>string</td>
            <td>"top"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/embedded.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">示例</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "embedded": {
            "embedUrl": "https://example.com/embedded?doc=exampledocument1.docx",
            "fullscreenUrl": "https://example.com/embedded?doc=exampledocument1.docx#fullscreen",
            "saveUrl": "https://example.com/download?doc=exampledocument1.docx",
            "shareUrl": "https://example.com/view?doc=exampledocument1.docx",
            "toolbarDocked": "top"
        },
        ...
    },
    ...
});
</pre>
<p>
    其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
    有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
</p>
