<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Autocomplete</span>
</h1>

<p class="dscr">An input helper, system plugin that is available in all the editors and helps the user to input text quickly.</p>

<p><b>Plugin type:</b> input helper, system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>

<img alt="Autocomplete" src="<%= Url.Content("~/content/img/plugins/gifs/autocomplete.gif") %>" />


<h2>Installation</h2>

<p>Download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/autocomplete" target="_blank">ONLYOFFICE App Directory</a> and install it using the 
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a> 
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<h2>Usage</h2>

<ol>
    <li>Start typing a word. If the plugin finds some words in the dictionary, an input helper window with the found words will appear.</li>
    <li>Select the required option using the <b>Down/Up arrow</b> button and press the <b>Enter</b> button to complete the word.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-autocomplete" target="_blank">https://github.com/ONLYOFFICE/plugin-autocomplete</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>The <em>dictionary.js</em> file contains words for autocompletion.</li>
</ol>


<h2>Config</h2>
<pre>
{
    "name" : "example_autocomplete",
    "guid" : "asc.{A103601F-FDA0-418A-BC37-A514031894C0}",

    "variations" : [
        {
            "description" : "example_autocomplete",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["word", "slide", "cell"],

            "isVisual"        : false,
            "isModal"         : false,
            "isInsideMode"    : false,
            "isSystem"        : true,

            "initDataType"    : "none",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons"        : [ ],
   
            "events" : [
                "onInputHelperClear",
                "onInputHelperInput"
            ]
        }
    ]
}
</pre>

<ul>
    <li>The input helper type of this plugin is specified with the <em>onInputHelperClear</em> and <em>onInputHelperInput</em> events. 
    So, the plugin has its own window that appears and disappears when the user types text. Its location is tied to the text-input cursor.</li>
    <li>Please note that this is a system plugin (<em>"isSystem" : true</em>), so it is not displayed on the <b>Plugins</b> tab.</li>
    <li>The <em>"isVisual": false</em> parameter means that this plugin does not have its own frame or panel.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-autocomplete/blob/master/scripts/code.js" target="_blank">here</a>.</p>
<ul class="columns-2">
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#inputHelper_onSelectItem">inputHelper_onSelectItem</a></li>
    <li><a href="<%= Url.Action("events") %>#onInputHelperClear">onInputHelperClear</a></li>
    <li><a href="<%= Url.Action("events") %>#onInputHelperInput">onInputHelperInput</a></li>
    <li><a href="<%= Url.Action("createinputhelper") %>">createInputHelper</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/inputtext") %>">executeMethod ("InputText")</a></li>
    <li><a href="<%= Url.Action("getinputhelper") %>">getInputHelper</a></li>
    <li><a href="<%= Url.Action("inputhelper") %>#createWindow">InputHelper.createWindow</a></li>
    <li><a href="<%= Url.Action("inputhelper") %>#getItems">InputHelper.getItems</a></li>
    <li><a href="<%= Url.Action("inputhelper") %>#setItems">InputHelper.setItems</a></li>
    <li><a href="<%= Url.Action("inputhelper") %>#show">InputHelper.show</a></li>
    <li><a href="<%= Url.Action("inputhelper") %>#unShow">InputHelper.unShow</a></li>  
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/plugin-autocomplete/issues" target="_blank">on GitHub</a>.</p>
