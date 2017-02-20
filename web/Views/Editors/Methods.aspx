<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Methods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Methods</span>
    </h1>

    <p class="dscr">After initializing <b>document editor</b> you will get the object that can be used to call the methods.</p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", config);
</pre>

    <ul>
        <li id="denyEditingRights">
            <p><b>denyEditingRights</b> - deny editing. This method can be called when you want to make the document editing unavailable.</p>
            <pre>
docEditor.denyEditingRights(message);
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
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>message</td>
                        <td>Text messages for dialog</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                </tbody>
            </table>
        </li>
        <li id="destroyEditor">
            <p><b>destroyEditor</b> - destroy <em>docEditor</em> object. This method can be called when you want to reinit document editor with another configurations.</p>
            <pre>
docEditor.destroyEditor();
</pre>
        </li>

        <li id="downloadAs">
            <p><b>downloadAs</b> - download the edited file. This method can be called only when the existence of the <a href="<%= Url.Action("config/events") %>#onDownloadAs">onDownloadAs</a> events. <b>Document editing service</b> asynchronously creates a document and triggers the <b>onDownloadAs</b> event with a link in parameter.</p>
            <pre>
docEditor.downloadAs();
</pre>
        </li>

        <li id="refreshHistory">
            <p><b>refreshHistory</b> - show the document version history. This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a> events.</p>
            <pre>
docEditor.refreshHistory({
    "currentVersion": 2,
    "history": [
        {
            "changes": changes, //the <em>changes</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document
            "created": "2010-07-06 10:13 AM",
            "key": "af86C7e71Ca8",
            "serverVersion": serverVersion, //the <em>serverVersion</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document
            "user": {
                "id": "F89d8069ba2b",
                "name": "Kate Cage",
            },
            "version": 1,
        },
        {
            "changes": changes,
            "created": "2010-07-07 3:46 PM",
            "key": "Khirz6zTPdfd7",
            "serverVersion": serverVersion,
            "user": {
                "id": "78e1e841",
                "name": "John Smith",
            },
            "version": 2,
        },
        ...
    ],
});
</pre>
            <p>Show the error message explaining why the version history can not be displayed.</p>
            <pre>
docEditor.refreshHistory({
    "error": "Exception",
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
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>currentVersion</td>
                        <td>defines the current document version number</td>
                        <td>integer</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>error</td>
                        <td>defines the error message text</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history</td>
                        <td>defines the array with the document versions</td>
                        <td>array</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.changes</td>
                        <td>defines the <em>changes</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document</td>
                        <td>object</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.created</td>
                        <td>defines the document version creation date</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.key</td>
                        <td>defines the unique document identifier used for document recognition by the service</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.user</td>
                        <td>defines the user who is the author of the document version </td>
                        <td>object</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.user.id</td>
                        <td>defines the identifier of the user who is the author of the document version</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.user.name</td>
                        <td>defines the name of the user who is the author of the document version</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.version</td>
                        <td>defines the document version number</td>
                        <td>integer</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
        </li>

        <li id="setHistoryData">
            <p><b>setHistoryData</b> - send the link to the document for viewing the version history. This method must be called after the <a href="<%= Url.Action("config/events") %>#onRequestHistoryData">onRequestHistoryData</a> events.</p>
            <pre>
docEditor.setHistoryData({
    "key": "Khirz6zTPdfd7",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3giLCJ2ZXJzaW9uIjoyfQ.N9N9IMwX5e6kdfx4wssAPrGMnzPAZCd4PwDf2D8mJ8s",
    "url": "http://example.com/url-to-example-document.docx",
    "version": 2,
});
</pre>
            <p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>
            <p>If after editing and saving the document the link <em>changesurl</em> to the file with changes data is returned, download the file by this link and send the file url in <em>changesUrl</em> parameter. The url address of the document previous version must be sent in <em>previous.url</em> parameter.</p>
            <pre>
docEditor.setHistoryData({
    "changesUrl": "http://example.com/url-to-changes.zip",
    "key": "Khirz6zTPdfd7",
    "previous": {
        "key": "af86C7e71Ca8",
        "url": "http://example.com/url-to-the-previous-version-of-the-document.docx",
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1jaGFuZ2VzLnppcCIsImtleSI6IktoaXJ6NnpUUGRmZDciLCJwcmV2aW91cyI6eyJrZXkiOiJhZjg2QzdlNzFDYTgiLCJ1cmwiOiJodHRwOi8vZXhhbXBsZS5jb20vdXJsLXRvLXRoZS1wcmV2aW91cy12ZXJzaW9uLW9mLXRoZS1kb2N1bWVudC5kb2N4In0sInVybCI6Imh0dHA6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.9dgDsaVLFQ6RtoX_1s2pBVJHGnyMjxDXKC2TpC2nXb4",
    "url": "http://example.com/url-to-example-document.docx",
    "version": 2,
});
</pre>
            <p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>
            <p>Send the error message explaining why the document version can not be displayed.</p>
            <pre>
docEditor.setHistoryData({
    "error": "Exception",
    "version": 2,
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
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>changesUrl</td>
                        <td>defines the url address of the file with the document changes data, which can be downloaded by the <em>changesurl</em> link from <a href="<%= Url.Action("callback") %>#changesurl">the JSON object</a> returned after saving the document</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>error</td>
                        <td>defines the error message text</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>key</td>
                        <td>defines the document identifier used to unambiguously identify the document file.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous</td>
                        <td>defines the object of the previous version of the document if <em>changesUrl</em> address was returned after saving the document</td>
                        <td>object</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous.key</td>
                        <td>defines the document identifier of the previous version of the document</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous.url</td>
                        <td>defines the url address of the previous version of the document</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="token">token</td>
                        <td>defines the encrypted signature added to the parameter in the form of a <a href="<%= Url.Action("signature/browser") %>#setHistoryData">token</a></td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>defines the url address of the current version of the document. Can be downloaded by the <em>url</em> link from <a href="<%= Url.Action("callback") %>#url">the JSON object</a> returned after saving the document</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>version</td>
                        <td>defines the document version number</td>
                        <td>integer</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
        </li>

        <li id="showMessage">
            <p><b>showMessage</b> - Display dialog with the message. This method can be called only after the <a href="<%= Url.Action("config/events") %>#onReady">onReady</a> events.</p>
            <pre>
docEditor.showMessage(title, message, type);
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
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>title</td>
                        <td>Dialog title</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>message</td>
                        <td>Message text</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>type</td>
                        <td>Defines dialog type. Can be: <b>info</b>, <b>warning</b>, <b>error</b></td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                </tbody>
            </table>
        </li>
    </ul>

</asp:Content>
