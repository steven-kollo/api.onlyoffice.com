<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    比较文档
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">比较文档</span>
    </h1>
    <p class="dscr">参考图和以下步骤说明了在 ONLYOFFICE 文档服务器中比较文档的过程。</p>
    <img alt="比较文档" src="<%= Url.Content("~/content/img/editor/compare.png") %>" />
    <ol>
        <li>用户使用 <b>文档管理器</b> 打开文档以进行查看或编辑，文档管理器可以在他/她的浏览器中找到。</li>
        <li><b>文档存储服务</b> 使用 <a href="<%= Url.Action("basic") %>">JavaScript API</a>
            将文档信息发送到 <b>文档编辑器</b>，并指定从 <b>文档管理器</b>中选择文件的可能性。</li>
        <li><a href="<%= Url.Action("open") %>">打开</a> 文件进行编辑。</li>
        <li>用户通过单击 <b>文档编辑器</b>中的 <em>来自存储的文档</em> 按钮发送请求以获取存储文档列表以进行比较。</li>
        <li><b>文档编辑器</b> 将请求通知 <b>文档管理器</b>。</li>
        <li><b>文档管理器</b> 将文档发送给 <b>文档编辑器</b> 进行比较。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建一个 <em>html</em> 文件来 <a href="<%= Url.Action("open") %>#apply">打开文档</a>。</li>
        <li>
            <p>
                指定 <em>来自存储的文档</em> 按钮的事件处理程序，这个按钮显示在文档编辑器初始化的配置脚本的 <em>比较</em>
                选项中。当用户点击按钮时，会调用
                <a href="<%= Url.Action("config/events") %>#onRequestCompareFile">onRequestCompareFile</a> 事件，他们可以从存储中选择要比较的文档。
            </p>
            <img class="screenshot max-width-832" alt="比较文件" src="<%= Url.Content("~/content/img/editor/onRequestCompareFile.png") %>" />
            <pre>
var onRequestCompareFile = function() {
    docEditor.setRevisedFile({
        "fileType": "docx",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
        "url": "https://example.com/url-to-example-document.docx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestCompareFile": onRequestCompareFile,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                为了选择一个文档进行比较，必须调用 <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> 方法。
                When calling this method, the token must be added to validate the parameters.
            </p>
            <pre>
docEditor.setRevisedFile({
    "fileType": "docx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
    "url": "https://example.com/url-to-example-document.docx"
});
</pre>
        </li>
        <li>
            <p>
                之后，用户可以使用顶部工具栏上的相应按钮接受或拒绝更改。
            </p>
            <img class="screenshot max-width-832" alt="接受更改" width="832px" src="<%= Url.Content("~/content/img/editor/compare-documents.png") %>" />
        </li>
    </ol>
</asp:Content>
