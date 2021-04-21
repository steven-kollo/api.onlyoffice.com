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
                <td>baseUrl</td>
                <td>Path to the plugin. All the other paths are calculated relative to this path. In case the plugin is installed on the server, an additional parameter (path to the plugins) is added there. If <em>baseUrl == ""</em> the path to all plugins will be used.</td>
                <td>string</td>
                <td>""</td>
            </tr>
            <tr id="guid" class="tablerow">
                <td>guid</td>
                <td>Plugin identifier. It <b>must</b> be of the <em>asc.{UUID}</em> type.</td>
                <td>string</td>
                <td>"asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}"</td>
            </tr>
            <tr id="help" class="tablerow">
                <td>help</td>
                <td>Path to the plugin description page. If the parameter is specified, the <em>help</em> button is displayed in the plugin window. When the user clicks the button, he follows the link to the plugin description page.</td>
                <td>string</td>
                <td>""</td>
            </tr>
            <tr class="tablerow">
                <td>name</td>
                <td>Plugin name which will be visible at the plugin toolbar.</td>
                <td>string</td>
                <td>"plugin name"</td>
            </tr>
            <tr class="tablerow">
                <td>nameLocale</td>
                <td>Translations for the name field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the plugin name translation for each language.</td>
                <td>object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td>variations</td>
                <td>Plugin variations or <em>subplugins</em> - see the <a href="#pluginVariations">Plugin variations</a> section below.</td>
                <td>array of object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td>variations.buttons</td>
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
                <td>array of object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td>variations.description</td>
                <td>The description, i.e. what describes your plugin the best way.</td>
                <td>string</td>
                <td>"plugin description"</td>
            </tr>
            <tr class="tablerow">
                <td>variations.descriptionLocale</td>
                <td>Translations for the description field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the plugin description translation for each language.</td>
                <td>object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td>variations.EditorsSupport</td>
                <td>The editors which the plugin is available for (<b>word</b> - text document editor, <b>cell</b> - spreadsheet editor, <b>slide</b> - presentation editor).</td>
                <td>array of string</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td>variations.icons</td>
                <td>
                    Plugin icon image files used in the editors: for common screens and with doubled resolution for retina screens.
                    Icons with the lowest ID value are placed first to specify the application icons.
                    Icons must be of the following sizes:
                    <ul>
                        <li><b>icon.png</b> - 40x40;</li>
                        <li><b>icon@2x.png</b> - 80x80;</li>
                        <li><b>icon2.png</b> - 26x26;</li>
                        <li><b>icon2@2x.png</b> - 52x52.</li>
                    </ul>
                </td>
                <td>array of string</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td>variations.initData</td>
                <td>Is always equal to <em>""</em> - this is the data which is sent from the editor to the plugin at the plugin start (e.g. if <em>initDataType == "text"</em>, the plugin will receive the selected text when run).</td>
                <td>string</td>
                <td>""</td>
            </tr>
            <tr class="tablerow">
                <td>variations.initDataType</td>
                <td>The data type selected in the editor and sent to the plugin: <b>text</b> - the text data, <b>html</b> - HTML formatted code, <b>ole</b> - OLE object data, <b>none</b> - no data will be send to the plugin from the editor.</td>
                <td>string</td>
                <td>"ole"</td>
            </tr>
            <tr class="tablerow">
                <td>variations.initOnSelectionChanged</td>
                <td>Specifies if the plugin watches the text selection events in the editor window.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td>variations.isDisplayedInViewer</td>
                <td>Specifies if the plugin will be displayed in the viewer mode as well as in the editor mode (<em>isDisplayedInViewer == true</em>) or in the editor mode only (<em>isDisplayedInViewer == false</em>).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td>variations.isInsideMode</td>
                <td>Specifies if the plugin must be displayed inside the editor panel instead of its own window (used for visual non-modal plugins only). The following rule must be observed at all times: <em>isModal != isInsideMode</em>.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td>variations.isModal</td>
                <td>Specifies if the opened plugin window is modal, i.e. a separate modal window must be opened, or not (used for visual plugins only). The following rule must be observed at all times: <em>isModal != isInsideMode</em>.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td>variations.isSystem</td>
                <td>Specifies if the plugin is not displayed in the editor interface and is started in the background with the server (or desktop editors start) not interfering with the other plugins, so that they can work simultaneously.</td>
                <td>boolean</td>
                <td>false</td>
            </tr>
            <tr class="tablerow">
                <td>variations.isUpdateOleOnResize</td>
                <td>Specifies if an OLE object must be redrawn when resized in the editor using the vector object draw type or not (used for OLE objects only, i.e. <em>initDataType == "ole"</em>).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td>variations.isViewer</td>
                <td>Specifies if the plugin is available when the document is opened in the viewer mode only or not. The default value is <b>false</b>.</td>
                <td>boolean</td>
                <td>false</td>
            </tr>
            <tr class="tablerow">
                <td>variations.isVisual</td>
                <td>Specifies if the plugin is visual (will open a window for some action, or introduce some additions to the editor panel interface) or non-visual (will provide a button (or buttons) which is going to apply some transformations or manipulations to the document).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td>variations.url</td>
                <td>
                    Plugin entry point, i.e. an HTML file which connects the <em>plugin.js</em> file (the base file needed for work with plugins) and launches the plugin code.
                    See the <a href="<%= Url.Action("indexhtml") %>">index.html</a> section for the detailed information.
                </td>
                <td>string</td>
                <td>"index.html"</td>
            </tr>
            <tr class="tablerow">
                <td>variations.size</td>
                <td>
                    Plugin window size.
                </td>
                <td>array of integer</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td>variations.events</td>
                <td>
                    Plugin events.
                </td>
                <td>array of string</td>
                <td></td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>
    <pre>{
        "baseUrl": "",
        "guid": "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
        "help": "",
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
                "description": "plugin description",
                "descriptionLocale": {
                    "fr": "french plugin description",
                    "es": "spanish plugin description"
                },
                "EditorsSupport": ["word", "cell", "slide"],
                "icons": ["icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png"],
                "initData": "",
                "initDataType": "ole",
                "initOnSelectionChanged": true,
                "isDisplayedInViewer": true,
                "isInsideMode": false,
                "isModal": true,
                "isSystem": false,
                "isUpdateOleOnResize": true,
                "isViewer": true,
                "isVisual": false,
                "url": "index.html",
                "size": [600, 700],
                "events": ["onClick"]
            }
        ]
    };</pre>

    <h2 id="pluginVariations" class="copy-link">Plugin variations</h2>

    <p>Why would one plugin might need some variations? The answer is simple enough: the plugin can not only perform some actions but also contain some settings, or an <b>About</b> window, or something like that. For example, translation plugin: the plugin itself does not need a visual window for translation as it can be done just pressing a single button, but its settings (the translation direction) and an <b>About</b> window must be visual. So we will need to have at least two plugin variations (translation itself and settings), or three, in case we want to add an <b>About</b> window with the information about the plugin and its authors or the software used for the plugin creation.</p>

    <div class="note">The <em>.html</em> files for <b>all</b> variations must be placed to the plugin root folder together with the <em>config.json</em> configuration file for the plugin to work correctly.</div>

</asp:Content>
