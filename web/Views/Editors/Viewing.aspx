<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    查看
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">查看</span>
    </h1>
    <p class="dscr">查看打开模式允许用户仅查看文档而不修改其数据。为了启用此模式，
        编辑器 <a href="<%= Url.Action("config/editor") %>#mode">editorConfig.mode</a> 参数必须设置为 <b>view</b>。</p>
    <p>从7.2版开始， <b>实时查看器</b> 被添加到文本文档、电子表格和演示文稿编辑器中。
        要应用查看模式，请使用 <a href="<%= Url.Action("config/editor") %>#coEditing">editorConfig.coEditing</a> 参数：</p>

    <ol>
        <li>
            <p>如果 <em>mode</em> 字段是 <em>fast</em>，而 <em>change</em> 字段为 <em>true</em>，则默认情况下会打开实时查看器，
                但您可以将模式切换到通用查看器，然后再切换回来，而无需重新加载页面。
                为此，请打开 <b>文件</b> 选项卡，单击 <b>高级设置…</b>，然后选中/取消选中 <b>显示其他用户的更改</b> 复选框。
                默认情况下启用此模式：</p>
            <pre>
{
    "editorConfig": {
        "coEditing": {
            "mode": "fast",
            "change": true
        }
    }
}
</pre>
            <img alt="设置" src="<%= Url.Content("~/content/img/editor/show-changes-from-other-users.png") %>" />
            <p>在实时查看器中，通过配置 <a href="<%= Url.Action("config/document/permissions") %>#userInfoGroups">document.permissions.userInfoGroups</a> 参数来显示其他用户的光标。</p>
            <img alt="实时查看器" src="<%= Url.Content("~/content/img/editor/live-viewer.png") %>" />
            <p>更改的显示方式与编辑模式中的相同。</p>
            <img alt="编辑" src="<%= Url.Content("~/content/img/editor/editor.png") %>" />
        </li>
        <li>
            <p>如果 <em>mode</em> 字段是 <em>fast</em>，而 <em>change</em> 字段为 <em>false</em>，则默认情况下会打开实时查看器，并且无法将模式切换到普通查看器：</p>
            <pre>
{
    "editorConfig": {
        "coEditing": {
            "mode": "fast",
            "change": false
        }
    }
}      
</pre>
        </li>
        <li>
            <p>如果 <em>mode</em> 字段是<em>strict</em>，且 <em>change</em> 字段为 <em>true</em>，则默认情况下会打开通用查看器，
                但您可以在 <b>高级设置…</b>中将模式切换为实时查看器：</p>
            <pre>
{
    "editorConfig": {
        "coEditing": {
            "mode": "strict",
            "change": true
        }
    }
}
</pre>
        </li>
        <li>
            <p>如果 <em>mode</em> 字段是<em>strict</em>，且 <em>change</em> 字段为 <em>false</em>，则默认情况下会打开通用查看器，并且您无法将模式切换到实时查看器：</p>
            <pre>
{
    "editorConfig": {
        "coEditing": {
            "mode": "strict",
            "change": false
        }
    }
}
</pre>
            <img alt="查看器" src="<%= Url.Content("~/content/img/editor/viewer.png") %>" />
        </li>
    </ol>

    <p>在以下情况下，仅使用通用查看器：</p>
    <ul>
        <li>在 <a href="<%= Url.Action("config/editor/embedded") %>">嵌入式模式</a>中；</li>
        <li>对于 <a href="<%= Url.Action("wopi") %>">WOPI</a>；</li>
        <li>打开 <em>pdf/djvu/xps</em> 格式时。</li>
    </ul>
    <note>请注意，实时查看器的服务器连接数与同时连接总数分开计算，
        并受许可证中 <a href="<%= Url.Action("command/license") %>#license">connections_view</a> 参数的限制。对于开源版本，这个值限制为20。对于较旧的许可证，实时查看器不可用。</note>
    <p>在移动编辑器中使用查看模式的概念与web版本相同。</p>
</asp:Content>
