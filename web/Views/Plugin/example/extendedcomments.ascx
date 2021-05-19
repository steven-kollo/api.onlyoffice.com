<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Extended conmments</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in all the editors and allows the user to paste, edit and remove comments and replies (with user data) in a document.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="ExtendedComments" src="<%= Url.Content("~/content/img/plugins/gifs/extended-comments.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/develop/example_extended_comments" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Extended comments</b>.</li>
    <li>Select the text you want to comment on. Enter the comment text and the author name in the fields. Define the <b>Problem Category</b>, <b>Severity</b> and <b>Submitted by</b> fields for the comment and click the <b>Comment</b> button to add the comment into the document.</li>
    <li>All the document comments will be displayed in the lower plugin window.</li>
    <li>To delete any comment, select it in the lower plugin window and click the <b>Delete</b> button.</li>
    <li>To reply to any comment, select it in the lower plugin window and click the <b>Add reply</b> button. Enter a reply text, check if the comment is accepted or not and click the <b>Reply</b> button.</li>
    <li>To edit any comment, click the <b>Edit</b> button, enter new text or change the comment properties and click the <b>Ok</b> button.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/develop/example_extended_comments" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/develop/example_extended_comments</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/example_extended_comments/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>Select2</b> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options (<a href="https://select2.org/" target="_blank">https://select2.org/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/example_extended_comments/licenses/Select2.license" target="_blank">MIT</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "Extended comments",
    "guid" : "asc.{91EAC419-EF8B-440C-A960-B451C7DF3A37}",

    "variations" : [
        {
            "description" : "Extended comments",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"         : [],
            "events" : ["onAddComment", "onRemoveComment", "onChangeCommentData"]

        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/example_extended_comments/scripts/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/addcomment") %>">executeMethod ("AddComment")</a></li>
    <li><a href="<%= Url.Action("executemethod/changecomment") %>">executeMethod ("ChangeComment")</a></li>
    <li><a href="<%= Url.Action("executemethod/getallcomments") %>">executeMethod ("GetAllComments")</a></li>
    <li><a href="<%= Url.Action("executemethod/movetocomment") %>">executeMethod ("MoveToComment")</a></li>
    <li><a href="<%= Url.Action("executemethod/removecomments") %>">executeMethod ("RemoveComments")</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
