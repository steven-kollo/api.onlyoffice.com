<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Advanced parameters
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Advanced parameters</span>
    </h1>

    <p class="dscr">The parameters, which can be changed for ONLYOFFICE Document Server, can be subdivided into the following main sections:</p>

    <a href="<%= Url.Action("config/") %>"><b>config</b></a> - allows to change the platform type used, document display size (width and height) and type of the document opened;
    <ul>
        <li>
            <a href="<%= Url.Action("config/document") %>"><b>document</b></a> - contains all the parameters pertaining to the document (title, url, file type, etc.);
            <ul>
                <li>
                    <a href="<%= Url.Action("config/document/info") %>"><b>info</b></a> - contains additional parameters for the document (document owner, folder where the document is stored, uploading date, sharing settings);
                </li>
                <li>
                    <a href="<%= Url.Action("config/document/permissions") %>"><b>permissions</b></a> - defines whether the document can be edited and downloaded or not;
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("config/editor") %>"><b>editorConfig</b></a> - defines parameters pertaining to the editor interface: opening mode (viewer or editor), interface language, additional buttons, etc.);
            <ul>
                <li>
                    <a href="<%= Url.Action("config/editor/customization") %>"><b>customization</b></a> - allows to customize the editor interface so that it looked like your other products (if there are any) and change the presence or absence of the additional buttons, links, change logos and editor owner details;
                </li>
                <li>
                    <a href="<%= Url.Action("config/editor/embedded") %>"><b>embedded</b></a> - is used for the embedded document type only and allows to change the behavior of the buttons used to control the embedded mode;
                </li>
                <li>
                    <a href="<%= Url.Action("config/editor/plugins") %>"><b>plugins</b></a> - is used to connect the necessary <a href="<%= Url.Action("basic", "plugin") %>">plugins</a> to your Document Server, so that they become visible to all document editor users;
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("config/events") %>"><b>events</b></a> - is the list of special events called when some action is applied to the document (when it is loaded, modified, etc.).
        </li>
    </ul>

    <p>The complete <em>config</em> with all the additional parameters looks the following way:</p>

    <pre>
<a href="<%= Url.Action("config/") %>">config</a> = {
    "<a href="<%= Url.Action("config/document") %>">document</a>": {
        "<a href="<%= Url.Action("config/document") %>#fileType">fileType</a>": "docx",
        "<a href="<%= Url.Action("config/document/info") %>">info</a>": {
            "<a href="<%= Url.Action("config/document/info") %>#folder">folder</a>": "Example Files",
            "<a href="<%= Url.Action("config/document/info") %>#owner">owner</a>": "John Smith",
            "<a href="<%= Url.Action("config/document/info") %>#sharingSettings">sharingSettings</a>": [
                {
                    "permissions": "Full Access",
                    "user": "John Smith"
                },
                {
                    "permissions": "Read Only",
                    "user": "Kate Cage"
                },
                ...
            ],
            "<a href="<%= Url.Action("config/document/info") %>#uploaded">uploaded</a>": "2010-07-07 3:46 PM"
        },
        "<a href="<%= Url.Action("config/document") %>#key">key</a>": "Khirz6zTPdfd7",
        "<a href="<%= Url.Action("config/document/permissions") %>">permissions</a>": {
            "<a href="<%= Url.Action("config/document/permissions") %>#comment">comment</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#download">download</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#edit">edit</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#fillForms">fillForms</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#modifyContentControl">modifyContentControl</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#modifyFilter">modifyFilter</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#print">print</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#review">review</a>": true
        },
        "<a href="<%= Url.Action("config/document") %>#title">title</a>": "Example Document Title.docx",
        "<a href="<%= Url.Action("config/document") %>#url">url</a>": "https://example.com/url-to-example-document.docx"
    },
    "<a href="<%= Url.Action("config/") %>#documentType">documentType</a>": "text",
    "<a href="<%= Url.Action("config/editor") %>">editorConfig</a>": {
        "<a href="<%= Url.Action("config/editor") %>#actionLink">actionLink</a>": ACTION_DATA,
        "<a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>": "https://example.com/url-to-callback.ashx",
        "<a href="<%= Url.Action("config/editor") %>#createUrl">createUrl</a>": "https://example.com/url-to-create-document/",
        "<a href="<%= Url.Action("config/editor/customization") %>">customization</a>": {
            "<a href="<%= Url.Action("config/editor/customization") %>#autosave">autosave</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#chat">chat</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">commentAuthorOnly</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#comments">comments</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#compactHeader">compactHeader</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#compactToolbar">compactToolbar</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#customer">customer</a>": {
                "address": "My City, 123a-45",
                "info": "Some additional information",
                "logo": "https://example.com/logo-big.png",
                "mail": "john@example.com",
                "name": "John Smith and Co.",
                "www": "example.com"
            },
            "<a href="<%= Url.Action("config/editor/customization") %>#feedback">feedback</a>": {
                "url": "https://example.com",
                "visible": true
            },
            "<a href="<%= Url.Action("config/editor/customization") %>#forcesave">forcesave</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#goback">goback</a>": {
                "blank": true,
                "requestClose": false,
                "text": "Open file location",
                "url": "https://example.com"
            },
            "<a href="<%= Url.Action("config/editor/customization") %>#help">help</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#hideRightMenu">hideRightMenu</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#logo">logo</a>": {
                "image": "https://example.com/logo.png",
                "imageEmbedded": "https://example.com/logo_em.png",
                "url": "https://example.com"
            },
            "<a href="<%= Url.Action("config/editor/customization") %>#reviewDisplay">reviewDisplay</a>": "original",
            "<a href="<%= Url.Action("config/editor/customization") %>#showReviewChanges">showReviewChanges</a>": false,
            "<a href="<%= Url.Action("config/editor/customization") %>#spellcheck">spellcheck</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#toolbarNoTabs">toolbarNoTabs</a>": false,
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
                 ...
             ]
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
        "<a href="<%= Url.Action("config/editor") %>#user">user</a>": {
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
        "<a href="<%= Url.Action("config/events") %>#onRequestClose">onRequestClose</a>": onRequestClose,
        "<a href="<%= Url.Action("config/events") %>#onRequestCompareFile">onRequestCompareFile</a>": onRequestCompareFile,
        "<a href="<%= Url.Action("config/events") %>#onRequestEditRights">onRequestEditRights</a>": onRequestEditRights,
        "<a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a>": onRequestHistory,
        "<a href="<%= Url.Action("config/events") %>#onRequestHistoryClose">onRequestHistoryClose</a>": onRequestHistoryClose,
        "<a href="<%= Url.Action("config/events") %>#onRequestHistoryData">onRequestHistoryData</a>": onRequestHistoryData,
        "<a href="<%= Url.Action("config/events") %>#onRequestInsertImage">onRequestInsertImage</a>": onRequestInsertImage,
        "<a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">onRequestMailMergeRecipients</a>": onRequestMailMergeRecipients,
        "<a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a>": onRequestRestore,
        "<a href="<%= Url.Action("config/events") %>#onRequestSaveAs">onRequestSaveAs</a>": onRequestSaveAs,
        "<a href="<%= Url.Action("config/events") %>#onRequestSharingSettings">onRequestSharingSettings</a>": onRequestSaveAs,
        "<a href="<%= Url.Action("config/events") %>#onWarning">onWarning</a>": onWarning
    },
    "<a href="<%= Url.Action("config/") %>#height">height</a>": "100%",
    "<a href="<%= Url.Action("config/") %>#token">token</a>": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.t-IDcSemACt8x4iTMCda8Yhe3iZaWbvV5XKSTbuAn0M",
    "<a href="<%= Url.Action("config/") %>#type">type</a>": "desktop",
    "<a href="<%= Url.Action("config/") %>#width">width</a>": "100%"
};
</pre>
    <p>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>
</asp:Content>
