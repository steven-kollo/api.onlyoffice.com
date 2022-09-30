<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    内联编辑器
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">内联编辑器</span>
    </h1>
    <p class="dscr">下面的步骤解释了在 ONLYOFFICE 文档服务器中将多个编辑器连接到同一个 html 页面的过程。</p>
    <div class="note">从 5.5 版开始，可以与多个编辑器同时工作。</div>
    <img alt="内联编辑器" src="<%= Url.Content("~/content/img/editor/inlineEditors.png") %>" />
    <ol>
        <li>创建一个空的 <em>html</em> 文件。</li>
        <li>
            <p>
                使用将用于您的网站的 JavaScript API 指定您的 ONLYOFFICE 文档服务器链接：
            </p>
            <pre>&lt;script type=&quot;text/javascript&quot; src=&quot;https://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;</pre>
            <p>
                其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称。
            </p>
        </li>
        <li>
            <p>
                添加 <em>div</em> 元素，如下所示。
                为了将多个编辑器连接到同一个 <em>html</em> 页面，可以分别初始化它们中的每一个：
            </p>
            <pre>
&lt;div id="placeholder1"&gt;&lt;/div&gt;
&lt;div id="placeholder2"&gt;&lt;/div&gt;
&lt;div id="placeholder3"&gt;&lt;/div&gt;
...
</pre>
        </li>
        <li>
            <p>
                为<em>div</em> 元素添加 <b>文档编辑器</b> 初始化脚本以及要打开的文档的配置。
                每个编辑器都有自己的初始化脚本：
            </p>
            <pre>
var documentEditor = new DocsAPI.DocEditor("placeholder1", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word"
});

var spreadsheetEditor = new DocsAPI.DocEditor("placeholder2", {
    "document": {
        "fileType": "xlsx",
        "key": "af86C7e71Ca8",
        "title": "Example Spreadsheet Title.xlsx",
        "url": "https://example.com/url-to-example-spreadsheet.xlsx"
    },
    "documentType": "cell"
});

var presentationEditor = new DocsAPI.DocEditor("placeholder3", {
    "document": {
        "fileType": "pptx",
        "key": "bv48M5r64Sf9",
        "title": "Example Presentation Title.pptx",
        "url": "https://example.com/url-to-example-presentation.pptx"
    },
    "documentType": "slide"
});
...
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            </p>
        </li>
        <li>
            <p>
                为了完成编辑，必须调用 <a href="<%= Url.Action("methods") %>#destroyEditor">destroyEditor</a> 方法来关闭所需的编辑器：
            </p>
            <pre>
documentEditor.destroyEditor();
spreadsheetEditor.destroyEditor();
presentationEditor.destroyEditor();
...
</pre>
        </li>
        <li>
            <p>
                在浏览器中打开您的 <em>html</em> 文件。
            </p>
        </li>
    </ol>
</asp:Content>
