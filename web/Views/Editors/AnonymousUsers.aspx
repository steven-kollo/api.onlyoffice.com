<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    匿名用户
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">匿名用户</span>
    </h1>
    <p class="dscr">参考图和以下步骤说明了在 ONLYOFFICE 文档服务器中为匿名用户设置名称的过程。</p>
    <img alt="匿名" src="<%= Url.Content("~/content/img/editor/anonymous-user.png") %>" />
    <ol>
        <li>
            <p>匿名用户使用 <b>文档管理器</b> 打开文档进行查看或编辑。</p>
            <note>匿名用户是没有 <a href="<%= Url.Action("config/editor") %>#user">用户ID</a>的用户.</note>
        </li>
        <li><b>文档存储服务</b> 使用 <a href="<%= Url.Action("basic") %>">JavaScript API</a> 将初始化配置发送到 <b>文档编辑器</b>，但未在那里指定用户名。</li>
        <li><b>文档编辑器</b> 请求用户名。</li>
        <li><b>文档编辑器</b> 将接收到的名称发送到 <b>文档编辑服务</b>。</li>
        <li><b>文档编辑服务</b> 将用户名发送给共同编辑模式下所有用户的 <b>文档编辑器</b>。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建一个 <em>html</em> 文件来 <a href="<%= Url.Action("open") %>#apply">打开文档</a>。</li>
        <li>如果指定了匿名用户的名称，它将显示在顶部工具栏上。</li>
        <li>
            <p>如果未指定用户名，将被请求用户名。可以使用
            <a href="<%= Url.Action("config/editor/customization") %>#anonymous">editorConfig.customization.anonymous</a> 参数的 <em>"request"=false</em> 值关闭请求。</p>
            <img width="832px" alt="名称请求" src="<%= Url.Content("~/content/img/editor/name-request.png") %>" />
        </li>
        <li>
            <p>设置匿名用户名后，通过
                <em>editorConfig.customization.anonymous</em> 参数的 <em>label</em> 字段添加后缀，以在共同编辑会话期间区分来宾用户。默认情况下，这个后缀是 <em>"Guest"</em>。</p>
            <img alt="标签" src="<%= Url.Content("~/content/img/editor/label.png") %>" />
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "anonymous": {
                "request": true,
                "label": "Guest"
            },
            ...
        },
        ...
    },
    ...
});
</pre>
        </li>
        <li>一旦您第一次设置名称，它将存储在浏览器本地存储中。下次要使用它，只需按 <b>F5</b> 键。</li>
        <li>要更改此名称，请在顶部工具栏上单击它并在打开的窗口中输入一个新名称。</li>
        <li>所有共同作者都会看到新名称。</li>
    </ol>


    <h2 id="restricting-access" class="copy-link">限制对编辑器或实时查看器的访问</h2>
    <p>若要限制匿名用户访问编辑器或实时查看器，请设置配置文件中的参数<a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring server isAnonymousSupport" target="_blank">services.CoAuthoring.server.isAnymousSupport</a>的值为<b>false</b>。
    在这种情况下，当匿名用户试图打开编辑器时，将出现警告</p>
    <img alt="匿名用户警告" src="<%=Url.Content("~/Content/img/editor/noymous-warning.jpg")%>" />
    <p>实时查看器将在没有警告的情况下切换到脱机查看器</p>

</asp:Content>
