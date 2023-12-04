<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    文件历史
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">文件历史</span>
    </h1>
    <p class="dscr">您可以使用 <b>文档编辑器</b>查看文本文档、电子表格或演示文稿的历史记录。</p>

    <p>
        文档历史记录与文档存储服务一起存储。
        <b>文档编辑器</b> 将文档历史记录显示在左侧面板的版本列表中。
        当您从列表中选择文档版本时，文档将被显示出来以供预览。
    </p>

    <p>参考图和下面的步骤解释了在ONLYOFFICE 文档服务器中查看历史记录的过程。</p>
    <img alt="Document history" src="<%= Url.Content("~/content/img/editor/viewing-history.svg") %>" />
    <ol>
        <li>用户在 <b>文档编辑器</b>中编辑文档时单击 <em>版本历史</em> 按钮。</li>
        <li><b>文档编辑器</b> 从 <b>文档存储服务</b>请求文档版本列表。</li>
        <li><b>文档存储服务</b> 发送待显示的版本号的文档版本列表。</li>
        <li><b>文档编辑器</b> 从 <b>文档存储服务</b>请求有关所选文档版本的信息。</li>
        <li><b>文档存储服务</b> 将链接发送到所选文档版本。</li>
        <li><b>文档编辑器</b> 显示选定的文档版本。</li>
        <li>当用户单击文档版本列表中的另一个版本时， <b>文档编辑器</b> 请求重新显示有关该版本的信息。</li>
        <li>用户单击<em>关闭历史记录</em>按钮，<b>文档编辑器</b>将隐藏文档版本列表。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建一个 <em>html</em> 文件来 <a href="<%= Url.Action("open") %>#apply">打开文档</a>。</li>
        <li>
            <p>
                指定事件处理程序，用于打开在文档编辑器初始化的配置脚本中的 <a href="<%= Url.Action("config/events") %>#onRequestHistory">版本历史</a> 列表。
                调用 <a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a> 事件时，必须执行 <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> 方法。
                如果每个版本都存在历史参数，则此方法包含每个文档版本的文档历史记录。
            </p>
            <pre>
var onRequestHistory = function () {
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
                "user": {
                    "id": "F89d8069ba2b",
                    "name": "Kate Cage"
                },
                "version": 1
            },
            {
                "created": "2010-07-07 3:46 PM",
                "key": "Khirz6zTPdfd7",
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith"
                },
                "version": 2
            },
            ...
        ],
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistory": onRequestHistory,
        ...
    },
    ...
});
</pre>
            <img class="screenshot max-width-300" alt="打开文件" src="<%= Url.Content("~/content/img/editor/history_open.png") %>" />
        </li>
        <li>
            <p>
                在文档编辑器初始化的配置脚本中，指定用来 <a href="<%= Url.Action("config/events") %>#onRequestHistoryData">从版本历史中选择版本</a>的事件处理程序。
                调用 <a href="<%= Url.Action("config/events") %>#onRequestHistoryData">onRequestHistoryData</a> 事件时，必须执行 <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> 方法。
                此方法包含对应版本文件的绝对 URL。
            </p>
            <p>调用<em>setHistoryData</em>方法查看文档历史版本时，必须添加token来验证参数。</p>
            <pre>
var onRequestHistoryData = function (event) {
    var version = event.data;
    docEditor.setHistoryData({
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.iRcdHve235L5K1e29SmUBkuHcxb63WHRko51WMJlmS0",
        "url": "https://example.com/url-to-example-document.docx",
        "version": 2
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistoryData": onRequestHistoryData,
        ...
    },
    ...
});
</pre>
            <img class="screenshot max-width-300" alt="打开文件" src="<%= Url.Content("~/content/img/editor/history.png") %>" />
        </li>
        <li>
            <p>
                在文档编辑器初始化的配置脚本中，指定事件处理程序，当用户单击版本历史记录中的<em>恢复</em>按钮时，将 <a href="<%= Url.Action("config/events") %>#onRequestRestore">恢复</a> 文件版本。
                当调用 <a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a> 事件时，必须执行 <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> 方法才能再次初始化版本历史记录。
                如果每个版本都存在历史参数，则此方法包含每个文档版本的文档历史记录。
            </p>
            <pre>
var onRequestRestore = function (event) {
    var fileType = event.data.fileType;
    var url = event.data.url;
    var version = event.data.version;
    ...
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
                "user": {
                    "id": "F89d8069ba2b",
                    "name": "Kate Cage"
                },
                "version": 1
            },
            {
                "changes": changes,
                "created": "2010-07-07 3:46 PM",
                "key": "Khirz6zTPdfd7",
                "serverVersion": serverVersion,
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith"
                },
                "version": 2
            },
            ...
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestRestore": onRequestRestore,
        ...
    },
    ...
});
</pre>
        <img class="screenshot max-width-832" alt="onRequestRestore" src="<%= Url.Content("~/content/img/editor/onRequestRestore.png") %>"/>
        </li>
        <li>在浏览器中打开您的 <em>html</em> 文件。</li>
        <li>在文档编辑器菜单中打开 <em>版本历史</em> 选项。</li>
        <li>
            <p>
                指定<em>关闭历史记录</em>按钮的事件处理程序，该按钮要在文档编辑器初始化的配置脚本中显示。
                当用户尝试通过单击“关闭历史记录”按钮，而从查看文档版本历史记录返回到文档时，
                调用 <a href="<%= Url.Action("config/events") %>#onRequestHistoryClose">onRequestHistoryClose</a> 事件并隐藏版本历史列表。
                当该函数被调用时，编辑器必须在编辑模式下再次初始化。
            </p>
            <pre>
var onRequestHistoryClose = function () {
    document.location.reload();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistoryClose": onRequestHistoryClose,
        ...
    },
    ...
});
</pre>
<img class="screenshot max-width-832" alt="onRequestHistoryClose" src="<%= Url.Content("~/content/img/editor/onRequestHistoryClose.png") %>"/>
        </li>
    </ol>
    
    <h2 id="apply-changes" class="copy-link">打开带有更改突出显示的文档历史记录</h2>
    <p>
        如果文档版本是使用 <b>文档编辑器</b>创建的，则在查看文档历史记录时可以显示文档更改。
        将编辑会话 <a href="<%= Url.Action("save") %>">保存</a> 在文档版本旁边时，必须将附加数据保存到 <b>文档存储服务</b> 来实现此目的。
        在 <b>文档编辑器</b> 中编辑后，有关编辑会话期间更改的信息将与更改的文档一起发送：</p>
        <note>当服务器版本更新时，<b>文档编辑器</b> 不会使用<em>changes</em> 数据来突出历史记录中的更改。
            它仅在 <em>changesurl</em> 参数中返回更改的文档。</note>
    <ul>
        <li>
            <p>
                <a href="<%= Url.Action("callback") %>#history">History</a> - 当您在侧面板中查看文档历史时，此信息允许显示每个文档版本的时间和作者。
                必须作为对象的属性更改作为参数发送给 <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> 方法。
            </p>
            <pre>
docEditor.refreshHistory({
    "currentVersion": 2,
    "history": [
        {
            "created": "2010-07-06 10:13 AM",
            "key": "af86C7e71Ca8",
            "user": {
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            "version": 1
        },
        {
            "changes": changes,
            "created": "2010-07-07 3:46 PM",
            "key": "Khirz6zTPdfd7",
            "serverVersion": serverVersion,
            "user": {
                "id": "78e1e841",
                "name": "John Smith"
            },
            "version": 2
        },
        ...
    ],
});
</pre>
            <p>其中 <b>changes</b> 是保存文档后返回的 <a href="<%= Url.Action("callback") %>#history">历史对象</a> 的 <em>更改</em>。</p>
            <p>其中 <b>serverVersion</b> 是保存文档后返回的 <a href="<%= Url.Action("callback") %>#history">历史对象</a> 中的 <em>serverVersion</em>。</p>
            <note>ONLYOFFICE文档强调从当前文档会话开始时所做的更改，而不是从文档版本开始时所作的更改。
                即使在一个会话中创建了多个文档版本，此会话中的所有更改也将突出显示。
                因此，您无法在文档历史记录中看到使用<a href="<%= Url.Action("save") %>#forcesave">强制保存选项</a>创建的文档版本。</note>
            </li>
        <li>
            <p>
                <a href="<%= Url.Action("callback") %>#changesurl">changesurl</a> - 带有文档编辑数据的文件的绝对 URL，用于显示与特定文档版本相对应的更改。
                必须保存文件，并且必须使用 <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> 方法将其地址作为 changesUrl 参数发送。
                必须将指向先前文档版本 (<em>previous.url</em>) 的链接添加到对象中。
            </p>
            <p>当调用<em>setHistoryData</em>方法查看文档历史版本时，必须添加token来验证参数。</p>
            <pre>
docEditor.setHistoryData({
    "changesUrl": "https://example.com/url-to-changes.zip",
    "fileType": "docx",
    "key": "Khirz6zTPdfd7",
    "previous": {
        "fileType": "docx",
        "key": "af86C7e71Ca8",
        "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsiZmlsZVR5cGUiOiJkb2N4Iiwia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.ril3Ol3rvYne3g0dG8TdKCiwJ7-7kkYGc6-XWMvp8FU",
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
});
</pre>
            <div id="changesurl-cors" class="note">
                <em>changesurl</em> 请求是在浏览器中从添加的带有 <b>documentserver</b> 域的 iframe 发出的，其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称。
                为了正确工作，必须允许跨域 HTTP 请求 (CORS)。
                这可以使用 <em>Access-Control-Allow-Origin</em> 标头来实现。
            </div>
            <img class="screenshot max-width-832" alt="changesurl" src="<%= Url.Content("~/content/img/editor/changesurl.png") %>" />
        </li>
    </ul>
</asp:Content>
