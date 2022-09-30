<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        编辑问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="editing_1">
    <dt>什么是'回调处理程序'，我为什么需要它？</dt>
    <dd>
        <p><b>文档编辑服务</b> 通知 <b>文档存储服务</b> 有关文档编辑的状态，并通过 <em>callbackUrl</em>发送包含所有必要数据的响应，在配置文件中指定如下：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx"
    },
    ...
});</pre>
        <p>这里的 <b>https://example.com/url-to-callback.ashx</b> 是特殊处理程序的地址，它可以处理来自 <b>文档编辑服务</b> 的响应和带有 <em>错误的响应：0</em> 状态代码。此处理程序可以用您选择的编程语言编写。</p>
        <p>所有可以发送到回调处理程序的参数及其描述都可以在 <a href="<%= Url.Action("callback") %>">这个页面</a>找到。</p>
        <p>关于如何实现此处理程序，下列编程语言有示例：<a href="<%= Url.Action("callback") %>#csharp">.Net (C#)</a>、 <a href="<%= Url.Action("callback") %>#java">Java</a>、 <a href="<%= Url.Action("callback") %>#nodejs">Node.js</a>、 <a href="<%= Url.Action("callback") %>#php">PHP</a>、 <a href="<%= Url.Action("callback") %>#ruby">Ruby</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="editing_2">
    <dt>什么是 document.key 参数？</dt>
    <dd>
        <p><em>Document.key</em> 参数是一个唯一的文档标识符，它有助于将文档与其他文档区分开来，并由编辑服务明确地识别它。</p>
        <p>每次更改文档时，还必须重新生成 <em>document.key</em> 参数，因为具有已知键的文档是从缓存中获取的。</p>
        <p>有关此参数的更多信息，请参见 <a href="<%= Url.Action("config/document") %>#key">此处</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="editing_3">
    <dt>如何定义打开文件的模式（查看或编辑）？</dt>
    <dd>
        <p>要定义文档打开模式，请使用 <em>editorConfig.mode</em> 参数。它可以获取两个值：</p>
        <ul>
            <li><b>edit</b> 默认使用，允许打开文档文件进行编辑（如果相应的 <a href="<%= Url.Action("config/document/permissions") %>">document.permissions</a> 参数也设置为 <b>true</b>）；</li>
            <li><b>view</b> 允许在主工具栏和禁用编辑的情况下打开文档进行查看。</li>
        </ul>
        <p>使用配置文件的 <em>editorConfig</em> 部分设置模式：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
        <p>有关此参数的更多信息，请参见 <a href="<%= Url.Action("config/editor") %>#mode">此处</a>。</p>
    </dd>
</dl>