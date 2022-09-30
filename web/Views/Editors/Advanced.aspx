<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    高级参数
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">高级参数</span>
    </h1>

    <p class="dscr">ONLYOFFICE 文档服务器可以更改的参数可以细分为以下主要部分：</p>

    <a href="<%= Url.Action("config/") %>"><b>config</b></a> - 允许更改使用的平台类型、文档显示大小（宽度和高度）和打开文档的类型；
    <ul>
        <li>
            <a href="<%= Url.Action("config/document") %>"><b>document</b></a> - 包含与文档有关的所有参数（标题、网址、文件类型等）；
            <ul>
                <li>
                    <a href="<%= Url.Action("config/document/info") %>"><b>info</b></a> - 包含文档的附加参数（文档所有者、存储文档的文件夹、上传日期、共享设置）；
                </li>
                <li>
                    <a href="<%= Url.Action("config/document/permissions") %>"><b>permissions</b></a> - 定义是否可以编辑和下载文档；
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("config/editor") %>"><b>editorConfig</b></a> - 定义与编辑器界面有关的参数：打开模式（查看器或编辑器）、界面语言、附加按钮等）；
            <ul>
                <li>
                    <a href="<%= Url.Action("config/editor/customization") %>"><b>customization</b></a> - 允许自定义编辑器界面，使其看起来像您的其他产品（如果有），并更改附加按钮、链接、更改徽标和编辑器所有者详细信息的显示或不显示；
                </li>
                <li>
                    <a href="<%= Url.Action("config/editor/embedded") %>"><b>embedded</b></a> - 仅用于嵌入式文档类型，并允许更改用于控制嵌入式模式的按钮的行为；
                </li>
                <li>
                    <a href="<%= Url.Action("config/editor/plugins") %>"><b>plugins</b></a> - 用于将必要的 <a href="<%= Url.Action("basic", "plugin") %>">插件</a> 连接到您的文档服务器，以便所有文档编辑器用户都可以看到它们；
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("config/events") %>"><b>events</b></a> - 是在对文档进行某些操作时调用的特殊事件列表，这些操作包括加载、修改等。
        </li>
    </ul>

    <p>包含所有附加参数的完整 <em>config</em> 如下所示：</p>

    <pre>
<a href="<%= Url.Action("config/") %>">config</a> = {
    "<a href="<%= Url.Action("config/document") %>">document</a>": {
        "<a href="<%= Url.Action("config/document") %>#fileType">fileType</a>": "docx",
        "<a href="<%= Url.Action("config/document/info") %>">info</a>": {
            "<a href="<%= Url.Action("config/document/info") %>#favorite">favorite</a>": true,
            "<a href="<%= Url.Action("config/document/info") %>#folder">folder</a>": "Example Files",
            "<a href="<%= Url.Action("config/document/info") %>#owner">owner</a>": "John Smith",
            "<a href="<%= Url.Action("config/document/info") %>#sharingSettings">sharingSettings</a>": [
                {
                    "permissions": "Full Access",
                    "user": "John Smith"
                },
                {
                    "isLink": true,
                    "permissions": "Read Only",
                    "user": "External link"
                },
                ...
            ],
            "<a href="<%= Url.Action("config/document/info") %>#uploaded">uploaded</a>": "2010-07-07 3:46 PM"
        },
        "<a href="<%= Url.Action("config/document") %>#key">key</a>": "Khirz6zTPdfd7",
        "<a href="<%= Url.Action("config/document/permissions") %>">permissions</a>": {
            "<a href="<%= Url.Action("config/document/permissions") %>#chat">chat</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#comment">comment</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#commentGroups">commentGroups</a>": [
                "edit": ["Group2", ""],
                "remove": [""],
                "view": ""
            ],
            "<a href="<%= Url.Action("config/document/permissions") %>#copy">copy</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#deleteCommentAuthorOnly">deleteCommentAuthorOnly</a>": false,
            "<a href="<%= Url.Action("config/document/permissions") %>#download">download</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#edit">edit</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#editCommentAuthorOnly">editCommentAuthorOnly</a>": false,
            "<a href="<%= Url.Action("config/document/permissions") %>#fillForms">fillForms</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#modifyContentControl">modifyContentControl</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#modifyFilter">modifyFilter</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#print">print</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#protect">protect</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#review">review</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#reviewGroups">reviewGroups</a>": ["Group1", "Group2", ""],
            "<a href="<%= Url.Action("config/document/permissions") %>#userInfoGroups">userInfoGroups</a>": ["Group1", ""]
        },
        "<a href="<%= Url.Action("config/document") %>#title">title</a>": "Example Document Title.docx",
        "<a href="<%= Url.Action("config/document") %>#url">url</a>": "https://example.com/url-to-example-document.docx"
    },
    "<a href="<%= Url.Action("config/") %>#documentType">documentType</a>": "word",
    "<a href="<%= Url.Action("config/editor") %>">editorConfig</a>": {
        "<a href="<%= Url.Action("config/editor") %>#actionLink">actionLink</a>": ACTION_DATA,
        "<a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>": "https://example.com/url-to-callback.ashx",
        "<a href="<%= Url.Action("config/editor") %>#coEditing">coEditing</a>": {
            "mode": "fast",
            "change": true
        },
        "<a href="<%= Url.Action("config/editor") %>#createUrl">createUrl</a>": "https://example.com/url-to-create-document/",
        "<a href="<%= Url.Action("config/editor/customization") %>">customization</a>": {
            "<a href="<%= Url.Action("config/editor/customization") %>#anonymous">anonymous</a>": {
                "request": true,
                "label": "Guest"
            },
            "<a href="<%= Url.Action("config/editor/customization") %>#autosave">autosave</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#comments">comments</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#compactHeader">compactHeader</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#compactToolbar">compactToolbar</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#compatibleFeatures">compatibleFeatures</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#customer">customer</a>": {
                "address": "My City, 123a-45",
                "info": "Some additional information",
                "logo": "https://example.com/logo-big.png",
                "logoDark": "https://example.com/dark-logo-big.png",
                "mail": "john@example.com",
                "name": "John Smith and Co.",
                "www": "example.com"
            },
            "<a href="<%= Url.Action("config/editor/customization") %>#features">features</a>": {
                "spellcheck": {
                    "mode": true,
                    "change": true
                }
            },
        "<a href="<%= Url.Action("config/editor/customization") %>#feedback">feedback</a>": {
                "url": "https://example.com",
                "visible": true
            },
        "<a href="<%= Url.Action("config/editor/customization") %>#forcesave">forcesave</a>": false,
        "<a href="<%= Url.Action("config/editor/customization") %>#goback">goback</a>": {
                "blank": true,
                "requestClose":
                false, "text": "Open file location",
                "url": "https://example.com"
            },
            "<a href="<%= Url.Action("config/editor/customization") %>#help">help</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#hideNotes">hideNotes</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#hideRightMenu">hideRightMenu</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#hideRulers">hideRulers</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#logo">logo</a>": {
                "image": "https://example.com/logo.png",
                "imageDark": "https://example.com/dark-logo.png",
                "url": "https://example.com"
            },
            "<a href="<%= Url.Action("config/editor/customization") %>#macros">macros</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#macrosMode">macrosMode</a>": "warn",
            "<a href="<%= Url.Action("config/editor/customization") %>#mentionShare">mentionShare</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#plugins">plugins</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#review">review</a>": {
                "hideReviewDisplay": false,
        "showReviewChanges": false,
                "reviewDisplay": "original",
                "trackChanges": true,
                "hoverMode": false
                },<%--
            "<a href="<%= Url.Action("config/editor/customization") %>#submitForm">submitForm</a>": true,--%>
        "<a href="<%= Url.Action("config/editor/customization") %>#toolbarHideFileName">toolbarHideFileName</a>": false,
        "<a href="<%= Url.Action("config/editor/customization") %>#toolbarNoTabs">toolbarNoTabs</a>": false,
        "<a href="<%= Url.Action("config/editor/customization") %>#uiTheme">uiTheme</a>": "theme-dark",
        "<a href="<%= Url.Action("config/editor/customization") %>#unit">unit</a>": "cm",
        "<a href="<%= Url.Action("config/editor/customization") %>#zoom">zoom</a>": 100
        },
        "<a href="<%= Url.Action("config/editor/embedded") %>">embedded</a>": {
            "<a href="<%= Url.Action("config/editor/embedded") %>#embedUrl">embedUrl</a>": "https://example.com/embedded?doc=exampledocument1.docx",
            "<a href="<%= Url.Action("config/editor/embedded") %>#fullscreenUrl">fullscreenUrl</a>": "https://example.com/embedded?doc=exampledocument1.docx#fullscreen",
            "<a href="<%= Url.Action("config/editor/embedded") %>#saveUrl">saveUrl</a>": "https://example.com/download?doc=exampledocument1.docx",
            "<a href="<%= Url.Action("config/editor/embedded") %>#shareUrl">shareUrl</a>": "https://example.com/view?doc=exampledocument1.docx",
            "<a href="<%= Url.Action("config/editor/embedded") %>#toolbarDocked">toolbarDocked</a>": "top"
        },
        "<a href="<%= Url.Action("config/editor") %>#lang">lang</a>": "en",
        "<a href="<%= Url.Action("config/editor") %>#location">location</a>": "us",
        "<a href="<%= Url.Action("config/editor") %>#mode">mode</a>": "edit",
        "<a href="<%= Url.Action("config/editor/plugins") %>">plugins</a>": {
             "<a href="<%= Url.Action("config/editor/plugins") %>#autostart">autostart</a>": [
                 "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
                 "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
        ...
        ],
             "<a href="<%= Url.Action("config/editor/plugins") %>#pluginsData">pluginsData</a>": [
                 "https://example.com/plugin1/config.json",
                 "https://example.com/plugin2/config.json",
                 
             ...]
        },
        "<a href="<%= Url.Action("config/editor") %>#recent">recent</a>": [
            {
                "folder": "Example Files",
                "title": "exampledocument1.docx",
                "url": "https://example.com/exampledocument1.docx"
            },
            {
                "folder": "Example Files",
                "title": "exampledocument2.docx",
                "url": "https://example.com/exampledocument2.docx"
            },
            ...
        ],
        "<a href="<%= Url.Action("config/editor") %>#region">region</a>": "en-US",
        "<a href="<%= Url.Action("config/editor") %>#templates">templates</a>": [
            {
                "image": "https://example.com/exampletemplate1.png",
                "title": "exampletemplate1.docx",
                "url": "https://example.com/url-to-create-template1"
            },
            {
                "image": "https://example.com/exampletemplate2.png",
                "title": "exampletemplate2.docx",
                "url": "https://example.com/url-to-create-template2"
            },
            ...
        ],
        "<a href="<%= Url.Action("config/editor") %>#user">user</a>": {
            "group": "Group1",
            "id": "78e1e841",
            "name": "John Smith"
        }
    },
    "<a href="<%= Url.Action("config/events") %>">events</a>": {
        "<a href="<%= Url.Action("config/events") %>#onAppReady">onAppReady</a>": onAppReady,
        "<a href="<%= Url.Action("config/events") %>#onCollaborativeChanges">onCollaborativeChanges</a>": onCollaborativeChanges,
        "<a href="<%= Url.Action("config/events") %>#onDocumentReady">onDocumentReady</a>": onDocumentReady,
        "<a href="<%= Url.Action("config/events") %>#onDocumentStateChange">onDocumentStateChange</a>": onDocumentStateChange,
        "<a href="<%= Url.Action("config/events") %>#onDownloadAs">onDownloadAs</a>": onDownloadAs,
        "<a href="<%= Url.Action("config/events") %>#onError">onError</a>": onError,
        "<a href="<%= Url.Action("config/events") %>#onInfo">onInfo</a>": onInfo,
        "<a href="<%= Url.Action("config/events") %>#onMetaChange">onMetaChange</a>": onMetaChange,
        "<a href="<%= Url.Action("config/events") %>#onOutdatedVersion">onOutdatedVersion</a>": onOutdatedVersion,
        "<a href="<%= Url.Action("config/events") %>#onPluginsReady">onPluginsReady</a>": onPluginsReady,
        "<a href="<%= Url.Action("config/events") %>#onRequestClose">onRequestClose</a>": onRequestClose,
        "<a href="<%= Url.Action("config/events") %>#onRequestCompareFile">onRequestCompareFile</a>": onRequestCompareFile,
        "<a href="<%= Url.Action("config/events") %>#onRequestCreateNew">onRequestCreateNew</a>": onRequestCreateNew,
        "<a href="<%= Url.Action("config/events") %>#onRequestEditRights">onRequestEditRights</a>": onRequestEditRights,
        "<a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a>": onRequestHistory,
        "<a href="<%= Url.Action("config/events") %>#onRequestHistoryClose">onRequestHistoryClose</a>": onRequestHistoryClose,
        "<a href="<%= Url.Action("config/events") %>#onRequestHistoryData">onRequestHistoryData</a>": onRequestHistoryData,
        "<a href="<%= Url.Action("config/events") %>#onRequestInsertImage">onRequestInsertImage</a>": onRequestInsertImage,
        "<a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">onRequestMailMergeRecipients</a>": onRequestMailMergeRecipients,
        "<a href="<%= Url.Action("config/events") %>#onRequestRename">onRequestRename</a>": onRequestRename,
        "<a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a>": onRequestRestore,
        "<a href="<%= Url.Action("config/events") %>#onRequestSaveAs">onRequestSaveAs</a>": onRequestSaveAs,
        "<a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a>": onRequestSendNotify,
        "<a href="<%= Url.Action("config/events") %>#onRequestSharingSettings">onRequestSharingSettings</a>": onRequestSaveAs,
        "<a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a>": onRequestUsers,
        "<a href="<%= Url.Action("config/events") %>#onWarning">onWarning</a>": onWarning
    },
    "<a href="<%= Url.Action("config/") %>#height">height</a>": "100%",
    "<a href="<%= Url.Action("config/") %>#token">token</a>": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.t-IDcSemACt8x4iTMCda8Yhe3iZaWbvV5XKSTbuAn0M",
    "<a href="<%= Url.Action("config/") %>#type">type</a>": "desktop",
    "<a href="<%= Url.Action("config/") %>#width">width</a>": "100%"
};
    </pre>
    <p>
        其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
    </p>
</asp:Content>
