<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        管理版本问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="versions_1">
    <dt>处理文档历史事件时可以使用哪些方法？</dt>
    <dd>
        <p>可以使用 <a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a> 函数显示文档历史记录（使用 <em>events.onRequestHistory</em> 事件）。除非您使用它们，否则 <b>版本历史</b> 菜单选项（<b>协作</b> 选项卡中的 <b>版本历史</b> 按钮）不会显示在文档服务器界面中。</p>
        <p>一旦在配置文件中调用此函数（连同 <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> 方法），就会显示菜单选项和按钮，并且程序将显示现有文档版本。文档版本历史中显示的数据可以从 <b>文档编辑服务</b> <a href="<%= Url.Action("callback") %>#status-2">回调</a>中获取。</p>
        <p>所以文档版本历史显示的实现应该是这样的：</p>
        <ol>
            <li>回调处理程序从 <b>文档编辑服务</b> 接收到 <em>status</em> 为 <b>2</b> 的响应中的数据（这意味着文档的所有用户都关闭了它并且当前版本已经编译）。此响应将如下所示：
                <pre>{
    "key": "2745492410",
    "status": 2,
    "users": ["F89d8069ba2b"],
    "url": "https://documentserver/url-to-edited-document.docx",
    "history": {
        "serverVersion": serverVersion,
        "changes": changes
    }
}</pre>
            </li>
            <li>回调处理程序解析接收到的数据并将其传递给配置文件（它不需要解析可供<em>onRequestHistory</em>函数使用的 <em>history.serverVersion</em> 和 <em>history.changes</em> 数据）。</li>
            <li>配置文件必须包含以下部分： <em>events.onRequestHistory</em> 和 <em>onRequestHistory</em> 函数本身：
                <pre>var onRequestHistory = function() {
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "changes": changes,
                "created": "2019-02-01 3:03 PM",
                "key": "2745492410",
                "serverVersion": serverVersion,
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
        "onRequestHistory": onRequestHistory,
        ...
    },
    ...
});</pre>
                其中
                <ul>
                    <li><em>currentVersion</em> 是最新版本号，将作为当前版本显示在编辑器界面中；</li>
                    <li><em>history</em> 是对象数组，每个对象代表一个文档保存的单个版本：
                        <ul>
                            <li><em>history.changes</em> 和 <em>history.serverVersion</em> 是从 <b>文档编辑服务</b>接收到的数据；</li>
                            <li><em>history.user.id</em> 是最后一个为指定版本保存文档更改的用户的id；</li>
                            <li><em>history.created</em> 是文档指定版本编译的时间（对应收到 <em>status</em> 为 <b>2</b> 的时间）；</li>
                            <li><em>history.version</em> 是指定版本的编号，将显示在文档编辑器界面的版本历史记录部分。</li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>使用指定的所有上述参数打开文档。切换到 <b>文件</b> > <b>版本历史</b> 菜单选项（或 <b>协作</b> > <b>版本历史</b>），将显示版本数据。</li>
        </ol>
        <div class="note"><em>history.changes</em> 对象在版本中显示为较小的更改（修订）。</div>
    </dd>
</dl>
<dl class="faq_block" id="versions_2">
    <dt>如何显示具有突出显示更改的文档？</dt>
    <dd>
        <p><b>文档编辑服务</b> 将文档的所有临时更改保存到单独的文件中，一旦编译版本并收到 <em>status</em> 为 <b>2</b>，带有版本之间所有更改的存档链接也将发送到回调处理程序。</p>
        <p>因此，如果您想额外显示版本之间的差异，您还必须使用 <a href="<%= Url.Action("config/events") %>#onRequestHistoryData">onRequestHistoryData</a> 函数（用 <em>events.onRequestHistoryData</em> 事件），该函数必须包含 <b>文档编辑服务</b> <a href="<%= Url.Action("callback") %>#changeshistory">回调</a>返回的数据。</p>
        <p>除了 <a href="#versions_1">上述问题</a> 中描述的操作外，您还需要：</p>
        <ul>
            <li>解析来自 <b>文档编辑服务</b> 收到的 <em>status</em> 为 <b>2</b>的响应的 <em>changesurl</em> 参数：
                <pre>{
    "changesurl": "https://documentserver/url-to-changes.zip",
    "key": "2745492410",
    "status": 2,
    "users": ["F89d8069ba2b"],
    "url": "https://documentserver/url-to-edited-document.docx",
    "history": {
        "serverVersion": serverVersion,
        "changes": changes
    }
}</pre>
            </li>
            <li>将 <em>onRequestHistoryData</em> 函数连同 <em>setHistoryData</em> 方法和 <em>events.onRequestHistoryData</em> 事件一起添加到配置文件中：
                <pre>var onRequestHistoryData = function(event) {
    var version = event.data;
    docEditor.setHistoryData({
        "changesUrl": "https://example.com/url-to-changes.zip",
        "key": "2745492410",
        "previous": {
            "key": "af86C7e71Ca8",
            "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
        },
        "url": "https://documentserver/url-to-edited-document.docx",
        "version": version
    })
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistoryData": onRequestHistoryData,
        ...
    },
    ...
});</pre>
                包含指向当前文档版本 (<em>url</em>) 和先前文档版本 (<em>previous.url</em>) 的有效链接以及 ID（<em>key</em> 和 <em>previous.key</em>）的对象必须传递给配置文件。 <em>changesUrl</em> 存档文件也必须可用并可从浏览器下载，才能显示更改。
            </li>
        </ul>
    </dd>
</dl>
<dl class="faq_block" id="versions_3">
    <dt>Why is a new version not shown in the document history after I forcefully save a document?</dt>
    <dd>
        <p>ONLYOFFICE Docs highlights the changes made from the beginning of the current document session, not from the beginning of the document version.
        And even if several document versions are created during one session, all changes from this session will be highlighted.
        Therefore, you cannot see the document versions created with the <a href="<%= Url.Action("save") %>#forcesave">force saving option</a> in the document history.</p>
    </dd>
</dl>