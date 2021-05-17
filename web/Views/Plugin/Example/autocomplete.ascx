<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Autocomplete</span>
</h1>

<p class="dscr">An input helper, system plugin which is available in all the editors and helps the user to input the text quickly.</p>

<p class="dscr"><b>Plugin type:</b> input helper, system.</p>

<p class="dscr"><b>Supported editors:</b> input helper, system.</p>

<img alt="Write data" src="<%= Url.Content("~/content/img/plugin/example/autocomplete.png") %>" />

<h2>Installation</h2>

<p class="dscr">Download this plugin from <a href="https://www.onlyoffice.com/en/app-directory/autocomplete">ONLYOFFICE App Directory</a> and install it using the <a href="<%= Url.Action("/plugin/installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("/plugin/installation/onpremises") %>">on-premises</a> or <a href="<%= Url.Action("/plugin/installation/cloud") %>">cloud</a> installation instructions.</p>

<h2>Usage</h2>

<p class="dscr">1.	Start typing any word. If plugin finds some words in dictionary, the input helper window with found words will appear.</p>
<p class="dscr">2.	Select an option using the <b>Down/Up arrow</b> button and press the <b>Enter</b> button to complete the word.</p>

<h2>Plugin structure</h2>

<p class="dscr">Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-autocomplete">https://github.com/ONLYOFFICE/plugin-autocomplete</a></p>
<p class="dscr">1.	The obligatory components of the plugin <a href="<%= Url.Action("/plugin/structure") %>">structure</a> (config.json, index.html and code.js).</p>
<p class="dscr">2.	The <em>dictionary.js</em> file contains words for autocompletion.</p>

<h2>Config</h2>

<pre>{
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
    <li>The input helper type of this plugin is specified with the <em>onInputHelperClear</em> and <em>onInputHelperInput</em> events. So, the plugin has its own window that appears and disappears when the user types the text. Its location is tied to the text-input cursor.</li>
    <li>Please note that this plugin is system ("<em>isSystem</em>” : true), so it is not displayed on the <b>Plugins</b> tab.</li>
    <li>The "<u>isVisual</u>": false parameter means that this plugin does not have its own frame or panel.</li>
</ul>

<h2>Methods and events</h2>

<p class="dscr">The main plugin code is located <a href ="https://github.com/ONLYOFFICE/plugin-autocomplete/blob/master/scripts/code.js">here</a>. 
Some methods and events that are used in it:</p>

<ul>
    <li><a href="<%= Url.Action("/plugin/init") %>">init</a></li>
    <li><a href="<%= Url.Action("/plugin/button") %>">button</a></li>
    <li><a href="<%= Url.Action("/plugin/executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("/plugin/executemethod/inputtext") %>">executeMethod(“InputText”)</a></li>
</ul>

<h2>Support</h2>

<p class="dscr">If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/plugin-autocomplete/issues">on GitHub</a>.</p>

