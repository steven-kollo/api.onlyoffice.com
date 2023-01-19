<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    config.json
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">config.json</span>
    </h1>

    <div class="header-gray">Description</div>
    <p class="dscr">The <em>config.json</em> file is plugin configuration file containing the information about the main plugin data needed to register the plugin in the editors.</p>

    <ul class="columns-3" style="list-style: none;">
        <li><a href="#baseUrl">baseUrl</a></li>
        <li><a href="#guid">guid</a></li>
        <li><a href="#help">help</a></li>
        <li><a href="#minVersion">minVersion</a></li>
        <li><a href="#name">name</a></li>
        <li><a href="#nameLocale">nameLocale</a></li>
        <li><a href="#variations">variations</a></li>
        <li><a href="#buttons">variations.buttons</a></li>
        <li><a href="#cryptoDisabledForExternalCloud">variations.cryptoDisabledForExternalCloud</a></li>
        <li><a href="#cryptoDisabledForInternalCloud">variations.cryptoDisabledForInternalCloud</a></li>
        <li><a href="#cryptoDisabledOnStart">variations.cryptoDisabledOnStart</a></li>
        <li><a href="#cryptoMode">variations.cryptoMode</a></li>
        <li><a href="#description">variations.description</a></li>
        <li><a href="#descriptionLocale">variations.descriptionLocale</a></li>
        <li><a href="#EditorsSupport">variations.EditorsSupport</a></li>
        <li><a href="#events">variations.events</a></li>
        <li><a href="#icons">variations.icons</a></li>
        <li><a href="#icons2">variations.icons2</a></li>
        <li><a href="#initData">variations.initData</a></li>
        <li><a href="#initDataType">variations.initDataType</a></li>
        <li><a href="#initOnSelectionChanged">variations.initOnSelectionChanged</a></li>
        <li><a href="#isCustomWindow">variations.isCustomWindow</a></li>
        <li><a href="#isDisplayedInViewer">variations.isDisplayedInViewer</a></li>
        <li><a href="#isInsideMode">variations.isInsideMode</a></li>
        <li><a href="#isModal">variations.isModal</a></li>
        <li><a href="#isSystem">variations.isSystem</a></li>
        <li><a href="#isUpdateOleOnResize">variations.isUpdateOleOnResize</a></li>
        <li><a href="#isViewer">variations.isViewer</a></li>
        <li><a href="#isVisual">variations.isVisual</a></li>
        <li><a href="#size">variations.size</a></li>
        <li><a href="#store">variations.store</a></li>
        <li><a href="#store-background">variations.store.background</a></li>
        <li><a href="#store-icons">variations.store.icons</a></li>
        <li><a href="#store-screenshots">variations.store.screenshots</a></li>
        <li><a href="#url">variations.url</a></li>
        <li><a href="#version">version</a></li>
    </ul>

    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col style="width: 220px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
                <td>Example</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="baseUrl" class="copy-link">baseUrl</td>
                <td>Path to the plugin. All the other paths are calculated relative to this path. In case the plugin is installed on the server, an additional parameter (path to the plugins) is added there. If <em>baseUrl == ""</em>, the path to all plugins will be used.</td>
                <td>string</td>
                <td>""</td>
            </tr>
            <tr class="tablerow">
                <td id="guid" class="copy-link">guid</td>
                <td>Plugin identifier. It <b>must</b> be of the <em>asc.{UUID}</em> type.</td>
                <td>string</td>
                <td>"asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}"</td>
            </tr>
            <tr class="tablerow">
                <td id="help" class="copy-link">help</td>
                <td>Path to the plugin description page. If the parameter is specified, the <em>help</em> button is displayed in the plugin window. When the user clicks the button, he follows the link to the plugin description page.</td>
                <td>string</td>
                <td>""</td>
            </tr>
            <tr class="tablerow">
                <td id="minVersion" class="copy-link">minVersion</td>
                <td>The minimum supported editors version.</td>
                <td>string</td>
                <td>"6.3.0"</td>
            </tr>
            <tr class="tablerow">
                <td id="name" class="copy-link">name</td>
                <td>Plugin name which will be visible at the plugin toolbar.</td>
                <td>string</td>
                <td>"plugin name"</td>
            </tr>
            <tr class="tablerow">
                <td id="nameLocale" class="copy-link">nameLocale</td>
                <td>Translations for the name field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the plugin name translation for each language.</td>
                <td>object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="variations" class="copy-link">variations</td>
                <td>Plugin variations, or subplugins, that are created inside the origin plugin. More information you can find <a href="<%= Url.Action("variations") %>">here</a>.</td>
                <td>array of objects</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="buttons" class="copy-link">variations.buttons</td>
                <td>
                    The list of skinnable plugin buttons used in the plugin interface (used for visual plugins with their own window only, i.e. <em>isVisual == true &amp;&amp; isInsideMode == false</em>). 
                    The button object can have the folowing parameters:
                    <ul>
                        <li>
                            <b>text</b> - the label which is displayed on the button,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "Cancel";
                        </li>
                        <li>
                            <b>primary</b> - defines if the button is primary or not. The primary flag affects the button skin only,
                            <br />
                            <b>type</b>: boolean,
                            <br />
                            <b>example</b>: true;
                        </li>
                        <li>
                            <b>isViewer</b> - defines if the button is shown in the viewer mode only or not,
                            <br />
                            <b>type</b>: boolean,
                            <br />
                            <b>example</b>: false;
                        </li>
                        <li>
                            <b>textLocale</b> - translations for the text field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the button label translation for each language,
                            <br />
                            <b>type</b>: object
                        </li>
                    </ul>
                </td>
                <td>array of objects</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="cryptoDisabledForExternalCloud" class="copy-link">variations.cryptoDisabledForExternalCloud</td>
                <td>
                    Specifies if the encryption for the third-party clouds is disabled or not.
                </td>
                <td>string</td>
                <td>"true"</td>
            </tr>
            <tr class="tablerow">
                <td id="cryptoDisabledForInternalCloud" class="copy-link">variations.cryptoDisabledForInternalCloud</td>
                <td>
                    Specifies if the encryption for the ONLYOFFICE clouds is disabled or not.
                </td>
                <td>string</td>
                <td>"true"</td>
            </tr>
            <tr class="tablerow">
                <td id="cryptoDisabledOnStart" class="copy-link">variations.cryptoDisabledOnStart</td>
                <td>
                    Specifies if the mode is reset on restart or not.
                </td>
                <td>string</td>
                <td>"true"</td>
            </tr>
            <tr class="tablerow">
                <td id="cryptoMode" class="copy-link">variations.cryptoMode</td>
                <td>The encryption plugin ID as there are several encryption plugins.</td>
                <td>string</td>
                <td>"1"</td>
            </tr>
            <tr class="tablerow">
                <td id="description" class="copy-link">variations.description</td>
                <td>The description, i.e. what describes your plugin the best way.</td>
                <td>string</td>
                <td>"plugin description"</td>
            </tr>
            <tr class="tablerow">
                <td id="descriptionLocale" class="copy-link">variations.descriptionLocale</td>
                <td>Translations for the description field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the plugin description translation for each language.</td>
                <td>object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="EditorsSupport" class="copy-link">variations.EditorsSupport</td>
                <td>The editors which the plugin is available for (<b>word</b> - text document editor, <b>cell</b> - spreadsheet editor, <b>slide</b> - presentation editor).</td>
                <td>array of strings</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="events" class="copy-link">variations.events</td>
                <td>
                    Plugin events.
                </td>
                <td>array of strings</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="icons" class="copy-link">variations.icons</td>
                <td>Plugin icon image files used in the editors.</td>
                <td>array of strings</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="icons2" class="copy-link">variations.icons2</td>
                <td>Scalable icons for plugin extensions. More information can be found <a href="<%= Url.Action("icons") %>">here</a>.</td>
                <td>array of objects</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="initData" class="copy-link">variations.initData</td>
                <td>Is usually equal to <em>""</em> - this is the data which is sent from the editor to the plugin at the plugin start (e.g. if <em>initDataType == "text"</em>, the plugin will receive the selected text when run). It may also be equal to <em>encryption</em> in the encryption plugins.</td>
                <td>string</td>
                <td>""</td>
            </tr>
            <tr class="tablerow">
                <td id="initDataType" class="copy-link">variations.initDataType</td>
                <td>The data type selected in the editor and sent to the plugin: <b>text</b> - the text data, <b>html</b> - HTML formatted code, <b>ole</b> - OLE object data, <b>desktop</b> - the desktop editor data, <b>destop-external</b> - the main page data of the desktop app (system messages), <b>none</b> - no data will be send to the plugin from the editor.</td>
                <td>string</td>
                <td>"ole"</td>
            </tr>
            <tr class="tablerow">
                <td id="initOnSelectionChanged" class="copy-link">variations.initOnSelectionChanged</td>
                <td>Specifies if the plugin watches the text selection events in the editor window.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isCustomWindow" class="copy-link">variations.isCustomWindow</td>
                <td>Specifies if the plugin uses a custom window, without standard borders and buttons (used for modal plugins only).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isDisplayedInViewer" class="copy-link">variations.isDisplayedInViewer</td>
                <td>Specifies if the plugin will be displayed in the viewer mode as well as in the editor mode (<em>isDisplayedInViewer == true</em>) or in the editor mode only (<em>isDisplayedInViewer == false</em>).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isInsideMode" class="copy-link">variations.isInsideMode</td>
                <td>Specifies if the plugin must be displayed inside the editor panel instead of its own window.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isModal" class="copy-link">variations.isModal</td>
                <td>Specifies if the opened plugin window is modal (used for visual plugins only, and if <em>isInsideMode</em> is not true).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isSystem" class="copy-link">variations.isSystem</td>
                <td>Specifies if the plugin is not displayed in the editor interface and is started in the background with the server (or desktop editors start) not interfering with the other plugins, so that they can work simultaneously.</td>
                <td>boolean</td>
                <td>false</td>
            </tr>
            <tr class="tablerow">
                <td id="isUpdateOleOnResize" class="copy-link">variations.isUpdateOleOnResize</td>
                <td>Specifies if an OLE object must be redrawn when resized in the editor using the vector object draw type or not (used for OLE objects only, i.e. <em>initDataType == "ole"</em>).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isViewer" class="copy-link">variations.isViewer</td>
                <td>Specifies if the plugin is working when the document is available in the viewer mode only or not. The default value is <b>false</b>.</td>
                <td>boolean</td>
                <td>false</td>
            </tr>
            <tr class="tablerow">
                <td id="isVisual" class="copy-link">variations.isVisual</td>
                <td>Specifies if the plugin is visual (will open a window for some action, or introduce some additions to the editor panel interface) or non-visual (will provide a button (or buttons) which is going to apply some transformations or manipulations to the document).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="size" class="copy-link">variations.size</td>
                <td>
                    Plugin window size.
                </td>
                <td>array of integers</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="store" class="copy-link">variations.store</td>
                <td>Plugin display options in <b>ONLYOFFICE Plugin Marketplace</b>.</td>
                <td>object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="store-background" class="copy-link">variations.store.background</td>
                <td>
                    Background colors used for plugin icons in <b>ONLYOFFICE Plugin Marketplace</b>:
                    <ul>
                        <li>
                            <b>light</b> - the background color used for the light theme plugin icon,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "#F5F5F5";
                        </li>
                        <li>
                            <b>dark</b> - the background color used for the dark theme plugin icon,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "#444444".
                        </li>
                    </ul>
                </td>
                <td>object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="store-icons" class="copy-link">variations.store.icons</td>
                <td>
                    Plugin icon image files used in <b>ONLYOFFICE Plugin Marketplace</b>:
                    <ul>
                        <li>
                            <b>light</b> - the path to the scalable plugin icons for the light theme,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "resources/store/icons";
                        </li>
                        <li>
                            <b>dark</b> - the path to the scalable plugin icons for the dark theme,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "resources/store/icons".
                        </li>
                    </ul>
                </td>
                <td>object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="store-screenshots" class="copy-link">variations.store.screenshots</td>
                <td>Images that are used for the plugin description in <b>ONLYOFFICE Plugin Marketplace</b>.</td>
                <td>array of strings</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">variations.url</td>
                <td>
                    Plugin entry point, i.e. an HTML file which connects the <em>plugin.js</em> file (the base file needed for work with plugins) and launches the plugin code.
                    See the <a href="<%= Url.Action("indexhtml") %>">index.html</a> section for the detailed information.
                </td>
                <td>string</td>
                <td>"index.html"</td>
            </tr>
            <tr class="tablerow">
                <td id="version" class="copy-link">version</td>
                <td>The plugin version.</td>
                <td>string</td>
                <td>"1.0"</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Example</div>
    <pre>{
        "baseUrl": "",
        "guid": "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
        "help": "",
        "minVersion": "6.3.0",
        "name": "plugin name",
        "nameLocale": {
            "fr": "french plugin name",
            "es": "spanish plugin name"
        },
        "variations": [
            {
                "buttons": [
                    { 
                        "text": "Cancel",
                        "primary": false,
                        "isviewer": false,
                        "textLocale": {
                            "fr": "Annuler",
                            "es": "Cancelar"
                        }
                    }
                ],
                "cryptoDisabledForExternalCloud": "true",
                "cryptoDisabledForInternalCloud": "true",
                "cryptoDisabledOnStart": "true",
                "cryptoMode": "1",
                "description": "plugin description",
                "descriptionLocale": {
                    "fr": "french plugin description",
                    "es": "spanish plugin description"
                },
                "EditorsSupport": ["word", "cell", "slide"],
                "events": ["onClick"],
                "icons": ["icon.png", "icon@2x.png"],
                "icons2": [
                    {
                        "100%": { "normal": "icon.png" },
                        "125%": { "normal": "icon@1.25.png" },
                        "150%": { "normal": "icon@1.5x.png" },
                        "175%": { "normal": "icon@1.75.png" },
                        "200%": { "normal": "icon@2x.png" }
                    },
                    {
                        "style" : "dark"
                    }
                ],
                "initData": "",
                "initDataType": "ole",
                "initOnSelectionChanged": true,
                "isCustomWindow": true,
                "isDisplayedInViewer": true,
                "isInsideMode": false,
                "isModal": true,
                "isSystem": false,
                "isUpdateOleOnResize": true,
                "isViewer": true,
                "isVisual": false,
                "size": [600, 700],
                "store": {
                    "background": {
                        "light" : "#F5F5F5",
                        "dark" : "#444444"
                    },
                    "icons"       : {
                        "light" : "resources/store/icons",
                        "dark"  : "resources/store/icons"
                    },
                    "screenshots" : ["resources/store/screenshots/screen_1.png"]
                },
                "url": "index.html"
            }
        ],
        "version": "1.0"
    };</pre>

</asp:Content>
