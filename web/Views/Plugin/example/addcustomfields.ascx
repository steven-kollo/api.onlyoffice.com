<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Add custom fields</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in the document editor and allows the user to insert custom fields into the document.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="AddCustomFields" src="<%= Url.Content("~/content/img/plugins/gifs/add-custom-fields.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_add" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Example add custom fields</b>.</li>
    <li>To add a <b>simple field</b> type your question and its label in the necessary fields and press the <b>Add simple field</b> button</li>
    <li>To add a <b>drop down field</b> type your question and its label in the necessary fields and add answer options. To add an answer option, type it in the <b>Type your item</b> field and press the <b>Add</b> button. Repeat it if you need more options. To remove any answer option, select it in the combo box and press the <b>Remove</b> button. When the field is ready, press the <b>Add drop down field</b> button.</li>
    <li>The field will be added in the current text cursor position.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_add" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_add</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "Example add custom fields",
    "guid" : "asc.{4E2B5030-E1BE-41FA-BEE3-7E9BE7B5BFCF}",

    "variations" : [
        {
            "description" : "Example add custom fields",
            "url"         : "index.html",

            "icons"           : ["icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "none",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"         : []
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works on the left-side panel of the editor.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_customfields_add/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onMethodReturn">onMethodReturn</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/addcontentcontrol") %>">executeMethod ("AddContentControl")</a></li>
    <li><a href="<%= Url.Action("executemethod/insertandreplacecontentcontrols") %>">executeMethod ("InsertAndReplaceContentControls")</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
