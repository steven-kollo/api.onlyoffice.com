<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    打开文件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">打开文件</span>
    </h1>
    <p class="dscr">参考图和以下步骤说明了在 ONLYOFFICE 文档服务器中打开文档的过程。
    </p><img alt="打开文件" src="<%= Url.Content("~/content/img/editor/opening.svg") %>" />
    <ol>
        <li>用户使用 <b>文档管理器</b> （在他/她的浏览器中找到）打开文档进行查看或编辑。
            <div class="note">浏览器 <b>文档管理器</b> 从 <b>文档存储服务</b>接收用户可用的所有文档的列表。</div>
        </li>
        <li><b>文档存储服务</b> 中的文档标识符和指向它的链接使用 <a href="<%= Url.Action("basic") %>">JavaScript API</a> 发送到 <b>文档编辑器</b>。
        </li>
        <li><b>文档编辑器</b> 向 <b>文档编辑服务</b> 形成请求以打开文档。
            <b>文档编辑器</b> 使用从 <b>文档管理器</b> 接收到的文档标识符及其链接（在步骤 2）。
        </li>
        <li>
            <b>文档编辑服务</b> 使用提供 的ID 和链接从 <b>文档存储服务</b> 下载文档文件。
            在此步骤中，还将文件 <a href="<%= Url.Action("conversion") %>">转换</a> 为 Office Open XML 格式，以使 <b>文档编辑器</b> 具有更好的性能和格式兼容性。
        </li>
        <li>准备就绪后， <b>文档编辑服务</b> 将文档文件传输到基于浏览器的 <b>文档编辑器</b>。</li>
        <li><b>文档编辑器</b> 显示文档文件和/或（在提供适当权限的情况下）允许对其进行编辑。</li>
    </ol>
    <p>编辑完成后，将进行 <a href="<%= Url.Action("save") %>">文档保存</a> 过程。</p>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建一个空的 <em>html</em> 文件。</li>
        <li>添加 <em>div</em> 元素，如下所示。
            <pre>&lt;div id=&quot;placeholder&quot;&gt;&lt;/div&gt;</pre>
        </li>
        <li>使用将用于您的网站的 JavaScript API 指定您的 ONLYOFFICE 文档服务器链接。
            <pre>&lt;script type=&quot;text/javascript&quot; src=&quot;https://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;</pre> 其中
            <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称。
        </li>
        <li>添加脚本，使用要打开的文档的配置为 <em>div</em> 元素初始化 <b>文档编辑器</b>。
            Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. Otherwise, an error will occur.
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCJ9.7IpEJxdOvBQ0kJ8l6ZegIV4tX5vsPbZZCDDVmcFROXc"
});
</pre>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        </li>
        <li>在浏览器中打开您的 <em>html</em> 文件。</li>
    </ol>
</asp:Content>
