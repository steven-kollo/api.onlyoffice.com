<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Autocomplete</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Helps the user to input text quickly.</p>

<p><b>Plugin type:</b> input helper, system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="Autocomplete" src="<%= Url.Content("~/content/img/plugins/gifs/autocomplete.gif") %>" />


<div class="header-gray">Installation</div>

<p>Download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/autocomplete" target="_blank">ONLYOFFICE App Directory</a> and install it following the 
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>, 
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Start typing a word. If the plugin finds some words in the dictionary, an input helper window with the found words will appear.</li>
    <li>Select the required option using the <b>Down/Up arrow</b> button and press the <b>Enter</b> button to complete the word.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-autocomplete" target="_blank">https://github.com/ONLYOFFICE/plugin-autocomplete</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>The <em>dictionary.js</em> file contains words for autocompletion.</li>
</ol>


<div class="header-gray">Config</div>
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


<div class="header-gray">Methods and events</div>

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


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/plugin-autocomplete/issues" target="_blank">GitHub</a>.</p>
