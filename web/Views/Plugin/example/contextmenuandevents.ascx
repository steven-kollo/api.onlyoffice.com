<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Context menu and events</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Tracks the events of calling the context menu and clicking on its items. It also tracks the cursor position changes.</p>
<p><b>Plugin type:</b> non-visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="Context menu and events" src="<%= Url.Content("~/content/img/plugins/gifs/context-menu-and-events.gif") %>" />


<div class="header-gray">Installation</div>
<p>Copy the code below and save it in the <em>config.json</em>, <em>index.html</em>, and <em>code.js</em> files respectively.
Download the <em>resources</em> folder with icons from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_add/resources" target="_blank">this plugin</a>. 
Put all the files and the folder into the plugin folder and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>ContextMenu and Events</b>.</li>
    <li>Place a cursor anywhere in the document, press the right mouse button, and go to <b>Item 1 -&gt; Subitem 2</b>.
    The <em>clicked: onClickItem1Sub2</em> message will be inserted at the cursor position.</li>
    <li>Select any text in the document, press the right mouse button, and click <b>Item 3</b>. The <em>clicked: onClickItem3</em> message will be inserted in place of the selected text.</li>
    <li>Select any shape or image in the document, press the right mouse button, and click <b>Item 4</b>. The <em>clicked: onClickItem4</em> message will appear in the console.</li>
    <li>Change the cursor position. The <em>event: onTargetPositionChanged</em> message will appear in the console.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
    <li>Icons</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "ContextMenu and Events",
    "guid" : "asc.{B617C899-03AA-476F-8D2C-1B7272489CBC}",

    "variations" : [
        {
            "description" : "example context menu and events",
            "url"         : "index.html",

            "icons": [ "resources/light/icon.png", "resources/light/icon@2x.png" ],
            "icons2": [
                {
                    "style" : "light",
                    
                    "100%": {
                        "normal": "resources/light/icon.png"
                    },
                    "125%": {
                        "normal": "resources/light/icon@1.25x.png"
                    },
                    "150%": {
                        "normal": "resources/light/icon@1.5x.png"
                    },
                    "175%": {
                        "normal": "resources/light/icon@1.75x.png"
                    },
                    "200%": {
                        "normal": "resources/light/icon@2x.png"
                    }
                },
                {
                    "style" : "dark",
                    
                    "100%": {
                        "normal": "resources/dark/icon.png"
                    },
                    "125%": {
                        "normal": "resources/dark/icon@1.25x.png"
                    },
                    "150%": {
                        "normal": "resources/dark/icon@1.5x.png"
                    },
                    "175%": {
                        "normal": "resources/dark/icon@1.75x.png"
                    },
                    "200%": {
                        "normal": "resources/dark/icon@2x.png"
                    }
                }
            ],
            "isViewer"        : false,
            "EditorsSupport"  : ["word"],

            "isVisual"        : false,
            "isModal"         : false,
            "isInsideMode"    : false,
            "isSystem"        : false,

            "initDataType"    : "none",
            "initData"        : "",

            "buttons"        : [ ],

            "events" : [
                "onContextMenuShow",
                "onTargetPositionChanged"
            ]
        }
    ]
}
</pre>

<div class="header-gray">index.html</div>
<pre>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
    &lt;head&gt;
        &lt;meta charset="UTF-8"&gt;
        &lt;title&gt;example context menu and events&lt;/title&gt;
        &lt;script type="text/javascript" src="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.js"&gt;&lt;/script&gt;    
        &lt;script src="scripts/code.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
    &lt;/body&gt;
&lt;/html&gt;
</pre>

<p class="spoiler_heading spoiler_plugin">Plugin code</p>
<pre class="spoiler_code">
(function(window, undefined){

    console.log('work');
    window.Asc.plugin.init = function()
    {
    };

    window.Asc.plugin.button = function(id)
    {
        this.executeCommand("close", "");
    };

    window.Asc.plugin.event_onContextMenuShow = function(options) {
        switch (options.type)
        {
            case "Target":
            {
                this.executeMethod("AddContextMenuItem", [{
                    guid : this.guid,
                    items : [
                        {
                            id : "onClickItem1",
                            text : { en : "Item 1", de : "Men&#252; 1" },
                            items : [
                                {
                                    id : "onClickItem1Sub1",
                                    text : { en : "Subitem 1", de : "Untermen&#252; 1" },
                                    disabled : true
                                },
                                {
                                    id : "onClickItem1Sub2",
                                    text : { en : "Subitem 2", de : "Untermen&#252; 2" },
                                    separator: true
                                }
                            ]
                        },
                        {
                            id : "onClickItem2",
                            text : { en : "Item 2", de : "Men&#252; 2" }
                        }
                    ]
                }]);
                break;
            }
            case "Selection":
            {
                this.executeMethod("AddContextMenuItem", [{
                    guid : this.guid,
                    items : [
                        {
                            id : "onClickItem3",
                            text : { en : "Item 3", de : "Men&#252; 3" }
                        }
                    ]
                }]);
                break;
            }
            case 'Image':
            case 'Shape':
            {
                this.executeMethod("AddContextMenuItem", [{
                    guid : this.guid,
                    items : [
                        {
                            id : "onClickItem4",
                            text : { en : "Item 4", de : "Men&#252; 4" }
                        }
                    ]
                }]);
                break;
            }
            default:
                break;
        }
    };

    window.Asc.plugin.attachContextMenuClickEvent("onClickItem1Sub1", function(){
        window.Asc.plugin.executeMethod("InputText", ["clicked: onClickItem1Sub1"]);
    });

    window.Asc.plugin.attachContextMenuClickEvent("onClickItem1Sub2", function(){
        window.Asc.plugin.executeMethod("InputText", ["clicked: onClickItem1Sub2"]);
    });

    window.Asc.plugin.attachContextMenuClickEvent("onClickItem2", function(){
        window.Asc.plugin.executeMethod("InputText", ["clicked: onClickItem2"]);
    });

    window.Asc.plugin.attachContextMenuClickEvent("onClickItem3", function(){
        window.Asc.plugin.executeMethod("InputText", ["clicked: onClickItem3"]);
    });

    window.Asc.plugin.attachContextMenuClickEvent("onClickItem4", function(){
        console.log("clicked: onClickItem4");
    });

    window.Asc.plugin.event_onTargetPositionChanged = function()
    {
        console.log("event: onTargetPositionChanged");

    };

})(window, undefined);
</pre>

<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onTargetPositionChanged") %>">onTargetPositionChanged</a></li>
    <li><a href="<%= Url.Action("attachContextMenuClickEvent") %>">attachContextMenuClickEvent</a></li>
    <li><a href="<%= Url.Action("executemethod/common/addcontextmenuitem") %>">executeMethod ("AddContextMenuItem")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/inputtext") %>">executeMethod ("InputText")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
