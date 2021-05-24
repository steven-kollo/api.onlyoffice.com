<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Work with content controls navigation</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Inserts content controls (automatically or manually), navigates and selects them as well as pastes text into them.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="WorkWithContentControlsNavigation" src="<%= Url.Content("~/content/img/plugins/gifs/work-with-content-controls-navigation.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_navigation" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

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


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_navigation" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_navigation</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>Third-party service:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/example_work_with_content_controls_navigation/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
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


<div class="header-gray">Methods and events</div>

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


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
