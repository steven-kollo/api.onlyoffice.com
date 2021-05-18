<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Add comment in cell</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in the spreadsheet editor and allows the user to add comments to spreadsheets.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> spreadsheet.</p>

<img alt="AddCommentInCell" src="<%= Url.Content("~/content/img/plugins/gifs/add-comment-in-cell.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_add_comment_in_cell" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Select the cell you want to comment on.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Example add comment in cell</b>.</li>
    <li>Enter the comment text in the field and press the <b>Add comment</b> button.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_add_comment_in_cell" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_add_comment_in_cell</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "Example add comment",
    "guid" : "asc.{89643394-0F74-4297-9E0B-541A67F1E98C}",

    "variations" : [
        {
            "description" : "Example add comment",
            "url"         : "index.html",

            "icons"           : ["icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["cell"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"         : []

        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
    <li>This plugin is an OLE-object (<em>"initDataType": "ole"</em>) that allows a third-party developer to save information from external resources to the resulting file.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_add_comment_in_cell/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
