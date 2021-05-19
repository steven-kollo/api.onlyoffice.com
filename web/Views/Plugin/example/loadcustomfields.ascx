<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Load custom fields</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in the document editor and allows the user to load custom fields from the document.</p>
<p class="note">
The fields should be already added to the document with the <a href="<%= Url.Action("example/addcustomfields") %>">Example add custom fields</a> plugin.
</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="LoadCustomFields" src="<%= Url.Content("~/content/img/plugins/gifs/load-custom-fields.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_load" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Example load custom fields</b>.</li>
    <li>To answer a <b>simple question</b> type your answer in the <b>type here...</b> field.</li>
    <li>To answer a <b>question with drop down variants</b> select one option.</li>
    <li>Press the <b>Next</b> button to go to the next question or the <b>Back</b> button to go back to the previous one.</li>
    <li>When all the questions are answered, the plugin will be automatically closed. Your answers will appear in the document.</li>
</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_load" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_load</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "Example loading custom fields",
    "guid" : "asc.{E5A81B17-C871-4C4B-A90A-62D3A7EC0751}",

    "variations" : [
        {
            "description" : "Example loading custom fields",
            "url"         : "index.html",

            "icons"           : ["icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png"],
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
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_customfields_load/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onMethodReturn">onMethodReturn</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/getallcontentcontrols") %>">executeMethod ("GetAllContentControls")</a></li>
    <li><a href="<%= Url.Action("executemethod/insertandreplacecontentcontrols") %>">executeMethod ("InsertAndReplaceContentControls")</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
