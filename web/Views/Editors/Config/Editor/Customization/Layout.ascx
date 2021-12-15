<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor/customization") %>"></a>
    <span class="hdr">Layout</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Defines the parameters that the user can use to hide the interface elements but not to disable features completely
    (for example, if this functionality is available from other elements such as context menu, or via hotkeys).</p>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
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
            <td id="header" class="copy-link">header</td>
            <td>
                Defines the editor header settings:
                <ul>
                    <li>
                        <b>save</b> - defines if the <b>Save</b> button in the editor header is displayed or hidden. The default value is <b>true</b>.
                        Please note that this setting is used when the <a href="<%= Url.Action("config/editor/customization") %>#compactHeader">compactHeader</a> parameter is set to <b>false</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>users</b> - defines if the button with the editing users is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="leftMenu" class="copy-link">leftMenu</td>
            <td>
                Defines the left menu settings. If this parameter is a boolean value, then it specifies whether the left menu will be displayed or hidden.
                The default value is <b>true</b>:
                <ul>
                    <li>
                        <b>navigation</b> - defines if the <b>Navigation</b> button is displayed or hidden. The default value is <b>true</b>.
                        This parameter will only be available for the document editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>spellcheck</b> - defines if the <b>Spellcheck</b> button is displayed or hidden. The default value is <b>true</b>.
                        This parameter will only be available for the spreadsheet editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                </ul>
            </td>
            <td>object or boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="rightMenu" class="copy-link">rightMenu</td>
            <td>Defines if the right menu is displayed or hidden. The default value is <b>true</b>.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="statusBar" class="copy-link">statusBar</td>
            <td>
                Defines the status bar settings:
                <ul>
                    <li>
                        <b>actionStatus</b> - defines if an action status is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>docLang</b> - defines if a button for choosing the document language is displayed or hidden. The default value is <b>true</b>.
                        This parameter will only be available for the document editor and the presentation editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>textLang</b> - defines if a button for choosing the text language is displayed or hidden. The default value is <b>true</b>.
                        This parameter will only be available for the document editor and the presentation editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="toolbar" class="copy-link">toolbar</td>
            <td>
                Defines the toolbar settings:
                <ul>
                    <li>
                        <b>collaboration</b> - defines if the <b>Collaboration</b> tab is displayed or hidden.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>file</b> - defines the <b>File</b> tab settings. If this parameter is a boolean value, then it specifies
                        whether the <b>File</b> tab will be displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>file.close</b> - defines if the <b>Close menu</b> option is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>file.info</b> - defines if the <b>Document info</b> option is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>file.save</b> - defines if the <b>Save</b> option is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>file.settings</b> - defines if the <b>Advanced settings</b> option is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>home</b> - defines the <b>Home</b> tab settings. This tab cannot be hidden,
                        <br />
                        <b>type</b>: object;
                    </li>
                    <li>
                        <b>home.mailmerge</b> - defines if the button for choosing the mail merge base is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>layout</b> - defines if the button for choosing the mail merge base is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>plugins</b> - defines if the <b>Plugins</b> tab is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>protect</b> - defines if the <b>Protection</b> tab is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>references</b> - defines if the <b>References</b> tab is displayed or hidden. This parameter will only be available for the document editor.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>save</b> - defines if the <b>Save</b> button on the toolbar is displayed or hidden. The default value is <b>true</b>.
                        Please note that this setting is used when the <a href="<%= Url.Action("config/editor/customization") %>#compactHeader">compactHeader</a> parameter is set to <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>view</b> - defines the <b>View</b> tab settings. If this parameter is a boolean value, then it specifies
                        whether the <b>View</b> tab will be displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>view.navigation</b> - defines if the <b>Navigation</b> button is displayed or hidden. The default value is <b>true</b>.
                        This parameter will only be available for the document editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "layout": {
                "header": {
                    "save": true,
                    "users": true
                },
                "leftMenu": {
                    "navigation": true,
                    "spellcheck": true
                },
                "rightMenu": true,
                "statusBar": {
                    "actionStatus": true,
                    "docLang": true,
                    "textLang": true
                },
                "toolbar": {
                    "collaboration": true,
                    "file": {
                        "close": true,
                        "info": true,
                        "save": true,
                        "settings": true
                    },
                    "home": {
                        "mailmerge": true
                    },
                    "layout": true,
                    "plugins": true,
                    "protect": true,
                    "references": true,
                    "save": true,
                    "view": {
                        "navigation": true
                    },
                }
            },
            ...
        },
        ...
    },
    ...
});
</pre>
