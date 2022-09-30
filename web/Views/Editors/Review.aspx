<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    审阅
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">审阅</span>
    </h1>

    <p class="dscr">
        <b>审阅选项</b> 允许您在不真正编辑文档的情况下查看文档、更改句子、短语和其他页面元素、更正拼写等。
        所有更改都将被记录并显示给创建文档的用户。
    </p>
    <img src="<%= Url.Content("~/content/img/editor/review.png") %>" alt="" />

    <h2 id="access-rights" class="copy-link">审阅访问权限</h2>
    <p>
        为了启用审阅选项，文档初始化的权限部分中的 <a href="<%= Url.Action("config/document/permissions") %>#review">review</a> 参数必须设置为 <b>true</b>。
        文档 <b>状态栏</b> 将包含 <b>审阅</b> 菜单选项。
    </p>
    <p>
        如果 <em>edit</em> 参数设置为 <b>true</b> 并且 <em>review</em> 参数也设置为 <b>true</b>，用户将能够编辑文档，接受或拒绝更改并切换到他/她自己的审阅模式。
    </p>
    <img alt="审阅" src="<%= Url.Content("~/content/img/editor/accept_reject.png") %>" />
    <p>
        如果 <em>edit</em> 参数设置为 <b>false</b> 并且 <em>review</em> 参数设置为 <b>true</b>，则文档将仅可用于审阅。
    </p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "review": true
        },
        ...
    },
    ...
});
</pre>
    <div class="note">请注意，仅当 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 参数设置为 <b>edit</b>时，文档编辑器才能使用文档审阅。</div>

    <h2 id="group-rights" class="copy-link">按组区分审阅权</h2>
    <ol>
        <li>
            <p>
                通过在editorConfig部分的 <a href="<%= Url.Action("config/editor") %>#user">user</a> 参数中添加字段 <em>group</em> 来指定用户所属的组（或用逗号分隔的多个组）。
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "user": {
            "id": "78e1e841",
            "name": "John Smith",
            "group": "Group1"
        }
    },
    ...
});

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "user": {
            "id": "F89d8069ba2b",
            "name": "Kate Cage",
            "group": "Group2"
        }
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                使用编辑器初始化的权限部分中的 <a href="<%= Url.Action("config/document/permissions") %>#reviewGroups">reviewGroups</a> 参数指定访问权限。
            </p>
            <div class="note">
                如果在编辑器配置中指定了 <b>reviewGroups</b> 参数，则禁用查看所有更改的访问权限。
                否则，如果当前用户不属于任何组，他或她可以查看所有组的文档。
            </div>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "reviewGroups": ["Group1", "Group2"],
            ...
        }
        ...
    },
    ...
});
</pre>
            <p>
                <em>["Group1", "Group2"]</em> 表示用户可以查看来自 <em>Group1</em> 和 <em>Group2</em>的用户所做的更改。
            </p>
            <p>
                <a href="<%= Url.Action("config/document/permissions") %>#reviewGroups">reviewGroups</a> 参数可以采用空组的值。
                这意味着用户可以查看不属于任何组的用户所做的更改（例如，在第三方编辑器中查看的文档）。
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "reviewGroups": ["Group2", ""],
            ...
        }
        ...
    },
    ...
});
</pre>
            <p>
                <em>["Group2", ""]</em> 表示用户可以查看 <em>Group2</em> 中的用户和不属于任何组的用户所做的更改。
            </p>
        </li>
    </ol>
</asp:Content>
