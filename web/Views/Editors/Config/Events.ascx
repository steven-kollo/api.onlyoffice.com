﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/") %>"></a>
    <span class="hdr">事件</span>
</h1>

<p class="dscr">事件部分允许更改与事件有关的所有功能。</p>

<ul>
    <li><a href="#onAppReady">onAppReady</a> - 应用程序被加载到浏览器中。</li>
    <li><a href="#onCollaborativeChanges">onCollaborativeChanges</a> - 文档由其他用户以 <em>严格</em> 共同编辑模式共同编辑。</li>
    <li><a href="#onDocumentReady">onDocumentReady</a> - 文档被加载到文档编辑器中。</li>
    <li><a href="#onDocumentStateChange">onDocumentStateChange</a> - 文档被修改。</li>
    <li><a href="#onDownloadAs">onDownloadAs</a> - 调用 <em>downloadAs</em> 方法时编辑文件的绝对 URL 。</li>
    <li><a href="#onError">onError</a> - 发生错误或其他特定事件。</li>
    <li><a href="#onInfo">onInfo</a> - 应用程序打开了文件。</li>
    <li><a href="#onMetaChange">onMetaChange</a> - 通过meta命令更改文档的 <em>元</em> 信息。</li>
    <li><a href="#onMakeActionLink">onMakeActionLink</a> - 用户试图获取打开包含书签的文档的链接，滚动到书签位置。</li>
    <li><a href="#onOutdatedVersion">onOutdatedVersion</a> - 使用旧的 <em>document.key</em> 值打开文档进行编辑，该值用于编辑以前的文档版本并成功保存。</li>
    <li><a href="#onPluginsReady">onPluginsReady</a> - 所有插件都已加载并可以使用。</li>
    <li><a href="#onReady">onReady</a> - 应用程序被加载到浏览器中。</li>
    <li><a href="#onRequestClose">onRequestClose</a> - 必须结束与编辑器的工作并且必须关闭编辑器。</li>
    <li><a href="#onRequestCompareFile">onRequestCompareFile</a> - 用户试图通过单击 <em>存储中的文档</em> 按钮来选择要比较的文档。</li>
    <li><a href="#onRequestCreateNew">onRequestCreateNew</a> - 用户试图通过单击 <em>新建</em> 按钮来创建文档。</li>
    <li><a href="#onRequestEditRights">onRequestEditRights</a> - 用户试图通过单击 <em>编辑文档</em> 按钮将文档从查看模式切换到编辑模式。</li>
    <li><a href="#onRequestHistory">onRequestHistory</a> - 用户试图通过单击 <em>版本历史</em> 按钮来显示文档版本历史。</li>
    <li><a href="#onRequestHistoryClose">onRequestHistoryClose</a> - 用户试图通过单击 <em>关闭历史记录</em> 按钮从查看文档版本历史记录返回到文档。</li>
    <li><a href="#onRequestHistoryData">onRequestHistoryData</a> - 用户正在尝试单击文档版本历史记录中的特定文档版本。</li>
    <li><a href="#onRequestInsertImage">onRequestInsertImage</a> - 用户尝试通过单击 <em>存储中的图像</em> 按钮来插入图像。</li>
    <li><a href="#onRequestMailMergeRecipients">onRequestMailMergeRecipients</a> - 用户试图通过单击 <em>邮件合并</em> 按钮来选择收件人数据。</li>
    <li><a href="#onRequestOpen">onRequestOpen</a> - the user is trying to open an external link.</li>
    <li><a href="#onRequestReferenceData">onRequestReferenceData</a> - 用户正尝试通过单击<em>数据</em> 选项卡的<em>外部</em> 链接对话框中的<em>更新值</em> 按钮来刷新从外部文件插入的数据。</li>
    <li><a href="#onRequestReferenceSource">onRequestReferenceSource</a> - the user is trying to change an external link by clicking the <em>Change source</em> button.</li>
    <li><a href="#onRequestRename">onRequestRename</a> - 用户试图通过单击 <em>重命名...</em> 按钮来重命名文件。</li>
    <li><a href="#onRequestRestore">onRequestRestore</a> - 用户正在尝试通过单击版本历史记录中的 <em>恢复</em> 按钮来恢复文件版本。</li>
    <li><a href="#onRequestSaveAs">onRequestSaveAs</a> - 用户试图通过单击 <em>另存为...</em> 按钮来保存文件。</li>
    <li><a href="#onRequestSelectDocument">onRequestSelectDocument</a> - the user is trying to select a document for comparing or combining.</li>
    <li><a href="#onRequestSelectSpreadsheet">onRequestSelectSpreadsheet</a> - the user is trying to select recipients data by clicking the <em>Mail merge</em> button.</li>
    <li><a href="#onRequestSendNotify">onRequestSendNotify</a> - 用户在评论中被提及。</li>
    <li><a href="#onRequestSharingSettings">onRequestSharingSettings</a> - 用户尝试通过单击 <em>更改访问权限</em> 按钮来管理文档访问权限。</li>
    <li><a href="#onRequestUsers">onRequestUsers</a> - 评论者可以选择其他用户在评论中提及。</li>
    <li><a href="#onWarning">onWarning</a> - 出现警告。</li>
</ul>

<h2>事件及其描述：</h2>
<ul>
    <li>
        <p><b id="onAppReady" class="copy-link">onAppReady</b> - 当应用程序加载到浏览器时调用的函数。</p>
        <div class="header-gray">示例</div>
        <pre>
var onAppReady = function () {
    console.log("ONLYOFFICE Document Editor is ready");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onAppReady": onAppReady,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onCollaborativeChanges" class="copy-link">onCollaborativeChanges</b> - 当文档被其他用户在 <em>严格</em> 的共同编辑模式下共同编辑时调用的函数。</p>
        <div class="header-gray">示例</div>
        <pre>
var onCollaborativeChanges = function () {
    console.log("The document changed by collaborative user");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onCollaborativeChanges": onCollaborativeChanges,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onDocumentReady" class="copy-link">onDocumentReady</b> - 当文档加载到文档编辑器时调用的函数。</p>
        <div class="header-gray">示例</div>
        <pre>
var onDocumentReady = function () {
    console.log("Document is loaded");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onDocumentReady": onDocumentReady,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onDocumentStateChange" class="copy-link">onDocumentStateChange</b> - 修改文档时调用的函数。
            使用以下参数调用它：<em>{"data": true}</em> --适用于当前用户正在编辑文档时。使用以下参数调用它：<em>{"data": false}</em> --适用于当前用户的更改发送到 <b>文档编辑服务</b>时。
        </p>
        <div class="header-gray">示例</div>
        <pre>
var onDocumentStateChange = function (event) {
    if (event.data) {
        console.log("The document changed");
    } else {
        console.log("Changes are collected on document editing service");
    }
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onDocumentStateChange": onDocumentStateChange,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onDownloadAs" class="copy-link">onDownloadAs</b> - 调用 <a href="<%= Url.Action("methods") %>#downloadAs">downloadAs</a> 方法时使用已编辑文件的绝对 URL 调用的函数。
            要下载的文档的绝对 URL 及其类型在 <em>data</em> 参数中发送。
        </p>
        <div class="header-gray">示例</div>
        <pre>
var onDownloadAs = function (event) {
    var fileType = event.data.fileType;
    var url = event.data.url;
    console.log("ONLYOFFICE Document Editor create file: " + url);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onDownloadAs": onDownloadAs,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onError" class="copy-link">onError</b> - 发生错误或其他特定事件时调用的函数。
            错误消息在 <em>data</em> 参数中发送。
           可以在<a href="https://github.com/ONLYOFFICE/sdkjs/blob/master/common/errorCodes.js" target="_blank">此处</a>找到错误代码列表。
        </p>
        <div class="header-gray">示例</div>
        <pre>
var onError = function (event) {
    console.log("ONLYOFFICE Document Editor reports an error: code " + event.data.errorCode + ", description " + event.data.errorDescription);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onError": onError,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onInfo" class="copy-link">onInfo</b> - 应用程序打开文件时调用的函数。
            模式在 <em>data.mode</em> 参数中发送。
            可以 <b>查看</b> 或 <b>编辑</b>。
        </p>
        <div class="header-gray">示例</div>
        <pre>
var onInfo = function (event) {
    console.log("ONLYOFFICE Document Editor is opened in mode " + event.data.mode);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onInfo": onInfo,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onMetaChange" class="copy-link">onMetaChange</b> - 通过 <a href="<%= Url.Action("command/meta") %>">meta</a> 命令更改文档的元信息时调用的函数。</p>
        <p>文档的名称在 <em>data.title</em> 参数中发送。 <em>收藏</em> 图标高亮状态在 <em>data.favorite</em> 参数中发送。</p>
        <p>当用户点击 <em>收藏</em> 图标时， 调用<a href="<%= Url.Action("methods") %>#setFavorite">setFavorite</a>方法更新 <em>收藏</em> 图标高亮状态<a href="<%= Url.Action("config/document/info") %>#favorite">信息</a>。
            如果未声明该方法，则<em>收藏</em> 图标不会更改。</p>
        <div class="header-gray">示例</div>
        <pre>
var onMetaChange = function (event) {
    var title = event.data.title;
    var favorite = event.data.favorite;
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

    <li>
        <p><b id="onMakeActionLink" class="copy-link">onMakeActionLink</b> - 当用户试图获取打开包含书签的文档的链接时调用的函数，滚动到书签位置。</p>
        <p>要设置书签链接，您必须调用 <a href="<%= Url.Action("methods") %>#setActionLink">setActionLink</a> 方法。
            书签数据在 <em>data</em> 参数中接收，然后必须在配置中用作 <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> 参数的值。
            如果未声明该方法，则不会显示 <em>获取链接</em> 按钮。</p>
        <img class="screenshot" alt="onMakeActionLink" src="<%= Url.Content("~/content/img/editor/onMakeActionLink.png") %>"/>
        <div class="header-gray">示例</div>
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
            <b id="onOutdatedVersion" class="copy-link">onOutdatedVersion</b> -显示 <a href="<%= Url.Action("troubleshooting") %>#key">错误</a> 后调用的函数，当使用旧的 <a href="<%= Url.Action("config/document") %>#key">document.key</a> 值打开文档进行编辑时，该值用于编辑以前的文档版本并成功保存。
            调用此事件时，必须使用新的 <em>document.key</em>重新初始化编辑器。
        </p>
        <div class="header-gray">示例</div>
        <pre>
var onOutdatedVersion = function () {
    location.reload(true);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onOutdatedVersion": onOutdatedVersion,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onPluginsReady" class="copy-link">onPluginsReady</b> - 当所有插件都加载并可以使用时调用的函数。
        </p>
        <div class="header-gray">示例</div>
        <pre>
var onPluginsReady = function () {
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onPluginsReady": onPluginsReady,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onReady" class="copy-link">onReady</b> - 当应用程序加载到浏览器中时调用的函数。
            自 5.0 版起已弃用，请改用 <a href="#onAppReady">onAppReady</a>
        </p>
    </li>

    <li>
        <p><b id="onRequestClose" class="copy-link">onRequestClose</b> - 当编辑器的工作必须结束并且编辑器必须关闭时调用的函数。</p>
        <div class="header-gray">示例</div>
        <pre>
var onRequestClose = function () {
    if (window.opener) {
        window.close();
        return;
    }
    docEditor.destroyEditor();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestClose": onRequestClose,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestCompareFile" class="copy-link">onRequestCompareFile<span class="required">*</span></b> - the function called when the user is trying to select document for comparing by clicking the <em>Document from Storage</em> button.
        Deprecated since version 7.5, please use <a href="#onRequestSelectDocument">onRequestSelectDocument</a> instead.</p>
        <span class="required-descr"><span class="required">*</span><em> - available only for ONLYOFFICE Enterprise Edition and ONLYOFFICE Developer Edition</em></span>
    </li>

    <li>
        <p>
            <b id="onRequestCreateNew" class="copy-link">onRequestCreateNew</b> - 当用户试图通过单击 <em>新建</em> 按钮来创建文档时调用的函数。
            此方法用于代替 <a href="<%= Url.Action("config/editor") %>#createUrl">createUrl</a> 字段。
            如果未声明该方法且未指定 <em>createUrl</em>，则不会显示 <em>新建</em> 按钮。
        </p>
        <div class="header-gray">示例</div>
        <pre>
var onRequestCreateNew = function () {
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestCreateNew": onRequestCreateNew,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onRequestEditRights" class="copy-link">onRequestEditRights</b> - 当用户试图通过单击 <em>编辑文档</em> 按钮将文档从查看模式切换到编辑模式时调用的函数。
            调用该函数时，编辑器必须再次初始化，处于编辑模式。
            如果未声明该方法，则不会显示 <em>编辑</em> 按钮。
        </p>
        <div class="note">
            当 <a href="<%= Url.Action("config/editor") %>#mode">editorConfig</a> <em>模式</em> 参数设置为<b>view</b> 并且 <em>编辑</em> 文档的 <em>权限</em> （<a href="<%= Url.Action("config/document/permissions") %>#edit">文档权限</a>）设置为 <b>true</b> 时， <b>onRequestEditRights</b> 参数是强制性的，以便用户可以切换到编辑模式。
        </div>
        <img class="screenshot" alt="onRequestEditRights" src="<%= Url.Content("~/content/img/editor/onRequestEditRights.png") %>"/>
        <div class="header-gray">示例</div>
        <pre>
var onRequestEditRights = function () {
    console.log("ONLYOFFICE Document Editor requests editing rights");
    document.location.reload();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestEditRights": onRequestEditRights,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestHistory" class="copy-link">onRequestHistory</b> - 当用户试图通过单击 <em>版本历史</em> 按钮来显示文档版本历史时调用的函数。</p>
        <p>要显示文档版本历史记录，您必须调用 <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> 方法。
            如果未声明该方法和 <a href="#onRequestHistoryData">onRequestHistoryData</a> 方法，则不会显示 <em>版本历史</em> 按钮。</p>
        <img class="screenshot" alt="onRequestHistory" src="<%= Url.Content("~/content/img/editor/onRequestHistory.png") %>"/>
        <div class="header-gray">示例</div>
        <pre>
var onRequestHistory = function () {
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "changes": changes,
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
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
});
</pre>
        <p>其中 <b>changes</b> 是保存文档后返回的 <a href="<%= Url.Action("callback") %>#history">历史对象</a> 的 <em>更改</em>。</p>
        <p>其中 <b>serverVersion</b> 是保存文档后返回的 <a href="<%= Url.Action("callback") %>#history">历史对象</a> 中的 <em>serverVersion</em> 。</p>
    </li>

    <li>
        <p>
            <b id="onRequestHistoryClose" class="copy-link">onRequestHistoryClose</b> - 当用户试图通过单击 <em>关闭历史记录</em> 按钮查看文档版本历史记录返回文档时调用的函数。
            调用该函数时，编辑器必须再次初始化，处于编辑模式。
            如果未声明该方法，则不会显示 <em>关闭历史记录</em> 按钮。
        </p>
        <img class="screenshot" alt="onRequestHistoryClose" src="<%= Url.Content("~/content/img/editor/onRequestHistoryClose.png") %>"/>
        <div class="header-gray">示例</div>
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
    </li>

    <li>
        <p><b id="onRequestHistoryData" class="copy-link">onRequestHistoryData</b> - the function called when the user is trying to click the specific document version in the document version history.</p>
        <p>The document version number is sent in the <em>data</em> parameter.</p>
        <p>To show the changes corresponding to the specific document version you must call the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method.
            When calling this method, the token must be added to validate the parameters.
            If the method and the <a href="#onRequestHistory">onRequestHistory</a> method is not declared the <em>Version History</em> button will not be displayed.</p>
        <img class="screenshot" alt="onRequestHistoryData" src="<%= Url.Content("~/content/img/editor/onRequestHistoryData.png") %>"/>
        <div class="header-gray">示例</div>
        <pre>
var onRequestHistoryData = function (event) {
    var version = event.data;
    docEditor.setHistoryData({
        "changesUrl": "https://example.com/url-to-changes.zip",
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "previous": {
            "fileType": "docx",
            "key": "af86C7e71Ca8",
            "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsiZmlsZVR5cGUiOiJkb2N4Iiwia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4In0.pfPJs9XvCmAnPiUnZYRm0rZGPYHzqfEP7AFRjKg1af4",
        "url": "https://example.com/url-to-example-document.docx",
        "version": version
    })
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistoryData": onRequestHistoryData,
        ...
    },
    ...
});
</pre>
        <p>其中 <b>changesUrl</b> 是保存文档后返回的 <a href="<%= Url.Action("callback") %>#changesurl">JSON 对象</a> 中的 <em>changesUrl</em>。</p>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>
    </li>

    <li>
        <p><b id="onRequestInsertImage" class="copy-link">onRequestInsertImage</b> - 当用户尝试通过单击 <em>存储中的图像</em> 按钮插入图像时调用的函数。<p>
        <p>图像插入的类型在参数 <em>data.c</em>中指定。</p>
        <p>要将图像插入文件，您必须使用指定的命令调用 <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> 方法。
            如果未声明该方法，则不会显示 <em>Image from Storage</em> 按钮。</p>
        <img class="screenshot" alt="onRequestInsertImage" src="<%= Url.Content("~/content/img/editor/onRequestInsertImage.png") %>"/>
        <div class="header-gray">示例</div>
        <pre>
var onRequestInsertImage = function (event) {
    docEditor.insertImage({
        "c": event.data.c,
        "images": [
            {
        "fileType": "png",
                "url": "https://example.com/url-to-example-image1.png"
            },
            {
                "fileType": "png",
                "url": "https://example.com/url-to-example-image2.png"
            },
            ...
        ],
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZXMiOlt7ImZpbGVUeXBlIjoicG5nIiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1pbWFnZTEucG5nIn0seyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UyLnBuZyJ9XX0.ly1O8-6u4Y7WJlgp9O-bJMeffHe0GtaXzyvY2UUFJTg"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestInsertImage": onRequestInsertImage,
        ...
    },
    ...
});
</pre>
        其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
    </li>

    <li>
        <p><b id="onRequestMailMergeRecipients" class="copy-link">onRequestMailMergeRecipients</b> - the function called when the user is trying to select recipients data by clicking the <em>Mail merge</em> button.
        Deprecated since version 7.5, please use <a href="#onRequestSelectSpreadsheet">onRequestSelectSpreadsheet</a> instead.</p>
    </li>

    <li>
        <p><b id="onRequestOpen" class="copy-link">onRequestOpen</b> - the function called when the user is trying to open an external link by clicking the <em>Open source</em> button.
        If the method is not declared, this button will not be displayed.</p>
        <p>To open the editor with the external file referenced by the <em>path</em> or <em>referenceData</em> parameters in a new tab,
        you must pass a link to this tab by calling the <a href="https://developer.mozilla.org/en-US/docs/Web/API/Window/open" target="_blank">window.open</a> method with the <em>path</em> and <em>windowName</em> parameters.</p>
        <p>An object with the unique file data, the file path, and a new browser tab name are sent in the <em>data</em> parameter.</p>
        <img class="screenshot" alt="open-source" src="<%= Url.Content("~/content/img/editor/open-source.png") %>"/>
        <div class="header-gray">示例</div>
        <pre>
var onRequestOpen = function (event) {
    var path  = event.data.path;
    var referenceData = event.data.referenceData;
    var windowName  = event.data.windowName;
    window.open({
        "path": "https://example.com/external-url.docx",
        "windowName": event.data.windowName
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestOpen": onRequestOpen,
        ...
    },
    ...
});
</pre>
        其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
    </li>

    <li>
        <p>
            <b id="onRequestReferenceData" class="copy-link">onRequestReferenceData</b> - 当用户通过单击<em>数据</em>选项卡<em>外部链接</em>对话框中的<em>更新值</em>
             按钮而尝试刷新从外部文件插入的数据时，函数被调用。
             要通过事件参数指定的文件链接刷新数据，您必须调用 <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> 方法。
             具有唯一文件数据和文件路径或名称的对象在 <em>data</em> 参数中发送。 如果未声明该事件，则不会显示<em>粘贴链接</em> 和<em>更新值</em> 按钮。
        </p>
       <note>要将数据发送给<em>setReferenceData</em>方法，建议先通过<em>referenceData</em>参数搜索文件。
         如果没有这样的字段或找不到文件，则使用 <em>path</em> 参数。</note>
        <div class="img-block-2">
            <div>
                <img class="screenshot max-width-400" alt="Paste link" src="<%= Url.Content("~/content/img/editor/paste-link.png") %>" />
            </div>
            <div>
                <img class="screenshot max-width-400" alt="Update values" src="<%= Url.Content("~/content/img/editor/update-values.png") %>" />
            </div>
        </div>
        <div class="header-gray">示例</div>
        <pre>
var onRequestReferenceData = function () {
    var referenceData =  event.data.referenceData;
    var path = event.data.path;
    ...

    docEditor.setReferenceData({
        "fileType": "xlsx",
        "path": "sample.xlsx",
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com",
            "key": "Khirz6zTPdfd7"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
        "url": "https://example.com/url-to-example-document.xlsx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceData": onRequestReferenceData,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestReferenceSource" class="copy-link">onRequestReferenceSource</b> - the function called when the user is trying to change a source of the external data
        by clicking the <em>Change source</em> button.</p>
        <p>An object with the unique file data and the file path or name are sent in the <em>data</em> parameter.</p>
        <p>When the button is clicked, you must call the <a href="<%= Url.Action("methods") %>#setReferenceSource">setReferenceSource</a> method to change a source of the external data.
            When calling this method, the token must be added to validate the parameters.
            If the event is not declared, the <em>Change source</em> button will not be displayed.</p>
        <note>To send the data to the <em>setReferenceSource</em> method, it is recommended to search for the file by the <em>referenceData</em> parameter first.
        If there is no such a field or a file cannot be found, then the <em>path</em> parameter is used.</note>
        <img alt="Change source" class="screenshot" src="<%= Url.Content("~/content/img/editor/change-source.png") %>" />
        <div class="header-gray">Example</div>
        <pre>
var onRequestReferenceSource = function () {
    var referenceData =  event.data.referenceData;
    var path = event.data.path;
    ...

    docEditor.setReferenceSource({
        "fileType": "xlsx",
        "path": "sample.xlsx",
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com",
            "key": "Khirz6zTPdfd7"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
        "url": "https://example.com/url-to-example-document.xlsx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceSource": onRequestReferenceSource,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onRequestRename" class="copy-link">onRequestRename</b> - 当用户试图通过单击 <em>重命名...</em> 按钮重命名文件时调用的函数。
        </p>
        <div class="note">在 6.0 版之前， <em>重命名...</em> 按钮仅在 <a href="<%= Url.Action("config/document/permissions") %>#rename">document.permissions.rename</a> 设置为 <b>true</b>时可用。</div>
        <img class="screenshot" alt="onRequestRename" src="<%= Url.Content("~/content/img/editor/onRequestRename.png") %>"/>
        <div class="header-gray">示例</div>
        <pre>
var onRequestRename = function (event) {
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
        <p><b id="onRequestRestore" class="copy-link">onRequestRestore</b> - the function called when the user is trying to restore the file version by clicking the <em>Restore</em> button in the version history.</p>
        <p>The document version number is sent in the <em>data.version</em> parameter if it is called for the document version from the history.
            Additionally, the document link is sent in the <em>data.url</em> parameter if it is called for the document changes from the <a href="<%= Url.Action("callback") %>#history">history object</a>.
            The type of the document which is specified with this link is sent in the <em>data.fileType</em> parameter.</p>
        <p>When the function is called, you must call the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method to initialize version history again.
            If the method is not declared the <em>Restore</em> button will not be displayed.</p>
        <div class="note">
            <em>恢复</em> 按钮仅对以前的文档版本显示，对当前版本隐藏。
            在 5.5 版之前，仅当 <a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> 设置为 <b>true</b>时， <em>恢复</em> 按钮才可用。
        </div>
        <img class="screenshot" alt="onRequestRestore" src="<%= Url.Content("~/content/img/editor/onRequestRestore.png") %>"/>
        <div class="header-gray">示例</div>
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
                "changes": changes,
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
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
        <p>其中 <b>changes</b> 是保存文档后返回的 <a href="<%= Url.Action("callback") %>#history">历史对象</a> 的 <em>更改</em>。</p>
        <p>其中 <b>serverVersion</b> 是保存文档后返回的 <a href="<%= Url.Action("callback") %>#history">历史对象</a> 中的 <em>serverVersion</em>。</p>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>
    </li>

    <li>
        <p>
            <b id="onRequestSaveAs" class="copy-link">onRequestSaveAs</b> - 当用户试图通过单击 <em>另存为...</em> 按钮来保存文件时调用的函数。
            文档的标题、其类型和要下载的文档的绝对 URL 在 <em>data</em> 参数中发送。
            如果未声明该方法，将不会显示 <em>另存为...</em> 按钮。
        </p>
        <img class="screenshot" alt="onRequestSaveAs" src="<%= Url.Content("~/content/img/editor/onRequestSaveAs.png") %>"/>
        <div class="header-gray">示例</div>
        <pre>
var onRequestSaveAs = function (event) {
    var fileType = event.data.fileType;
    var title = event.data.title;
    var url = event.data.url;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSaveAs": onRequestSaveAs,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestSelectDocument" class="copy-link">onRequestSelectDocument<span class="required">*</span></b> - the function called when the user is trying to select a document for comparing or combining.</p>
        <p>The type of document selection is specified in the <em>data.c</em> parameter.</p>
        <p>To select a document for comparing or combining, you must call the <a href="<%= Url.Action("methods") %>#setRequestedDocument">setRequestedDocument</a> method.</p>
        <span class="required-descr"><span class="required">*</span><em> - available only for ONLYOFFICE Enterprise Edition and ONLYOFFICE Developer Edition</em></span>
        <img class="screenshot" alt="onRequestSelectDocument" src="<%= Url.Content("~/content/img/editor/onRequestSelectDocument.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestSelectDocument = function () {
    docEditor.setRequestedDocument({
        "c": event.data.c,
        "fileType": "docx",
        "url": "https://example.com/url-to-example-document.docx",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSelectDocument": onRequestSelectDocument,
        ...
    },
    ...
});
</pre>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </li>

    <li>
        <p><b id="onRequestSelectSpreadsheet" class="copy-link">onRequestSelectSpreadsheet</b> - the function called when the user is trying to select recipients data by clicking the <em>Mail merge</em> button.</p>
        <p>The type of spreadsheet selection is specified in the <em>data.c</em> parameter.</p>
        <p>To select recipient data, you must call the <a href="<%= Url.Action("methods") %>#setRequestedSpreadsheet">setRequestedSpreadsheet</a> method.
            When calling this method, the token must be added to validate the parameters.
            If the method is not declared, the <em>Mail merge</em> button will become faded and unclickable.</p>
        <img class="screenshot" alt="onRequestMailMergeRecipients" src="<%= Url.Content("~/content/img/editor/onRequestMailMergeRecipients.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestSelectSpreadsheet = function () {
    docEditor.setRequestedSpreadsheet({
        "c": event.data.c,
        "fileType": "xlsx",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ",
        "url": "https://example.com/url-to-example-recipients.xlsx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSelectSpreadsheet": onRequestSelectSpreadsheet,
        ...
    },
    ...
});
</pre>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </li>

    <li>
        <p><b id="onRequestSendNotify" class="copy-link">onRequestSendNotify</b> - the function called when the user is mentioned in a comment.</p>
        <p>The message and the list of emails is sent in the <em>data</em> parameter.
            The comment data is received in the <em>data.actionLink</em> parameter and must be then used in the configuration as the value for the <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> parameter.</p>
        <p>The list of users to be mentioned should be completed by <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method.</p>
        <div class="note">
            在 5.4 版本中，只有在设置了 <a href="#onRequestUsers">onRequestUsers</a> 事件时才能使用 <b>onRequestSendNotify</b> 事件。
            从 5.5 版开始， <b>onRequestSendNotify</b> 和 <b>onRequestUsers</b> 之间没有这种依赖关系两者都可以独立设置。
        </div>
        <div class="header-gray">示例</div>
        <pre>
var onRequestSendNotify = function (event) {
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
    </li>

    <li>
        <p><b id="onRequestSharingSettings" class="copy-link">onRequestSharingSettings</b> - 当用户试图通过单击 <em>更改访问权限</em> 按钮来管理文档访问权限时调用的函数。</p>
        <p>当访问权限发生变化时，您必须调用 <a href="<%= Url.Action("methods") %>#setSharingSettings">setSharingSettings</a> 方法来更新有关允许与其他用户共享文档的设置的 <a href="<%= Url.Action("config/document/info") %>#sharingSettings">信息</a>。
            如果未声明该方法，则不会显示 <em>更改访问权限</em> 按钮。</p>
        <img class="screenshot" alt="onRequestSharingSettings" src="<%= Url.Content("~/content/img/editor/onRequestSharingSettings.png") %>"/>
        <div class="header-gray">示例</div>
        <pre>
var onRequestSharingSettings = function () {
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
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSharingSettings": onRequestSharingSettings,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestUsers" class="copy-link">onRequestUsers</b> - 当用户可以选择其他用户在评论中提及或授予编辑特定工作表范围的访问权限时调用的函数。</p>
        <p>从7.4版本开始，可以在<em>data.c</em>参数中指定操作类型。 它可以采用两个值 - <em>mention</em>或<em>protect</em>。
         在版本 7.4 之前，此事件仅支持mention操作。</p>
        <p>要设置用户列表，您必须调用 <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> 方法，该方法可以根据指定的情况采用不同的用户列表 操作类型。
             当执行相应的操作时，每个 <em>c</em> 类型都会调用一次 <em>onRequestUsers</em> 事件。
             如果使用空列表调用<em>setUsers</em>，则<em>onRequestUsers</em>事件将再次触发。</p>
        <div class="img-block-2">
            <div>
                <img class="screenshot" alt="onRequestUsers" src="<%= Url.Content("~/content/img/editor/onRequestUsers.png") %>"/>
            </div>
            <div>
                <img alt="Protect range" src="<%= Url.Content("~/content/img/editor/protect-range.png") %>"/>
            </div>
        </div>
        <div class="header-gray">示例</div>
        <pre>
var onRequestUsers = function (event) {
    docEditor.setUsers({
        "c": event.data.c,
        "users": [
            {
                "email": "john@example.com",
                "id": "78e1e841",
                "name": "John Smith"
            },
            {
                "email": "kate@example.com",
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            ...
        ]
    });
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
            <b id="onWarning" class="copy-link">onWarning</b> - 发生警告时调用的函数。
            警告消息在 <em>data</em> 参数中发送。
         可以在<a href="https://github.com/ONLYOFFICE/sdkjs/blob/master/common/errorCodes.js" target="_blank">此处</a>找到错误代码列表。
        </p>
        <div class="header-gray">示例</div>
        <pre>
var onWarning = function (event) {
    console.log("ONLYOFFICE Document Editor reports a warning: code " + event.data.warningCode + ", description " + event.data.warningDescription);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onWarning": onWarning,
        ...
    },
    ...
});
</pre>
    </li>
</ul>
