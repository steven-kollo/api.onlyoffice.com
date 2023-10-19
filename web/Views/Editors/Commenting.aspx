<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    评论
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">评论</span>
    </h1>

    <p class="dscr">
        <b>评论选项</b> 允许您对特定的单词、短语、句子和其他文档部分发表评论，编辑和删除这些评论。
        所有评论将被保存并显示给其他文档用户。
    </p>
    <img class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/comment.png") %>" alt="" />

    <h2 id="access-rights" class="copy-link">评论访问权限</h2>
    <p>
        为了启用评论选项，文档初始化的权限部分中的 <a href="<%= Url.Action("config/document/permissions") %>#comment">comment</a> 参数必须设置为 <b>true</b>。
        <b>文档侧栏</b> 将包含 <b>评论</b> 菜单选项。
    </p>
    <p>
        如果 <em>edit</em> 参数设置为 <b>true</b> 并且 <em>comment</em> 参数也设置为 <b>true</b>，用户将能够编辑文档和评论。
    </p>
    <img class="screenshot max-width-832" alt="评论" src="<%= Url.Content("~/content/img/editor/commenting.png") %>" />
    <p>
        如果 <em>edit</em> 参数设置为 <b>false</b> 并且 <em>comment</em> 参数设置为 <b>true</b>，则文档将仅可用于评论。
    </p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "comment": true
            ...
        },
        ...
    },
    ...
});
</pre>
    <div class="note">请注意，仅当 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 参数设置为 <b>edit</b>时，文档评论才可用于文档编辑器。</div>

    
    <h2 id="author-rights" class="copy-link">作者评论权的区分</h2>
    <ol>
        <li>
            <p>
                如果您希望仅允许其作者编辑评论，请将编辑器初始化的权限部分中的 <a href="<%= Url.Action("config/document/permissions") %>#editCommentAuthorOnly">editCommentAuthorOnly</a>
                参数设置为 <b>true</b>。
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "editCommentAuthorOnly": true
            ...
        },
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                如果您希望仅允许其作者删除评论，请将编辑器初始化的权限部分中的 <a href="<%= Url.Action("config/document/permissions") %>#deleteCommentAuthorOnly">deleteCommentAuthorOnly</a>
                参数设置为 <b>true</b>。
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "deleteCommentAuthorOnly": true
            ...
        },
        ...
    },
    ...
});
</pre>
        </li>
    </ol>


    <h2 id="group-rights" class="copy-link">按组区分评论权</h2>
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
                使用编辑器初始化的权限部分中的 <a href="<%= Url.Action("config/document/permissions") %>#commentGroups">commentGroups</a> 参数指定访问权限。
            </p>
            <div class="note">
                如果在编辑器配置中指定了 <b>commentGroups</b> 参数，则查看、编辑和/或删除所有评论的访问权限将被禁用。
                否则，如果当前用户不属于任何组，他或她可以编辑、删除和/或查看所有组的评论。
            </div>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "commentGroups": {
                "edit": ["Group2", ""],
                "remove": [""],
                "view": ""
            },
            ...
        }
        ...
    },
    ...
});
</pre>
            <ul>
                <li><em>"edit": ["Group2", ""]</em> 表示用户可以编辑来自 <em>Group2</em> 的用户和不属于任何组的用户发表的评论（例如，在第三方编辑器中评论的文档）。</li>
                <li><em>"remove": [""]</em> 表示用户可以删除不属于这些组的人的评论（例如，在第三方编辑器中评论的文档）。</li>
                <li><em>"view": ""</em> 表示用户可以查看任何用户发表的评论。</li>
            </ul>
        </li>
    </ol>


    <h2 id="threaded-comments" class="copy-link">电子表格中的线程评论</h2>
    <p>
        为了在其他编辑器中正确显示 ONLYOFFICE 电子表格评论，所有评论都以两种格式保存 - 原始和线程：
    </p>
    <ol>
        <li>
            <p><b>原始评论格式</b> 如下：</p>
            <pre>
${author1}:
comment
${author2}:
reply1
${author2}:
reply2
</pre>
            <img class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/comments-threaded.png") %>" alt="" />
        </li>
        <li>
            要将原始评论格式转换为 <b>线程评论</b>，如果评论以它开头，则删除 <em>"${author}:\n"</em> 字符串。
        </li>
    </ol>

    <p>编辑器中的文件打开如下：</p>
    <ul>
        <li>如果文件中有线程评论，则在打开时使用它们。</li>
        <li>如果只有原始 ONLYOFFICE 格式的评论，它们将被转换为线程评论。</li>
    </ul>

</asp:Content>
