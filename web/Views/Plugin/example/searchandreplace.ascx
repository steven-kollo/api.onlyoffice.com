<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Search & replace</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in the document editor and allows the user to search for target text and replace it with something else.</p>
<p><b>Plugin type:</b> visual, non-system, OLE-object.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="SearchandReplace" src="<%= Url.Content("~/content/img/plugins/gifs/search-and-replace.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_search_replace" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Insert the search text into the document (this text is in the array <em>arrCodes</em> in the plugin code).</li>
    <li>Open the <b>Plugins</b> tab and press <b>Example of search and replace</b>.</li>
    <li>Enter the text you want to replace each field with and press the <b>Ok</b> button.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_search_replace" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_search_replace</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "Example of search and replace",
    "guid" : "asc.{5FF5F75F-2977-4B98-8D36-7C406D610B90}",

    "variations" : [
        {
            "description" : "Example of search and replace",
            "url"         : "index.html",

            "icons"           : ["icon.png", "icon@2x.png"],
            "isViewer"        : true,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : true,
            "isInsideMode"    : false,

            "initDataType"    : "ole",
            "initData"        : "",

            "isUpdateOleOnResize" : true,

            "buttons"         : []
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works in its own frame.</li>
    <li>This plugin is an OLE-object (<em>"initDataType": "ole"</em>) that allows a third-party developer to save information from external resources to the resulting file.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_search_replace/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onMethodReturn">onMethodReturn</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/searchandreplace") %>">executeMethod ("SearchAndReplace")</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
