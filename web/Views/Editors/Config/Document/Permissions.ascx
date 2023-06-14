<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/document") %>"></a>
    <span class="hdr">文档权限</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">文档权限部分允许更改要编辑和下载的文档的权限。</p>

<div class="header-gray">参数</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>名称</td>
            <td>描述</td>
            <td>类型</td>
            <td>示例</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="changeHistory" class="copy-link">changeHistory</td>
            <td>
                允许在使用 <a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a> 事件时显示 <em>恢复</em> 按钮。
                默认值为 <b>false</b>。
                自 5.5 版起已弃用，请改为添加 <a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a> 字段。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="chat" class="copy-link">chat</td>
            <td>
                定义是否在文档中启用聊天功能。
                如果聊天权限设置为 <b>true</b>，将显示 <b>聊天</b> 菜单按钮。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="comment" class="copy-link">comment</td>
            <td>
                定义是否可以评论文档。
                如果评论权限设置为 <b>"true"</b>，文档 <b>侧栏</b> 将包含 <b>评论</b> 菜单选项；如果 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 参数设置为 <b>edit</b>，文档注释将仅对文档编辑器可用。默认值与 <a href="#edit">edit</a> 参数的值一致。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    如果 <em>edit</em> 设置为 <b>"true"</b> 并且 <em>comment</em> 也设置为 <b>"true"</b>，用户将能够编辑文档和评论。
                    如果 <em>edit</em> 设置为 <b>"true"</b>， <em>comment</em> 设置为 <b>"false"</b>，用​户将只能编辑，相应的评论功能将只能查看，评论的添加和编辑将不可用。
                    如果 <em>edit</em> 设置为 <b>"false"</b> 并且 <em>comment</em> 设置为 <b>"true"</b>，该文档将仅用于评论。
                    如果 <em>edit</em> 设置为 <b>"false"</b>， <em>review</em> 设置为 <b>"false"</b>， <em>comments</em> 设置为 <b>"true"</b>，则不考虑 <em>fillForms</em> 值并且无法填写表单。
                </div>
                <img src="<%= Url.Content("~/content/img/editor/comment.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="commentGroups" class="copy-link">commentGroups</td>
            <td>
                定义用户可以编辑、删除和/或查看其评论的 <a href="<%= Url.Action("config/editor") %>#user">组</a>。
                该对象具有以下参数：
                <ul>
                    <li>
                        <b>edit</b> - 用户可以编辑其他用户发表的评论，
                        <br />
                        <b>类型</b>：list，
                        <br />
                        <b>示例</b>：["Group2", ""]；
                    </li>
                    <li>
                        <b>remove</b> - 用户可以删除其他用户的评论，
                        <br />
                        <b>类型</b>：list，
                        <br />
                        <b>示例</b>：[]；
                    </li>
                    <li>
                        <b>view</b> - 用户可以查看其他用户发表的评论，
                        <br />
                        <b>类型</b>：list，
                        <br />
                        <b>示例</b>：""。
                    </li>
                </ul>
                <em>[""]</em> 值意味着用户可以编辑/删除/查看不属于这些组的人所做的评论（例如，如果文档在第三方编辑器中进行了审阅）。
                如果值为 <em>[]</em>，则用户无法编辑/删除/查看任何组的评论。
                如果 <em>edit</em>, <em>remove</em> 和 <em>view</em> 参数为 <em>""</em> 或未指定，则用户可以查看/编辑/删除任何用户的评论。
            </td>
            <td>object</td>
            <td>{
    "edit": ["Group2", ""],
    "remove": [""],
    "view": ""
}</td>
        </tr>
        <tr class="tablerow">
            <td id="copy" class="copy-link">copy</td>
            <td>
                定义是否可以将内容复制到剪贴板。
                如果参数设置为 <b>false</b>，则粘贴内容将仅在当前文档编辑器中可用。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="deleteCommentAuthorOnly" class="copy-link">deleteCommentAuthorOnly</td>
            <td>
                定义用户是否只能删除他/她的评论。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="download" class="copy-link">download</td>
            <td>
                定义文档是可以下载还是只能在线查看或编辑。
                如果下载权限设置为 <b>"false"</b>，则 <b>文件</b> 菜单中将不存在 <b>下载为...</b> 菜单选项。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="edit" class="copy-link">edit</td>
            <td>
                定义文档是可以编辑还是只能查看。
                如果编辑权限设置为 <b>"true"</b>, <b>文件</b> 菜单将包含 <b>编辑文档</b> 菜单选项；请注意，如果编辑权限设置为 <b>"false"</b>，文档将在查看器中打开，即使 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 参数设置为 <b>edit</b>，您也 <b>无法</b>将其切换到编辑器。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="editCommentAuthorOnly" class="copy-link">editCommentAuthorOnly</td>
            <td>
                定义用户是否只能编辑他/她的评论。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="fillForms" class="copy-link">fillForms</td>
            <td>
                定义是否可以填写表单。
                只有将 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 参数设置为 <b>edit</b>时，文档编辑器才可以填写表单。
                默认值与 <a href="#edit">edit</a> 或 <a href="#review">review</a> 参数的值一致。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    如果 <em>edit</em> 设置为 <b>"true"</b> 或 <em>review</em> 设置为 <b>"true"</b>，则不考虑 <em>fillForms</em> 值并且可以填写表单。
                    |如果 <em>edit</em> 设置为 <b>"false"</b> 并且 <em>review</em> 设置为 <b>"false"</b> 并且fillForms也设置为 <b>"true"</b>，用户只能填写文档中的表单。
                    如果 <em>edit</em> 设置为 <b>"false"</b> 并且 <em>review</em> 设置为 <b>"false"</b> 而且 <em>fillForms</em> 设置为 <b>"true"</b>，不考虑 <em>comments</em> 值并且评论不可用。
                    仅填写表单模式目前仅适用于 <b>文档编辑器</b>。
                </div>
                <img src="<%= Url.Content("~/content/img/editor/fill-forms.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="modifyContentControl" class="copy-link">modifyContentControl</td>
            <td>
                定义是否可以更改内容控制设置。
                如果 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 参数设置为 <b>edit</b>，内容控制修改将仅可用于文档编辑器。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="modifyFilter" class="copy-link">modifyFilter</td>
            <td>
                定义过滤器是否可以全局应用（<b>true</b>）影响所有其他用户，或本地应用（<b>false</b>），即仅适用于当前用户。
                如果 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 参数设置为 <b>edit</b>，则过滤器修改仅可用于电子表格编辑器。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">如果文档由具有完全访问权限的用户编辑，则该用户应用的过滤器将对所有其他用户可见，而不管他们的本地设置如何。</div>
            </td>
        </tr>
        <tr>
            <td id="print" class="copy-link">print</td>
            <td>
                定义是否可以打印文档。
                如果打印权限设置为 <b>"false"</b>，则 <b>文件</b> 菜单中将不存在 <b>打印</b> 菜单选项。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/permissions.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="protect" class="copy-link">protect</td>
            <td>
                定义工具栏上的 <b>保护</b> 选项卡和左侧菜单中的 <b>保护</b> 按钮是显示 (<b>true</b>) 还是隐藏 (<b>false</b>)。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/protect.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="rename" class="copy-link">rename</td>
            <td>
                允许在使用 <a href="<%= Url.Action("config/events") %>#onRequestRename">onRequestRename</a> 事件时显示 <em>重命名...</em> 按钮。
                默认值为 <b>false</b>。
                自 6.0 版起已弃用，请改为添加 <a href="<%= Url.Action("config/events") %>#onRequestRename">onRequestRename</a> 字段。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="review" class="copy-link">review</td>
            <td>
                定义是否可以查看文档。
                如果审阅权限设置为 <b>true</b>，文档 <b>状态栏</b> 将包含 <b>审阅</b> 菜单选项；如果 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 参数设置为 <b>edit</b>，文档审阅将仅对文档编辑器可用。
                默认值与 <a href="#edit">edit</a> 参数的值一致。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    如果 <em>edit</em> 设置为 <b>"true"</b> 并且 <em>review</em> 也设置为 <b>"true"</b>，用户将能够编辑文档，接受/拒绝所做的更改并切换到他/她自己的审阅模式。
                    如果 <em>edit</em> 设置为 <b>"true"</b> 并且 <em>review</em> 设置为 <b>"false"</b>，用户将只能进行编辑。
                    如果 <em>edit</em> 设置为 <b>"false"</b> 并且 <em>review</em> 设置为 <b>"true"</b>，文档将仅在审阅模式下可用。
                </div>
                <img src="<%= Url.Content("~/content/img/editor/review.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="reviewGroups" class="copy-link">reviewGroups</td>
            <td>
                定义用户可以接受/拒绝其更改的 <a href="<%= Url.Action("config/editor") %>#user">组</a>。
                <em>[""]</em> 值意味着用户可以查看不属于任何这些组的人所做的更改（例如，如果文档是在第三方编辑器中查看的）。
                如果值为 <em>[]</em>，则用户无法查看任何组所做的更改。
                如果值为 <em>""</em> 或未指定，则用户可以查看任何用户所做的更改。
            </td>
            <td>string数组</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="userInfoGroups" class="copy-link">userInfoGroups</td>
            <td>
                定义其信息显示在编辑器中的用户组：
                <ul>
                    <li>用户名显示在编辑器标题的编辑用户列表中，</li>
                    <li>输入文本时，会显示用户光标和工具提示及其名称，</li>
                    <li>在严格的共同编辑模式下锁定对象时，会显示用户名。</li>
                </ul>
                <em>["Group1", ""]</em> 表示显示Group1中的用户和不属于任何组的用户的信息。
                <em>[]</em> 表示根本不显示任何用户信息。
                <em>undefined</em> 或 <em>""</em> 值表示显示所有用户的信息。
            </td>
            <td>string数组</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">示例</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "chat": true,
            "comment": true,
            "commentGroups": {
                "edit": ["Group2", ""],
                "remove": [""],
                "view": ""
            },
            "copy": true,
            "deleteCommentAuthorOnly": false,
            "download": true,
            "edit": true,
            "editCommentAuthorOnly": false,
            "fillForms": true,
            "modifyContentControl": true,
            "modifyFilter": true,
            "print": true,
            "protect": true,
            "review": true,
            "reviewGroups": ["Group1", "Group2", ""],
            "userInfoGroups": ["Group1", ""]
        },
        ...
    },
    ...
});
</pre>
