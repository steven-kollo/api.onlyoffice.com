<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Automation API
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Automation API</span>
    </h1>

    <p class="dscr"><b>Connector</b> is a class that allows editing text documents, spreadsheets, presentations, and fillable forms from an external source.
        The examples of using Automation API can be found <a href="<%= Url.Action("interactingoutside") %>">here</a>.
    </p>
    <p>To create the connector, use the <a href="<%= Url.Action("methods") %>#createConnector">createConnector</a> method of the <b>document editor</b> object:</p>
    <pre>
var connector = docEditor.createConnector()
</pre>
    <note>
        <p>Please note that the connector is available only for <b>ONLYOFFICE Developer Edition</b>.</p>
        <p>This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <a href="mailto:sales@onlyoffice.com" target="_blank">sales@onlyoffice.com</a>.</p>
    </note>
    <p>The connector has the same interface as plugins. Below you can find methods that are available for this class.</p>

    <ul>
        <li><a href="#addContextMenuItem">addContextMenuItem</a> - add an item to the context menu.</li>
        <li><a href="#addToolbarMenuItem">addToolbarMenuItem</a> - add an item to the toolbar menu.</li>
        <li><a href="#attachEvent">attachEvent</a> - add an event listener.</li>
        <li><a href="#callCommand">callCommand</a> - send the data back to the editor.</li>
        <li><a href="#connect">connect</a> - connect the connector to the editor.</li>
        <li><a href="#detachEvent">detachEvent</a> - remove an event listener.</li>
        <li><a href="#disconnect">disconnect</a> - disconnect the connector from the editor.</li>
        <li><a href="#executeMethod">executeMethod</a> - execute certain editor methods using the connector.</li>
        <li><a href="#updateContextMenuItem">updateContextMenuItem</a> - update an item in the context menu with the specified items.</li>
    </ul>

    <h2>Methods and their description:</h2>
    <ul>
        <li>
            <p><b id="addContextMenuItem" class="copy-link">addContextMenuItem</b> - the function called to add an item to the context menu.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>items</td>
                        <td>An array containing the context menu item parameters.</td>
                        <td>array of <a href="#ContextMenuItem">ContextMenuItem</a></td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div id="ContextMenuItem" class="copy-link header-gray">ContextMenuItem</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>id</td>
                        <td>The item ID.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>text</td>
                        <td>The item text.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>data</td>
                        <td>The item data (this data will be sent to the click event callback).</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>disabled</td>
                        <td>Specifies if the current item is disabled or not.</td>
                        <td>boolean</td>
                    </tr>
                    <tr class="tablerow">
                        <td>icons</td>
                        <td>The item icons (see the plugins <a href="<%= Url.Action("config", "plugin") %>#icons">config</a> documentation).</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>items</td>
                        <td>An array containing the context menu items for the current item.</td>
                        <td>array of ContextMenuItem</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div class="header-gray">Example</div>
            <pre>
var items: [
    {
        "id": "onConvert",
        "text": getMessage("Convert to Markdown or HTML")
    }
]

connector.addContextMenuItem(items);
</pre>
        </li>

        <li>
            <p><b id="addToolbarMenuItem" class="copy-link">addToolbarMenuItem</b> - the function called to add an item to the toolbar menu.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>items</td>
                        <td>The toolbar main menu item parameters.</td>
                        <td><a href="#ToolbarMenuMainItem">ToolbarMenuMainItem</a></td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div id="ToolbarMenuMainItem" class="copy-link header-gray">ToolbarMenuMainItem</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>guid</td>
                        <td>The plugin guid.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>tabs</td>
                        <td>An array containing the toolbar menu tabs for the current item.</td>
                        <td>array of <a href="#ToolbarMenuTab">ToolbarMenuTab</a></td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div id="ToolbarMenuTab" class="copy-link header-gray">ToolbarMenuTab</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>id</td>
                        <td>The tab ID.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>text</td>
                        <td>The tab text.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>items</td>
                        <td>An array containing the toolbar menu items for the current tab.</td>
                        <td>array of <a href="#ToolbarMenuItem">ToolbarMenuItem</a></td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div id="ToolbarMenuItem" class="copy-link header-gray">ToolbarMenuItem</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>id</td>
                        <td>The item ID.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>type</td>
                        <td>The possible values of the base which the relative vertical position of the toolbar menu item will be calculated from.</td>
                        <td><a href="<%= Url.Action("global", "plugin") %>#ToolbarMenuItemType">ToolbarMenuItemType</a></td>
                    </tr>
                    <tr class="tablerow">
                        <td>text</td>
                        <td>The item text.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>hint</td>
                        <td>The item hint.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>icons</td>
                        <td>The item icons (see the plugins <a href="<%= Url.Action("config", "plugin") %>#icons">config</a> documentation).</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>disabled</td>
                        <td>Specifies if the current item is disabled or not.</td>
                        <td>boolean</td>
                    </tr>
                    <tr class="tablerow">
                        <td>enableToggle</td>
                        <td>Specifies if an item toggle is enabled or not.</td>
                        <td>boolean</td>
                    </tr>
                    <tr class="tablerow">
                        <td>lockInViewMode</td>
                        <td>Specifies if the current item is locked in the view mode or not.</td>
                        <td>boolean</td>
                    </tr>
                    <tr class="tablerow">
                        <td>separator</td>
                        <td>Specifies if a separator is used between the toolbar menu items or not.</td>
                        <td>boolean</td>
                    </tr>
                    <tr class="tablerow">
                        <td>split</td>
                        <td>Specifies if the toolbar menu items are split or not.</td>
                        <td>boolean</td>
                    </tr>
                    <tr class="tablerow">
                        <td>onClick</td>
                        <td>The click event callback.</td>
                        <td>function</td>
                    </tr>
                    <tr class="tablerow">
                        <td>items</td>
                        <td>An array containing the <a href="#ContextMenuItem">context menu items</a> for the current item.</td>
                        <td>array of ContextMenuItem</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div class="header-gray">Example</div>
            <pre>
var oToolbarMenuItem = {
    "id": "MeaningItem",
    "type": "button",
    "text": "Meaning",
    "hint": "Meaning",
    "icons": "resources/light/icon.png",
    "disabled": false,
    "enableToggle": false,
    "lockInViewMode": false,
    "separator": true,
    "split": true,
    "onClick": onClick,
    "items": [
        {
            "id": "onMeaningT",
            "text": "Explain text in comment"
        },
        {
            "id": "onFixSpelling",
            "text": "Fix spelling & grammar"
        },
        {
            "id": "onMakeLonger",
            "text": "Make longer"
        },
        {
            "id": "onMakeShorter",
            "text": "Make shorter"
        }
    ]
};
var oToolbarMenuTab = {
    "id": "ChatGPT",
    "text": "AI Assistant",
    "items": [oToolbarMenuItem]
};
var oToolbarMenuMainItem = {
    "guid": "asc.{9DC93CDB-B576-4F0C-B55E-FCC9C48DD007}",
    "tabs": [oToolbarMenuTab]
};

connector.addToolbarMenuItem(oToolbarMenuMainItem);
</pre>
        </li>

        <li>
            <p><b id="attachEvent" class="copy-link">attachEvent</b> - the function called to add an event listener, a function that will be called whenever the specified event is delivered to the target.
                The list of all the available events is the same as for the plugins. It can be found <a href="<%= Url.Action("events", "plugin") %>">here</a>.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>name</td>
                        <td>The event name.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>callback</td>
                        <td>The event listener.</td>
                        <td>function</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">Example</div>
            <pre>
connector.attachEvent("onChangeContentControl", function()
{
    console.log("event: onChangeContentControl");
});
</pre>
        </li>

        <li>
            <p><b id="callCommand" class="copy-link">callCommand</b> - the function called to send the data back to the editor.
                It allows the connector to send structured data that can be inserted into the resulting document file
                (formatted paragraphs, tables, text parts, and separate words, etc.).</p>
            <note><b>ONLYOFFICE Document Builder</b> commands can be only used to create content and insert it into the document editor
                (using the <em>Api.GetDocument().InsertContent(...))</em>. This limitation exists due to the co-editing feature in the online editors.</note>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>command</td>
                        <td>Defines the command written in JavaScript which purpose is to form structured data which can be inserted into the resulting document file
                            (formatted paragraphs, tables, text parts, and separate words, etc.). Then the data is sent to the editors.
                            The command must be compatible with <a href="<%= Url.Action("basic", "docbuilder") %>">ONLYOFFICE Document Builder</a> syntax.</td>
                        <td>function</td>
                    </tr>
                    <tr class="tablerow">
                        <td>callback</td>
                        <td>The result that the method returns. It is an optional parameter.</td>
                        <td>function</td>
                    </tr>
                    <tr class="tablerow">
                        <td>isNoCalc</td>
                        <td>Defines whether the document will be recalculated or not. The <b>true</b> value is used to recalculate the document
                            after executing the function in the <em>command</em> parameter. The <b>false</b> value will not recalculate the document
                            (use it only when your edits surely will not require document recalculation). The default value is <b>false</b>.</td>
                        <td>boolean</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <p>This method is executed in its context isolated from other JavaScript data. If some parameters or other data need to be passed to this method, use <a href="<%= Url.Action("scope", "plugin") %>">Asc.scope</a> object.</p>
            <div class="header-gray">Example</div>
            <pre>
Asc.scope.text = "Hello world!"; 

connector.callCommand(function() {

    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
    oParagraph.AddText(Asc.scope.text);
    oDocument.InsertContent([oParagraph]);

}, function() { console.log("callback command"); });
</pre>
        </li>

        <li>
            <p><b id="connect" class="copy-link">connect</b> - the function called to connect the connector to the editor.</p>
            <note>Please note that this method should only be called if you have disconnected the connector with the <a href="#disconnect">disconnect</a> method
                and need to connect it to the editor again. When creating a connector, you do not need to use the <em>connect</em> method,
                as it is called automatically along with the <a href="<%= Url.Action("methods") %>#createConnector">createConnector</a> method.</note>
            <div class="header-gray">Example</div>
            <pre>
connector.connect()
</pre>
        </li>

        <li>
            <p><b id="detachEvent" class="copy-link">detachEvent</b> - the function called to remove an event listener.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>name</td>
                        <td>The event name.</td>
                        <td>string</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">Example</div>
            <pre>
connector.detachEvent("onChangeContentControl");
</pre>
        </li>

        <li>
            <p><b id="disconnect" class="copy-link">disconnect</b> - the function called to disconnect the connector from the editor.</p>
            <div class="header-gray">Example</div>
            <pre>
connector.disconnect()
</pre>
        </li>

        <li>
            <p><b id="executeMethod" class="copy-link">executeMethod</b> - the function called to execute certain editor methods using the connector.
                The full list of these methods is the same as for the plugins. It can be found <a href="<%= Url.Action("executemethod/", "plugin") %>">here</a>.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>name</td>
                        <td>The name of the specific method that must be executed.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>args</td>
                        <td>The arguments that the method in use has (if it has any).</td>
                        <td>array</td>
                    </tr>
                    <tr class="tablerow">
                        <td>callback</td>
                        <td>The result that the method returns. It is an optional parameter.</td>
                        <td>function</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">Example</div>
            <pre>
connector.executeMethod("SetFormValue",[forms[i]["InternalId"],"OnlyOffice BANK"],null);
</pre>
        </li>
        <li>
            <p><b id="updateContextMenuItem" class="copy-link">updateContextMenuItem</b> - the function called to update an item in the context menu with the specified items.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>items</td>
                        <td>An array containing the context menu item parameters.</td>
                        <td>array of <a href="#toolbar-ContextMenuItem">ContextMenuItem</a></td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div id="toolbar-ContextMenuItem" class="copy-link header-gray">ContextMenuItem</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>id</td>
                        <td>The item ID.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>text</td>
                        <td>The item text.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>data</td>
                        <td>The item data (this data will be sent to the click event callback).</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>disabled</td>
                        <td>Specifies if the current item is disabled or not.</td>
                        <td>boolean</td>
                    </tr>
                    <tr class="tablerow">
                        <td>icons</td>
                        <td>The item icons (see the plugins <a href="<%= Url.Action("config", "plugin") %>#icons">config</a> documentation).</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>items</td>
                        <td>An array containing the context menu items for the current item.</td>
                        <td>array of ContextMenuItem</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div class="header-gray">Example</div>
            <pre>
var items: [
    {
        "id": "onConvert",
        "text": getMessage("Convert to Markdown or HTML")
    }
]

connector.updateContextMenuItem(items);
</pre>
        </li>
    </ul>

</asp:Content> 