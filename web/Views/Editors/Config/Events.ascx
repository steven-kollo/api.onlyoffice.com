<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/") %>"></a>
    <span class="hdr">Events</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The events section allows to change all the functions pertaining to the events.</p>

<ul>
    <li id="onCollaborativeChanges">
        <p><b>onCollaborativeChanges</b> - the function called when the document is co-edited by the other user in the <em>strict</em> co-editing mode.</p>
        <div class="header-gray">Example</div>
        <pre>
var onCollaborativeChanges = function () {
    console.log("The document changed by collaborative user");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
        "onCollaborativeChanges": onCollaborativeChanges,
        ...
    },
    ...
});
</pre>
    </li>

    <li id="onDocumentStateChange">
        <p><b>onDocumentStateChange</b> - the function called when the document is modified. It is called with the parameter: <em>{"data" : true}</em> when the current user is editing the document and with the parameter: <em>{"data" : false}</em> when the current user's changes are sent to the <b>document editing service</b>.</p>
        <div class="header-gray">Example</div>
        <pre>
var onDocumentStateChange = function (event) {
    if (event.data) {
        console.log("The document changed");
    } else {
        console.log("Changes are collected on document editing service");
    }
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
        "onDocumentStateChange": onDocumentStateChange,
        ...
    },
    ...
});
</pre>
    </li>

    <li id="onDownloadAs">
        <p><b>onDownloadAs</b> - the function called with the link to the edited file when the <a href="<%= Url.Action("methods") %>#downloadAs">downloadAs</a> method is being called. The link to the document to be downloaded is sent in the <em>"data"</em> parameter.</p>
        <div class="header-gray">Example</div>
        <pre>
var onDownloadAs = function (event) {
    console.log("ONLYOFFICE Document Editor create file: " + event.data);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
        "onDownloadAs": onDownloadAs,
        ...
    },
    ...
});
</pre>
    </li>

    <li id="onError">
        <p><b>onError</b> - the function called when an error or some other specific event occurs. The error message is sent in the <em>"data"</em> parameter.</p>
        <div class="header-gray">Example</div>
        <pre>
var onError = function (event) {
    console.log("ONLYOFFICE Document Editor reports an error: " + event.data);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
        "onError": onError,
        ...
    },
    ...
});
</pre>
    </li>

    <li id="onReady">
        <p><b>onReady</b> - the function called when the document is loaded into the document editor.</p>
        <div class="header-gray">Example</div>
        <pre>
var onReady = function() {
    console.log("ONLYOFFICE Document Editor is ready");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
        "onReady": onReady,
        ...
    },
    ...
});
</pre>
    </li>

    <li id="onRequestEditRights">
        <p><b>onRequestEditRights</b> - the function called when the user is trying to switch the document from the viewing into the editing mode by clicking the <em>Edit Document</em> button. When the function is called, the editor must be initialized again, in editing mode. If the method is not declared the <em>Edit</em> button will not be displayed.</p>
        <div class="note">
            <b>onRequestEditRights</b> parameter is obligatory when the <a href="<%= Url.Action("config/editor") %>#mode">editorConfig</a> <em>mode</em> parameter is set to <b>view</b> and the <em>permission</em> to <em>edit</em> the document (<a href="<%= Url.Action("config/document/permissions") %>#edit">document permissions</a>) is set to <b>true</b> so that the user could switch to the editing mode.
        </div>
        <div class="header-gray">Example</div>
        <pre>
var onRequestEditRights = function () {
    console.log("ONLYOFFICE Document Editor requests editing rights");
    document.location.reload();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
        "onRequestEditRights": onRequestEditRights,
        ...
    },
    ...
});
</pre>
    </li>

    <li id="onRequestHistory">
        <p><b>onRequestHistory</b> - the function called when the user is trying to show the document version history by clicking the <em>Version History</em> button. To show the document version history you must call the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method.</p>
        <div class="header-gray">Example</div>
        <pre>
var onRequestHistory = function() {
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
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith",
                },
                "version": 2,
            },
            ...
        ],
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
        "onRequestHistory": onRequestHistory,
        ...
    },
    ...
});
</pre>
    </li>

    <li id="onRequestHistoryData">
        <p><b>onRequestHistoryData</b> - the function called when the user is trying to click the specific document version in the document version history. To show the changes corresponding to the specific document version you must call the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method. The document version number is sent in the <em>"data"</em> parameter.</p>
        <div class="header-gray">Example</div>
        <pre>
var onRequestHistoryData = function(event) {
    var version = event.data;
    docEditor.setHistoryData({
        "changesUrl": "http://example.com/url-to-changes.zip", //the <em>changesUrl</em> from <a href="<%= Url.Action("callback") %>#changesurl">the JSON object</a> returned after saving the document
        "key": "Khirz6zTPdfd7",
        "previous": {
            "key": "af86C7e71Ca8",
            "url": "http://example.com/url-to-the-previous-version-of-the-document.docx",
        },
        "url": "http://example.com/url-to-example-document.docx",
        "version": version,
    })
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
        "onRequestHistoryData": onRequestHistoryData,
        ...
    },
    ...
});
</pre>
    </li>

    <li id="onRequestHistoryClose">
        <p><b>onRequestHistoryClose</b> - the function called when the user is trying to go back to the document from viewing the document version history  by clicking the <em>Back to Document</em> button. When the function is called, the editor must be initialized again, in editing mode. If the method is not declared the <em>Back to Document</em> button will not be displayed.</p>
        <div class="header-gray">Example</div>
        <pre>
var onRequestHistoryClose = function() {
    document.location.reload();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
        "onRequestHistoryClose": onRequestHistoryClose,
        ...
    },
    ...
});
</pre>
    </li>
</ul>
