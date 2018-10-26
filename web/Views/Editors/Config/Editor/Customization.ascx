<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">Customization</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The customization section allows to customize the editor interface so that it looked like your other products (if there are any) and change the presence or absence of the additional buttons, links, change logos and editor owner details.</p>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="autosave" class="copy-link">autosave</td>
            <td>Defines if the <b>Autosave</b> menu option is enabled or disabled. If set to <b>false</b>, only <em>Strict</em> co-editing mode can be selected, as <em>Fast</em> does not work without autosave. Please note that in case you change this option in menu it will be saved to your browser localStorage. The default value is <b>true</b>.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="chat" class="copy-link">chat</td>
            <td>Defines if the <b>Chat</b> menu button is displayed or hidden; please note that in case you hide the <b>Chat</b> button, the corresponding chat functionality will also be disabled. The default value is <b>true</b>.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="commentAuthorOnly" class="copy-link">commentAuthorOnly</td>
            <td>Defines if the user can edit only his comments. The default value is <b>false</b>.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="comments" class="copy-link">comments</td>
            <td>Defines if the <b>Comments</b> menu button is displayed or hidden; please note that in case you hide the <b>Comments</b> button, the corresponding commenting functionality will be available for viewing only, the adding and editing of comments will be unavailable. Deprecated since version 4.4, please use <a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a> instead.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="compactToolbar" class="copy-link">compactToolbar</td>
            <td>Defines if the top toolbar type displayed is full (<b>false</b>) or compact <b>true</b>. The default value is <b>false</b>.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td id="customer" class="copy-link">customer<span class="required">*</span></td>
            <td>Contains the information for the editor <b>About</b> section. The object has the following parameters:
                <ul>
                    <li><b>address</b> - postal address of the above company or person,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "My City, 123a-45";
                    </li>
                    <li><b>info</b> - some information about the above company or person which will be displayed at the <b>About</b> page and visible to all editor users,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Some additional information";
                    </li>
                    <li><b>logo</b> - the path to the image logo which will be displayed at the <b>About</b> page (there are no special recommendations for this file, but it would be better if it were in .png format with transparent background). The image must have the following size: 432x70,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/logo-big.png".
                    </li>
                    <li><b>mail</b> - email address of the above company or person,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "john@example.com".
                    </li>
                    <li><b>name</b> - the name of the company or person who gives access to the editors or the editor authors,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "John Smith and Co.";
                    </li>
                    <li><b>www</b> - home website address of the above company or person,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "example.com".
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="feedback" class="copy-link">feedback</td>
            <td>Defines settings for the <b>Feedback &amp; Support</b> menu button. Can be either boolean (simply displays or hides the <b>Feedback &amp; Support</b> menu button) or object. In case of object type the following parameters are available:
                <ul>
                    <li><b>url</b> - the absolute URL to the website address which will be opened when clicking the <b>Feedback &amp; Support</b> menu button,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com";
                    </li>
                    <li><b>visible</b> - show or hide the <b>Feedback &amp; Support</b> menu button,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                </ul>
                The default value is <b>false</b>.
            </td>
            <td>boolean or object</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="forcesave" class="copy-link">forcesave</td>
            <td>Adds the request for the forced file saving to the <a href="<%= Url.Action("callback") %>#forcesavetype">callback handler</a> when saving the document within the <b>document editing service</b> (e.g. clicking the <b>Save</b> button, etc.). The default value is <b>false</b>.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td id="goback" class="copy-link">goback</td>
            <td>Defines settings for the <b>Go to Documents</b> menu button and upper right corner button. The object has the following parameters:
                <ul>
                    <li><b>blank</b> - open the website in the new browser tab/window (if the value is set to <em>true</em>) or the current tab (if the value is set to <em>false</em>) when the <b>Go to Documents</b> button is clicked. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li><b>text</b> - the text which will be displayed for the <b>Go to Documents</b> menu button and upper right corner button (i.e. instead of <em>Go to Documents</em>),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Go to Documents";
                    </li>
                    <li><b>url</b> - the absolute URL to the website address which will be opened when clicking the <b>Go to Documents</b> menu button,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com".
                    </li>
                </ul>
            </td>
            <td>boolean or object</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="help" class="copy-link">help</td>
            <td>Defines if the <b>Help</b> menu button is displayed or hidden.
                The default value is <b>true</b>.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/help.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="hideRightMenu" class="copy-link">hideRightMenu</td>
            <td>Defines if the right menu is displayed or hidden on first loading.
                The default value is <b>false</b>.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td id="logo" class="copy-link">logo<span class="required">*</span></td>
            <td>Changes the image file at the top left corner of the Editor header. The recommended image height is 20 pixels. The object has the following parameters:
                <ul>
                    <li><b>image</b> - path to the image file used to show in common work mode (i.e. in view and edit modes for all editors). The image must have the following size: 172x40,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/logo.png";
                    </li>
                    <li><b>imageEmbedded</b> - path to the image file used to show in the embedded mode (see the <a href="<%= Url.Action("config/") %>#type">config</a> section to find out how to define the <b>embedded</b> document type). The image must have the following size: 248x40,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/logo_em.png";
                    </li>
                    <li><b>url</b> - the absolute URL which will be used when someone clicks the logo image (can be used to go to your web site, etc.),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com".
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="showReviewChanges" class="copy-link">showReviewChanges</td>
            <td>Defines if the review changes panel is automatically displayed or hidden when the editor is loaded. The default value is <b>false</b>.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td id="zoom" class="copy-link">zoom</td>
            <td>Defines the document display zoom value measured in percent. Can take values larger than <b>0</b>. For text documents and presentations it is possible to set this parameter to <b>-1</b> (fitting the document to page option) or to <b>-2</b> (fitting the document page width to the editor page). The default value is <b>100</b>.</td>
            <td>integer</td>
            <td>100</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/customization.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<span class="required-descr"><span class="required">*</span><em> - available for editing only for ONLYOFFICE Developer Edition</em></span>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
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
            "hideRightMenu": false,
            "logo": {
                "image": "https://example.com/logo.png",
                "imageEmbedded": "https://example.com/logo_em.png",
                "url": "https://www.onlyoffice.com"
            },
            "showReviewChanges": false,
            "zoom": 100
        },
        ...
    },
    ...
});
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>

<p>
    If you have any further questions, please contact us at
    <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
</p>
