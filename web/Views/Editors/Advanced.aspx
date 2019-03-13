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
                    <a href="<%= Url.Action("config/document/info") %>"><b>info</b></a> - contains additional parameters for the document (document author, folder where the document is stored, creation date, sharing settings);
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
config = {
    "document": {
        "fileType": "docx",
        "info": {
            "author": "John Smith",
            "created": "2010-07-07 3:46 PM",
            "folder": "Example Files",
            "sharingSettings": [
                {
                    "permissions": "Full Access",
                    "user": "John Smith"
                },
                {
                    "permissions": "Read Only",
                    "user": "Kate Cage"
                },
                ...
            ]
        },
        "key": "Khirz6zTPdfd7",
        "permissions": {
            "comment": true,
            "download": true,
            "edit": true,
            "fillForms": true,
            "print": true,
            "review": true
        },
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "text",
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx",
        "createUrl": "https://example.com/url-to-create-document/",
        "customization": {
            "autosave": true,
            "chat": true,
            "commentAuthorOnly": false,
            "compactToolbar": false,
            "customer": {
                "address": "My City, 123a-45",
                "info": "Some additional information",
                "logo": "https://example.com/logo-big.png",
                "mail": "john@example.com",
                "name": "John Smith and Co.",
                "www": "example.com"
            },
            "feedback": {
                "url": "https://example.com",
                "visible": true
            },
            "forcesave": false,
            "goback": {
                "blank": true,
                "text": "Go to Documents",
                "url": "https://example.com"
            },
            "help": true,
            "logo": {
                "image": "https://example.com/logo.png",
                "imageEmbedded": "https://example.com/logo_em.png",
                "url": "https://example.com"
            },
            "showReviewChanges": false,
            "zoom": 100
        },
        "embedded": {
            "embedUrl": "https://example.com/embedded?doc=exampledocument1.docx",
            "fullscreenUrl": "https://example.com/embedded?doc=exampledocument1.docx#fullscreen",
            "saveUrl": "https://example.com/download?doc=exampledocument1.docx",
            "shareUrl": "https://example.com/view?doc=exampledocument1.docx",
            "toolbarDocked": "top"
        },
        "lang": "en-US",
        "mode": "edit",
        "plugins": {
             "autostart": [
                 "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
                 "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
                 ...
             ],
             "pluginsData": [
                 "https://example.com/plugin1/config.json",
                 "https://example.com/plugin2/config.json",
                 ...
             ]
        },
        "recent": [
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
        "user": {
            "id": "78e1e841",
            "name": "John Smith"
        }
    },
    "events": {
        "onAppReady": onAppReady,
        "onCollaborativeChanges": onCollaborativeChanges,
        "onDocumentReady": onDocumentReady,
        "onDocumentStateChange": onDocumentStateChange,
        "onDownloadAs": onDownloadAs,
        "onError": onError,
        "onInfo": onInfo,
        "onOutdatedVersion": onOutdatedVersion,
        "onRequestClose": onRequestClose,
        "onRequestEditRights": onRequestEditRights,
        "onRequestHistory": onRequestHistory,
        "onRequestHistoryClose": onRequestHistoryClose,
        "onRequestHistoryData": onRequestHistoryData,
        "onWarning": onWarning
    },
    "height": "100%",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.t-IDcSemACt8x4iTMCda8Yhe3iZaWbvV5XKSTbuAn0M",
    "type": "desktop",
    "width": "100%"
};
</pre>
    <p>Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>
</asp:Content>
