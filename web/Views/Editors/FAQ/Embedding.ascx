<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        嵌入问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="embedding_1">
    <dt>如何将文档嵌入到网站？</dt>
    <dd>
        <p>编辑器有三种主要外观，针对不同用途进行了优化：</p>
        <ul>
            <li><b>desktop</b>，针对桌面计算机浏览器中的显示进行了优化；</li>
            <li><b>mobile</b>，针对移动设备浏览器中的显示进行了优化；</li>
            <li><b>embedded</b>，针对将文档嵌入网页进行了优化。</li>
        </ul>
        <p>您可以将具有任何外观的文档嵌入到您的网页中，但使用特定的 <b>嵌入</b> 显示类型更合乎逻辑，并且只为网页内的文档显示的编辑器提供主要控件。</p>
        <p>这就是为什么 <em>type</em> 应该设置为 <b>embedded</b> 并且配置文件看起来像这样：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "type": "embedded",
    ...
});</pre>
        <p>有关显示类型的更多信息，请参见 <a href="<%= Url.Action("config") %>#type">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="embedding_2">
    <dt>如何更改嵌入模式下按钮的行为？</dt>
    <dd>
        <p>嵌入模式只允许使用三个控制按钮显示文档：<b>下载</b>、 <b>共享</b> 和 <b>嵌入</b>。您可以通过以下方式更改这些按钮的行为：</p>
        <ul>
            <li><em>editorConfig.embedded.embedUrl</em> 是配置中 <em>type</em> 参数设置为 <b>embedded</b> 的文档的绝对URL，其他用户可以使用该URL将其嵌入到自己的网站页面中。</li>
            <li><em>editorConfig.embedded.saveUrl</em> 是 <em>document.permission.download</em> 参数设置为 <b>true</b>的文档的绝对 URL，其他用户可以根据文件类型以 <em>DOCX</em>、 <em>PPTX</em> 或 <em>XLSX</em> 格式将其保存到自己的计算机上。</li>
            <li><em>editorConfig.embedded.shareUrl</em> 是文档的绝对 URL，其他用户可以使用它与他人共享。</li>
        </ul>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "embedded": {
            "embedUrl": "https://example.com/embedded?doc=exampledocument1.docx",
            "saveUrl": "https://example.com/download?doc=exampledocument1.docx",
            "shareUrl": "https://example.com/view?doc=exampledocument1.docx",
            ...
        },
        ...
    },
    ...
});</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>
        <p>要删除这些按钮中的任何一个，只需在配置文件中不要包含相应的参数。</p>
        <div class="note">如果您决定隐藏 <b>下载</b> 按钮（<em>editorConfig.embedded.saveUrl</em> 参数），请不要忘记将文档配置中的 <em>document.permission.download</em> 参数设置为 <b>false</b> 以完全禁用下载文件的可能性。</div>
        <p>有关嵌入参数的更多信息，请参见 <a href="<%= Url.Action("config/editor/embedded") %>">此页面</a>。</p>
    </dd>
</dl>