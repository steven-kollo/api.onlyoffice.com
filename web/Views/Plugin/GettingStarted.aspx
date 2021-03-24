<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Getting started with plugins
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Getting started with plugins</span>
    </h1>

    <p>Let&#8217;s see how to build the simplest <b>Hello world!</b> plugin, which inserts the <em>Hello World!</em> phrase when you press the button.</p>
    <p>Follow these steps when building the plugin:</p>
    <ol>
        <li>Code the plugin</li>
        <li>Adjust the plugin style</li>
        <li>Localize the plugin</li>
        <li>Prepare for publication</li>
        <li>Test the plugin</li>
        <li>Publish the plugin</li>
    </ol>


    <h2>Step 1. Code the plugin</h2>

    <p>Explore the <a href="<%= Url.Action("structure") %>">plugin structure</a>. 
        Create all the necessary files for the plugin to work correctly: <a href="<%= Url.Action("config") %>">config.json</a>,
        <a href="<%= Url.Action("indexhtml") %>">index.html</a>, <a href="<%= Url.Action("code") %>">pluginCode.js</a>.
        Use plugin methods and events while writing the plugin code.</p>
    <p>The <em>config.json</em> code will look the following way:</p>
    <pre>
{
    "name"       : "hello world",
    "guid"       : "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
    "baseUrl"    : "",
    "variations" : [
        {
            "description"         : "hello world",
            "url"                 : "index.html",
            "icons"               : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"            : false,
            "EditorsSupport"      : ["word"],
            "isVisual"            : false,
            "isModal"             : true,
            "isInsideMode"        : false,
            "initDataType"        : "none",
            "initData"            : "",
            "isUpdateOleOnResize" : true,
            "buttons"             : []
        },
        {
            "description"         : "About",
            "url"                 : "index_about.html",
            "icons"               : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"            : false,
            "EditorsSupport"      : ["word"],
            "isVisual"            : true,
            "isModal"             : true,
            "isInsideMode"        : false,
            "initDataType"        : "none",
            "initData"            : "",
            "isUpdateOleOnResize" : true,
            "buttons"         : [
                {
                    "text": "Ok",
                    "primary": true
                }
            ],

            "size" : [392, 147]
        }
    ]
}
</pre>

    <p>The <em>index.html</em> code will look the following way:</p>
    <pre>
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
    &lt;meta charset="UTF-8" /&gt;
    &lt;title&gt;Hello world&lt;/title&gt;
    &lt;script type="text/javascript" src="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.js"&gt;&lt;/script&gt;
    &lt;script type="text/javascript" src="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins-ui.js"&gt;&lt;/script&gt;
    &lt;link rel="stylesheet" href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css"&gt;
    &lt;script type="text/javascript" src="scripts/helloworld.js"&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

    <p>Now write the main code for your plugin. There are some methods that are used for the <b>Hello world!</b> plugin to work correctly:</p>
    <ul>
        <li><a href="<%= Url.Action("init") %>">init</a></li>
        <li><a href="<%= Url.Action("button") %>">button</a></li>
        <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
        <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    </ul>

    <p>The <em>pluginCode.js</em> file will look like this:</p>
    <pre>
(function(window, undefined){

    var text = "Hello world!";

    window.Asc.plugin.init = function()
    {
        var variant = 2;

        switch (variant)
        {
            case 0:
            {
                // serialize command as text
                var sScript = "var oDocument = Api.GetDocument();";
                sScript += "oParagraph = Api.CreateParagraph();";
                sScript += "oParagraph.AddText('Hello world!');";
                sScript += "oDocument.InsertContent([oParagraph]);";
                this.info.recalculate = true;
                this.executeCommand("close", sScript);
                break;
            }
            case 1:
            {
                // call command without external variables
                this.callCommand(function() {
                    var oDocument = Api.GetDocument();
                    var oParagraph = Api.CreateParagraph();
                    oParagraph.AddText("Hello world!");
                    oDocument.InsertContent([oParagraph]);
                }, true);
                break;
            }
            case 2:
            {
                // call command with external variables
                Asc.scope.text = text; // export variable to plugin scope
                this.callCommand(function() {
                    var oDocument = Api.GetDocument();
                    var oParagraph = Api.CreateParagraph();
                    oParagraph.AddText(Asc.scope.text); // or oParagraph.AddText(scope.text);
                    oDocument.InsertContent([oParagraph]);
                }, true);
                break;
            }
            default:
                break;
        }
    };

    window.Asc.plugin.button = function(id)
    {
    };

})(window, undefined);
</pre>


    <h2>Step 2. Adjust the plugin style</h2>

    <p>Add the ONLYOFFICE <a href="<%= Url.Action("styles") %>">style sheet</a> to the <em>index.html</em> file, if you want to adjust your plugin to the ONLYOFFICE editor style:</p>
    <pre>
&lt;link rel="stylesheet" href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css"&gt;
</pre>


    <h2>Step 3. Localize the plugin</h2>

    <p><a href="<%= Url.Action("localization") %>">Localize</a> your plugin if needed.</p>
    <p>In the <em>config.json</em> add the new nodes with the key name plus <em>Locale</em>, equal to an object
        that have the language locale as the key and the translation as the value:</p>
    <pre>
"name": "hello world",
"nameLocale": {
    "de": "hallo welt",
    "es": "hola mundo",
    "fr": "bonjour le monde"
}
</pre>
    <p>Create the <em>translations</em> folder in the plugin directory with <em>.json</em> files for each language you want to add the translations for:</p>
    <pre>
..
[translations]
    de-DE.json
    es-ES.json
    fr-FR.json
</pre>
    <p>These files contain the objects with the source (English) language words and phrases as keys and translations into the selected language as values.</p>
    <p>To apply the translations, you need to add unique IDs to each element which has the string value you want to localize:</p>
    <pre>
&lt;button id="button_ok"&gt;Ok&lt;/button&gt;
</pre>
    <p>After that add the <em>window.Asc.plugin.onTranslate</em> function to the <em>pluginCode.js</em> file:</p>
    <pre>
window.Asc.plugin.onTranslate = function()
    {
        var label = document.getElementById("button_ok");
        if (label)
            label.innerHTML = window.Asc.plugin.tr("Ok");
}
</pre>


    <h2>Step 4. Prepare for publication</h2>

    <p>Think whether you want to create an <b>About</b> window for your plugin. To make it, you need to create a variation for <b>Hello world!</b> plugin. 
        So this plugin should have two variations in its config: the plugin itself and the <b>About</b> window which must be <b>visual</b>:</p>
    <pre>
{
    "isVisual": true 
}            
</pre>
    <img alt="About window" src="<%= Url.Content("~/content/img/plugins/about-window.png") %>" />
    <p>Don&#8217;t forget to create the <em>index_about.html</em> file for the <b>About</b> window.</p>
    <p>Prepare icons for the plugin. Make sure that they are of the following sizes (icons with the lowest ID value are placed first to specify the application icons):</p>
    <ul>
        <li><b>icon.png</b> - 40x40;</li>
        <li><b>icon@2x.png</b> - 80x80;</li>
        <li><b>icon2.png</b> - 26x26;</li>
        <li><b>icon2@2x.png</b>- 52x52.</li>
    </ul>
    <p>Don&#8217;t forget about the <em>readme</em> file with the description for your plugin.</p>


    <h2>Step 5. Test the plugin</h2>

    <p>Put all the prepared files to the plugin folder. That&#8217;s it! The <b>Hello world!</b> plugin is ready. 
        Now you can <a href="<%= Url.Action("installation") %>">connect</a> it to the editor and test.</p>
    <img alt="Hello world gif" width="900" height="500" src="<%= Url.Content("~/content/img/plugins/helloworld.gif")  %>" />


    <h2>Step 6. Publish the plugin</h2>

    <p>If you want your plugin to be available to other users, suggest it for publishing 
        by contacting us at <a href="mailto:marketing@onlyoffice.com" target="_blank">marketing@onlyoffice.com</a>.</p>

</asp:Content>