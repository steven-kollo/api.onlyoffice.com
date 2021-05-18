<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Work with content controls navigation</span>
</h1>

<p class="dscr">A visual, non-system plugin that is available in the document editor and allows the user to insert content controls (automatically or manually), navigate and select them as well as paste text into them.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document.</p>

<img alt="WorkWithContentControlsNavigation" src="<%= Url.Content("~/content/img/plugins/gifs/work-with-content-controls-navigation.gif") %>" />


<h2>Installation</h2>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_navigation" target="_blank">GitHub</a> and install it using the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Add some content controls into the document.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Example work with content controls navigation</b>.</li>
    <li>In the first field, you can see all the content controls with their IDs (they are updated automatically).</li>
    <li>To move to the specific content control, click it in the list.</li>
    <li>Press the <b>Test paste for document</b> button to paste text into the document (where the text cursor is located).</li>
    <li>In the second field, you can see the selected content.</li>
    <li>Press the <b>Get All Content Controls</b> button in the third field to see all the content controls with their IDs.</li>
    <li>To select text in a content control, select it and press the<b> Select Current Content Control</b> button.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_navigation" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_navigation</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>Third-party service:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/example_work_with_content_controls_navigation/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "Example work with content controls navigation",
    "guid" : "asc.{C36DDFB5-08F0-4A68-B829-5FB1F7D49728}",

    "variations" : [
        {
            "description" : "Example work with content controls navigation",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "text",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"         : [],

            "initOnSelectionChanged" : true,

            "events" : ["onTargetPositionChanged"]
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so on the left-side panel of the editor.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_work_with_content_controls_navigation/code.js" target="_blank">here</a>.</p>
<ul class="columns-2">
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onMethodReturn">onMethodReturn</a></li>
    <li><a href="<%= Url.Action("events") %>#onTargetPositionChanged">onTargetPositionChanged</a></li>
    <li><a href="<%= Url.Action("executemethod/getallcontentcontrols") %>">executeMethod ("GetAllContentControls")</a></li>
    <li><a href="<%= Url.Action("executemethod/getcurrentcontentcontrol") %>">executeMethod ("GetCurrentContentControl")</a></li>
    <li><a href="<%= Url.Action("executemethod/movecursortocontentcontrol") %>">executeMethod ("MoveCursorToContentControl")</a></li>
    <li><a href="<%= Url.Action("executemethod/selectcontentcontrol") %>">executeMethod ("SelectContentControl")</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
