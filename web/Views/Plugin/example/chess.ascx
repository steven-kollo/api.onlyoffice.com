<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Chess</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in all the editors and allows the user to insert a Chess Board object into the document editor. The object makes it possible to edit and save the chess position in the <em>FEN</em> format.</p>
<p><b>Plugin type:</b> visual, OLE-object, non-system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>

<img alt="Chess" src="<%= Url.Content("~/content/img/plugins/gifs/chess.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/chess" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Chess</b>.</li>
    <li>A chessboard window will appear on the screen and you can play chess.</li>
    <li>To interrupt the game, press the <b>Ok</b> button. The game preview in form of an image will appear in your document with all the changes saved. Click it to continue the game. </li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/chess" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/chess</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "chess(fen)",
    "guid" : "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",

    "variations" : [
        {
            "description" : "chess",
            "url"         : "index.html",

            "icons"           : ["icon.png", "icon@2x.png"],
            "isViewer"        : true,
            "EditorsSupport"  : ["word", "cell", "slide"],

            "isVisual"        : true,
            "isModal"         : true,
            "isInsideMode"    : false,

            "initDataType"    : "ole",
            "initData"        : "",

            "isUpdateOleOnResize" : true,

            "buttons"         : [ { "text": "Ok", "primary": true },
                                { "text": "Cancel", "primary": false } ]
        },
        {
            "description" : "About",
            "url"         : "index_about.html",

            "icons"           : ["icon.png", "icon@2x.png"],
            "isViewer"        : true,
            "EditorsSupport"  : ["word", "cell", "slide"],

            "isVisual"        : true,
            "isModal"         : true,
            "isInsideMode"    : false,

            "initDataType"    : "none",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"         : [ { "text": "Ok", "primary": true } ],

            "size" : [392, 147]
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works in its own frame.</li>
    <li>This plugin has two variations - for the plugin itself and for the <b>About</b> window.</li>
    <li>This plugin is an OLE-object (<em>"initDataType": "ole"</em>) that allows a third-party developer to save information from external resources to the resulting file.</li>
    <li>This plugin has two buttons - <em>Ok</em> and <em>Cancel</em>. They are specified with the buttons parameter</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/chess/chess.js" target="_blank">here</a>.</p>
<ul class="columns-2">
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("onexternalmouseup") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/addoleobject") %>">executeMethod ("AddOleObject")</a></li>
    <li><a href="<%= Url.Action("executemethod/editoleobject") %>">executeMethod ("EditOleObject")</a></li>
    <li><a href="<%= Url.Action("info/data") %>">info.data</a></li>
    <li><a href="<%= Url.Action("info/guid") %>">info.guid</a></li>
    <li><a href="<%= Url.Action("info/height") %>">info.height</a></li>
    <li><a href="<%= Url.Action("info/imgscr") %>">info.imgScr</a></li>
    <li><a href="<%= Url.Action("info/mmtopx") %>">info.mmToPx</a></li>
    <li><a href="<%= Url.Action("info/objectid") %>">info.objectId</a></li>
    <li><a href="<%= Url.Action("info/resize") %>">info.resize</a></li>
    <li><a href="<%= Url.Action("info/width") %>">info.width</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
