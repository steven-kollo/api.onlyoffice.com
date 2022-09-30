<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    重命名文件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">重命名文件</span>
    </h1>
    <p class="dscr">参考图和以下步骤说明了在 ONLYOFFICE 文档服务器中重命名文档的过程。</p>
    <img alt="重命名文件" src="<%= Url.Content("~/content/img/editor/rename.png") %>" />
    <ol>
        <li>用户在 <b>文档编辑器</b>中为文档指定一个新名称。</li>
        <li><b>文档编辑器</b> 将文档的新名称通知给 <b>文档管理器</b>。</li>
        <li><b>文档管理器</b> 将文档的新名称发送到 <b>文档存储服务</b>，在这里软件集成商重命名文档。</li>
        <li><b>文档存储服务</b> 将文档的新名称通知给 <b>文档编辑服务</b>。</li>
        <li><b>文档编辑服务</b> 将文档的新名称发送给每个用户的 <b>文档编辑器</b>。</li>
        <li>现在新名称对所有用户可见。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建一个 <em>html</em> 文件来 <a href="<%= Url.Action("open") %>#apply">打开文档</a>。</li>
        <li>
            <p>
                指定用于在文档编辑器初始化的配置脚本中打开 <em>重命名...</em> 菜单的事件处理程序。
                当调用 <a href="<%= Url.Action("config/events") %>#onRequestRename">onRequestRename</a> 事件时，不带扩展名的文档的新名称被发送给软件集成商，软件集成商在文档存储服务中重命名文档。
            </p>
            <img alt="重命名文件" src="<%= Url.Content("~/content/img/editor/onRequestRename.png") %>" />
            <pre>
var onRequestRename = function(event) {
    var title = event.data;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestRename": onRequestRename,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                为了更新所有协作编辑器的文档名称，请将 <em>c</em> 参数的值设置为 <a href="<%= Url.Action("command/meta") %>">meta</a>，然后将请求发送到 <a href="<%= Url.Action("command") %>">文档命令服务</a>：
            </p>
            <pre>
{
    "c": "meta",
    "key": "Khirz6zTPdfd7",
    "meta": {
        "title": "Example Document Title.docx"
    }
}
</pre>
        </li>
        <li>
            <p>
                当通过 <a href="<%= Url.Action("command/meta") %>">meta</a> 命令更改文档名称时，必须在每个用户的文档编辑器中调用 <a href="<%= Url.Action("config/events") %>#onMetaChange">onMetaChange</a> 事件。
                此事件在 <em>data.title</em> 参数中发送文档的名称。
            </p>
            <pre>
var onMetaChange = function (event) {
    var title = event.data.title;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onMetaChange": onMetaChange,
        ...
    },
    ...
});          
</pre>
        </li>
    </ol>
</asp:Content>
