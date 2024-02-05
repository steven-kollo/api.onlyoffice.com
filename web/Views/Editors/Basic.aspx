<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    基本概念
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">基本概念</span>
    </h1>

    <span class="pvl_product">ONLYOFFICE 文档服务器</span><span class="pvl_version">v<%= Products.Get("editors").Version %></span>

    <p class="dscr">
        <a href="<%= Url.Action("getdocs") %>">ONLYOFFICE 文档</a> 是一个开源办公套件，包括文本文档、电子表格、演示文稿和可填写表单的编辑器。
        它提供以下功能：
    </p>
    <ul>
        <li>创建、编辑和查看文本文档、电子表格、演示文稿和可填写表单；</li>
        <li>与其他队友实时协作处理文件。</li>
    </ul>
    <p>ONLYOFFICE 文档还支持用于将您的应用程序与online office集成的 <b>WOPI 协议</b>。
    有关 WOPI 的更多信息，请参见 <a href="<%= Url.Action("wopi") %>">此处</a>。</p>

    <p><b>ONLYOFFICE Docs API</b> is used to let the developers integrate the ONLYOFFICE Document/Spreadsheet/Presentation/Pdf Editors into their own web sites and setup and manage the editors.</p>

    <p>API JavaScript 文件通常可以在以下编辑器文件夹中找到：</p>
    <p><b>https://documentserver/web-apps/apps/api/documents/api.js</b></p>
    <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称。</p>
    <p>要嵌入编辑器的目标 HTML 文件需要有一个占位符 <em>div</em> 标记，这里将传递有关编辑器参数的所有信息：</p>

    <pre>
&lt;div id=&quot;placeholder&quot;&gt;&lt;/div&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;https://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;
</pre>

    <p>包含可变参数的页面代码如下所示：</p>

    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", config);
</pre>

    <p>其中 <em>config</em> 是一个对象：</p>

    <pre>
config = {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx"
    }
};
</pre>
    <p>
        其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
    </p>

    <p>从现在开始， <i>docEditor</i> 对象可用来调用 <b>文档编辑器</b> <a href="<%= Url.Action("methods") %>">方法</a>。</p>

    <p>
        上面的示例包含了文档服务器正确启动所需的所有参数。
        不过，还有其他非强制性参数，可以更改这些参数以实现对文档的不同操作目标（更改文档的访问权限，显示有关文档的不同信息等）。
        请参阅 <a href="<%= Url.Action("advanced") %>">高级参数</a> 部分以了解这些参数是什么以及如何更改它们。
    </p>

    <p>为防止重要参数被替换，请以 <a href="<%= Url.Action("signature/") %>">token</a>的形式在请求中添加加密签名。</p>

    <h2>获得帮助</h2>

    <p>如果您对 ONLYOFFICE 文档有任何疑问，请先尝试在 <a href="<%= Url.Action("faq") %>">常问问题</a> 部分找到它们。</p>
    <p>您可以通过在 <a href="https://github.com/ONLYOFFICE/DocumentServer/issues" target="_blank">GitHub</a>上发布问题来申请特性或报告错误。</p>
    <p>您也可以在 <a href="https://forum.onlyoffice.com/c/document-api/39" target="_blank">ONLYOFFICE 论坛</a> 上询问我们的开发人员（需要注册）。</p>
</asp:Content>
