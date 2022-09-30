<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    提及
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">提及</span>
    </h1>
    <p class="dscr">参考图和下面的步骤解释了在 ONLYOFFICE 文档服务器中在评论中提及用户的过程。</p>
    <img alt="提及" src="<%= Url.Content("~/content/img/editor/mentions-create.png") %>" />
    <ol>
        <li>用户通过在 <b>文档编辑器</b> 的评论字段中键入 <b>+</b>符号来发送请求以获取要提及的用户列表。</li>
        <li><b>文档编辑器</b> 将请求通知 <b>文档管理器</b>。</li>
        <li><b>文档管理器</b> 将用户列表发送到 <b>文档编辑器</b> ，该列表将显示在评论字段下。</li>
        <li>用户在 <b>文档编辑器</b> 的注释字段中键入注释，注释被添加到文档中。</li>
        <li><b>文档编辑器</b> 将文档中的消息、电子邮件列表和链接操作发送给 <b>文档管理器</b>。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建一个空的 <em>html</em> 文件以 <a href="<%= Url.Action("open") %>#apply">打开文档</a>。</li>
        <li>
            <p>
                为有关在注释中提及用户的提示指定事件处理程序，该注释将显示在文档编辑器初始化的配置脚本中。
                当用户输入 <b>+</b> 号时， <a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a> 事件被调用，评论者可以选择其他用户在评论中提及。
            </p>
            <img alt="提及" src="<%= Url.Content("~/content/img/editor/onRequestUsers.png") %>" />
            <pre>
var onRequestUsers = function() {
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestUsers": onRequestUsers,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                为了在评论字段下设置用户列表，必须调用 <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> 方法：
            </p>
            <pre>
docEditor.setUsers({
    "users": [
        {
            "email": "john@example.com",
            "name": "John Smith"
        },
        {
            "email": "kate@example.com",
            "name": "Kate Cage"
        },
        ...
    ]
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>users</td>
                        <td>定义用户列表。</td>
                        <td>字符串数组</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>users.email</td>
                        <td>定义用户的电子邮件地址。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>users.name</td>
                        <td>定义用户的全名。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
    </ol>

    <h2 id="apply-changes" class="copy-link">打开评论</h2>
    <img alt="提及" src="<%= Url.Content("~/content/img/editor/actionLink-open.png") %>" />
    <ol>
        <li>用户点击 <b>文档管理器</b>中的链接。</li>
        <li><b>文档管理器</b> 将初始化 <em>editorConfig</em> 发送到 <b>文档编辑器</b>。</li>
        <li><b>文档编辑器</b> 将文档滚动到注释。</li>
    </ol>
    <p>
        为注释消息指定事件处理程序，并在文档编辑器初始化的配置脚本中指定要发送的电子邮件列表。
        当用户添加评论时，会调用 <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a> 事件。
        消息和电子邮件列表在 <em>data</em> 参数中发送。
        评论数据在 <em>data.actionLink</em> 参数中接收。
        与将 <a href="<%= Url.Action("actionlink") %>#apply">操作链接</a> 添加到书签的情况一样，必须在配置中使用 <em>actionLink</em> 对象作为 <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> 参数的值。
    </p>
    <div class="note">
        在 5.4 版本中，只有在设置了 <b>onRequestUsers</b> 事件时才能使用 <a href="#onRequestUsers">onRequestSendNotify</a> 事件。
        从 5.5 版开始， <b>onRequestSendNotify</b> 和 <b>onRequestUsers</b> 之间没有这种依赖关系 - 两者都可以独立设置。
    </div>
    <pre>
var onRequestSendNotify = function(event) {
    var ACTION_DATA = event.data.actionLink;
    var comment = event.data.message;
    var emails = event.data.emails;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSendNotify": onRequestSendNotify,
        ...
    },
    ...
});
</pre>

    <h2 id="apply-changes" class="copy-link">共享设置</h2>
    <p>当
        <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a> 事件被调用时，软件集成商提供对文件的访问，通过允许滚动到文档中评论位置的操作链接向提到的用户发送通知。
    </p>
    <p>
        如果文档初始化时使用了 <a href="<%= Url.Action("config/document/info") %>#sharingSettings">document.info.sharingSettings</a> 字段，但 <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a> 事件中的用户列表不同，则必须调用 <a href="<%= Url.Action("methods") %>#setSharingSettings">setSharingSettings</a> 方法。
    </p>
    <img width="832px" alt="提及" src="<%= Url.Content("~/content/img/editor/sharing_settings.png") %>" />
    <pre>
docEditor.setSharingSettings({
    "sharingSettings": [
        {
            "permissions": "Full Access",
            "user": "John Smith"
        },
        {
            "isLink": true,
            "permissions": "Read Only",
            "user": "External link"
        }
    ]
});
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>sharingSettings</td>
                        <td>定义允许与其他用户共享文档的设置。</td>
                        <td>对象数组</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sharingSettings.permissions</td>
                        <td>定义具有上述名称的用户的访问权限。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sharingSettings.user</td>
                        <td>定义将与之共享文档的用户的名称。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                </tbody>
            </table>
    <div class="mobile-content"></div>
    <p>
        在 <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a> 事件不提供对文件的访问的情况下，编辑器配置的自定义部分中的 <a href="<%= Url.Action("config/editor/customization") %>#mentionShare">mentionShare</a> 参数必须设置为 <b>false</b>。
    </p>
    <div class="note">
        请注意，如果设置了 <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a> 事件 ，它将仅可用于评论。
    </div>
    <img alt="提及" src="<%= Url.Content("~/content/img/editor/mentionShare.png") %>" />
</asp:Content>
