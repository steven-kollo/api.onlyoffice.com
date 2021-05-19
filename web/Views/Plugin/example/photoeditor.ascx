<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Photo Editor</span>
</h1>

<p class="dscr">A visual, non-system plugin which is available in all the editors and allows the user to connect the <a href="https://ui.toast.com/tui-image-editor" target="_blank">Toast UI Image Editor</a> for editing images right in the document: cropping, resizing, applying effects, etc.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> document, spreadsheet, presentation.</p>

<img alt="PhotoEditor" src="<%= Url.Content("~/content/img/plugins/gifs/photo-editor.gif") %>" />


<h2>Installation</h2>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it using the <a href="https://api.teamlab.info/plugin/installation/desktop">desktop</a>, <a href="https://api.teamlab.info/plugin/installation/onpremises" target="_blank">on-premises</a> or <a href="https://api.teamlab.info/plugin/installation/cloud" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {07FD8DFA-DFE0-4089-AL24-0730933CC80A}.</p>


<h2>Usage</h2>

<ol>
    <li>Select an image in your document.</li>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Below the image, you will find different settings for editing.</li>
    <li>After setting all the parameters up, press the <b>OK</b> button.</li>
</ol>


<h2>Plugin structure</h2>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-photoeditor" target="_blank">https://github.com/ONLYOFFICE/plugin-photoeditor</a>.</p>
<ol>
    <li>The obligatory components of the <a href="<%= Url.Action("structure") %>">plugin structure</a> (<em>config.json</em>, <em>index.html</em> and <em>code.js</em>).</li>
    <li>Icons.</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech and French.</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window.</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="http://jquery.com/" target="_blank">http://jquery.com/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-photoeditor/blob/master/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>Toast UI Image Editor</b> is a full featured image editor that uses HTML5 Canvas. It's easy to use and provides powerful filters (<a href="https://ui.toast.com/tui-image-editor" target="_blank">https://ui.toast.com/tui-image-editor</a>).  License: <a href="https://github.com/ONLYOFFICE/plugin-photoeditor/blob/master/licenses/Tui.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<h2>Config</h2>
<pre>
{
    "name": "Photo Editor",
    "nameLocale": {
        "ru": "&#1060;&#1086;&#1090;&#1086;&#1088;&#1077;&#1076;&#1072;&#1082;&#1090;&#1086;&#1088;",
        "fr": "Photo Editor",
        "es": "Editor de Fotos",
        "de": "Foto-Editor"
    },
    "guid": "asc.{07FD8DFA-DFE0-4089-AL24-0730933CC80A}",
    "baseUrl": "",

    "variations": [
        {
            "description": "Photo Editor",
            "descriptionLocale": {
                "ru": "&#1060;&#1086;&#1090;&#1086;&#1088;&#1077;&#1076;&#1072;&#1082;&#1090;&#1086;&#1088;",
                "fr": "Photo Editor",
                "es": "Editor de Fotos",
                "de": "Foto-Editor"
            },
            "url": "index.html",

            "icons": [ "icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "html",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [
                {
                    "text": "Ok",
                    "primary": true
                },
                {
                    "text": "Cancel",
                    "primary": false,
                    "isViewer": false,
                    "textLocale": {
                        "ru": "&#1054;&#1090;&#1084;&#1077;&#1085;&#1072;",
                        "fr": "Annuler",
                        "es": "Cancelar",
                        "de": "Abbrechen"
                    }
                }
            ],

            "size": [ 10000, 10000 ]
        },
        {
            "description": "About",
            "descriptionLocale": {
                "ru": "&#1057;&#1087;&#1088;&#1072;&#1074;&#1082;&#1072;",
                "fr": "A&#768; propos",
                "es": "Sobre programa",
                "de": "&#220;ber"
            },
            "url": "index_about.html",

            "icons": [ "icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "none",
            "initData": "",

            "isUpdateOleOnResize": false,



            "size": [ 392, 147 ]
        }
    ]
}
</pre>

<ul>
    <li>The plugin is visual (<em>"isVisual": true</em>), so it works in its own frame.</li>
    <li>This plugin has two variations - for the plugin itself and for the <b>About</b> window.</li>
    <li>The plugin name and description are translated into Russian, French, Spanish, Czech and German with the <em>nameLocale</em> and <em>descriptionLocale</em> parameters.</li>
    <li>This plugin has two buttons - <em>Okt</em> and <em>Cancel</em>. They are specified with the buttons parameter and translated into Russian, French, Spanish and German languages with the <em>textLocale</em> parameter.</li>
</ul>


<h2>Methods and events</h2>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-photoeditor/blob/master/scripts/photoeditor.js" target="_blank">here</a>.</p>
<ul class="columns-2">
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("resizewindow") %>">resizeWindow</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
    <li><a href="<%= Url.Action("info") %>#editorType">info.editorType</a></li>
</ul>


<h2>Support</h2>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">on GitHub</a>.</p>
