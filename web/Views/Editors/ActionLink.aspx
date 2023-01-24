<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    动作链接
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">动作链接</span>
    </h1>
    <p class="dscr">参考图和下面的步骤解释了在 ONLYOFFICE 文档服务器中使用链接的过程。</p>
    <img alt="动作链接" src="<%= Url.Content("~/content/img/editor/actionLink-create.png") %>" />
    <ol>
        <li>用户发送请求，以获取一个文档链接，该文档包含 <b>文档编辑器</b>中的一个书签。</li>
        <li><b>文档编辑器</b> 将请求发送给 <b>文档管理器</b> （软件集成商在文档管理器中创建链接）。</li>
        <li><b>文档管理器</b> 将链接发送回 <b>文档编辑器</b>，文档编辑器显示链接。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建一个 <em>html</em> 文件来 <a href="<%= Url.Action("open") %>#apply">打开文档</a>。</li>
        <li>
            <p>
                指定 <em>获取链接</em> 按钮的事件处理程序，该按钮将在文档编辑器初始化的配置脚本中的书签编辑菜单中显示。
                当调用 <a href="<%= Url.Action("config/events") %>#onMakeActionLink">onMakeActionLink</a> 事件时，用户请求被发送软件集成商，该软件集成商在文档存储服务中创建链接。
            </p>
            <img alt="动作链接" src="<%= Url.Content("~/content/img/editor/onMakeActionLink.png") %>" />
            <pre>
var onMakeActionLink = function (event){
    var ACTION_DATA = event.data;
    ...
    var link = GENERATE_LINK(ACTION_DATA);
    docEditor.setActionLink(link);
    };

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onMakeActionLink": onMakeActionLink,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                为了向用户提供包含书签的文档的链接，软件集成商将链接发送到 <a href="<%= Url.Action("methods") %>#setActionLink">setActionLink</a> 方法：
            </p>
            <pre>
docEditor.setActionLink(link);
</pre>
        </li>
    </ol>

    <h2 id="apply" class="copy-link">打开书签</h2>
    <img alt="动作链接" src="<%= Url.Content("~/content/img/editor/actionLink-open.png") %>" />
    <ol>
        <li>用户点击 <b>文档管理器</b>中的链接。</li>
        <li><b>文档管理器将</b> 将 <em>editorConfig</em> 初始化值发送到 <b>文档编辑器</b>。</li>
        <li><b>文档编辑器</b> 将文档滚动到书签。</li>
    </ol>
    <p>
        当用户点击链接时， <b>文档编辑器</b> 将 <em>editorConfig</em> 初始化值发送到 <b>文档编辑服务</b>。
        在 <em>editorConfig</em>的 <a href="<%= Url.Action("config/editor") %>#actionLink">data.actionLink</a> 参数中指定从 <a href="<%= Url.Action("config/events") %>#onMakeActionLink">onMakeActionLink</a> 事件接收到的 ACTION_DATA：
    </p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "actionLink": ACTION_DATA,
        ...
    },
    ...
});
</pre>
    <div class="note">在评论中 <a href="<%= Url.Action("mentions") %>#apply">提及</a> 用户时，链接的生成方式相同。</div>
</asp:Content>
