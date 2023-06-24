<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("framesdk/initmethods") %>"></a>
    <span class="hdr">initFileSelector</span>
</h1>

<div id="methodDesc" class="header-gray">Description</div>
<p class="dscr">Initializes a frame for selecting files.</p>
<pre>
var docSpace = new DocSpace.SDK.initFileSelector({config});
</pre>

<h2>Methods and their description:</h2>
    <ul>
        <li>
            <p>
                <b id="destroyFrame" class="copy-link">destroyFrame</b> - destroys the <em>docSpace</em> frame.
            </p>
            <pre>
docSpace.destroyFrame();
</pre>
        </li>
    </ul>


<h2>Events and their description:</h2>
<ul>
    <li>
        <p>
            <b id="onAppReady" class="copy-link">onAppReady</b> - the function called when DocSpace is initialized successfully.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onAppReady = function () {
    console.log("ONLYOFFICE DocSpace is ready");
};

var docSpace = new DocSpace.SDK.initFileSelector({
    "events": {
        "onAppReady": null,
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>
            <b id="onAppError" class="copy-link">onAppError</b> - the function called when DocSpace is initialized with an error.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onAppError = function () {
    console.log("ONLYOFFICE DocSpace reports an error");
};

var docSpace = new DocSpace.SDK.initFileSelector({
    "events": {
        "onAppError": null,
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>
            <b id="onSelectCallback" class="copy-link">onSelectCallback</b> - the function called when a file is selected in the file selector.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onSelectCallback = function () {
    console.log("The 'New document' file was selected.");
};

var docSpace = new DocSpace.SDK.initFileSelector({
    "events": {
        "onSelectCallback": null,
        ...
    },
    ...
});
</pre>
        <p>The information about the selected item is returned:</p>
        <pre>
{
    "icon": "https://docspaceserver/url-to-example-image.svg",
    "id": 34,
    "isSelected": false,
    "label": "roomName"
}
</pre>
        <p>where <b>docspaceserver</b> is the name of the server with the ONLYOFFICE DocSpace installed.</p>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
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
                    <td>icon</td>
                    <td>Defines the URL to the file icon.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>id</td>
                    <td>Defines the file ID.</td>
                    <td>integer</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>isSelected</td>
                    <td>Specifies if the current file is selected or not.</td>
                    <td>boolean</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>label</td>
                    <td>Defines the file label.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="onCloseCallback" class="copy-link">onCloseCallback</b> - the function called when the file selector is closed.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onCloseCallback = function () {
    console.log("The file selector is closed.");
};

var docSpace = new DocSpace.SDK.initFileSelector({
    "events": {
        "onCloseCallback": null,
        ...
    },
    ...
});
</pre>
    </li>
</ul>
