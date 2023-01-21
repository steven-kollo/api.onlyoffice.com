<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Events
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Events</span>
    </h1>

<p class="dscr">The events section allows to change all the functions pertaining to the events.</p>

<ul class="columns-4" style="list-style: none;">
    <li><a href="#button">button</a></li>
    <li><a href="#init">init</a></li>
    <li><a href="#inputHelper_onSelectItem">inputHelper_onSelectItem</a></li>
    <li><a href="#onAddComment">onAddComment</a></li>
    <li><a href="#onBlurContentControl">onBlurContentControl</a></li>
    <li><a href="#onChangeCommentData">onChangeCommentData</a></li>
    <li><a href="#onChangeContentControl">onChangeContentControl</a></li>
    <li><a href="#onClick">onClick</a></li>
    <li><a href="#onCommandCallback">onCommandCallback</a></li>
    <li><a href="#onDocumentContentReady">onDocumentContentReady</a></li>
    <li><a href="#onEnableMouseEvent">onEnableMouseEvent</a></li>
    <li><a href="#onExternalMouseUp">onExternalMouseUp</a></li>
    <li><a href="#onExternalPluginMessage">onExternalPluginMessage</a></li>
    <li><a href="#onFocusContentControl">onFocusContentControl</a></li>
    <li><a href="#onInputHelperClear">onInputHelperClear</a></li>
    <li><a href="#onInputHelperInput">onInputHelperInput</a></li>
    <li><a href="#onMethodReturn">onMethodReturn</a></li>
    <li><a href="#onRemoveComment">onRemoveComment</a></li>
    <li><a href="#onTargetPositionChanged">onTargetPositionChanged</a></li>
    <li><a href="#onTranslate">onTranslate</a></li>
</ul>

<h2>Events and their description:</h2>
<ul>
    <li>
        <p><b id="button" class="copy-link">button</b> - the function called when any of the plugin buttons is clicked. 
            It defines the buttons used with the plugin and the plugin behavior when they are clicked.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>id</td>
                    <td>
                        Defines the button index in the <a href="<%= Url.Action("config") %>#buttons">buttons</a> array of the <em>config.json</em> file. 
                        If <em>id == -1</em>, then the plugin considers that the <b>Close window</b> cross button has been clicked or its operation has been somehow interrupted.
                    </td>
                    <td>number</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.button = function (id) {
    this.executeCommand("close", '');
};
</pre>
    </li>

    <li>
        <p><b id="init" class="copy-link">init</b> - the function called when the plugin is launched. 
            It defines the data sent to the plugin describing what actions are to be performed and how they must be performed.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>data</td>
                    <td>
                        Defines the data parameter that depends on the <a href="<%= Url.Action("config") %>#initDataType">initDataType</a> setting specified in the <em>config.json</em> file.
                    </td>
                    <td>string</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.init = function () {
    this.callCommand(function() {
        var oDocument = Api.GetDocument();
        var oParagraph = Api.CreateParagraph();
        oParagraph.AddText("Hello world!");
        oDocument.InsertContent([oParagraph]);
    }, true);
};
</pre>
    </li>

    <li>
        <p><b id="inputHelper_onSelectItem" class="copy-link">inputHelper_onSelectItem</b> - the function called when the user is trying to select an item from the input helper.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>item</td>
                    <td>
                        Defines the selected item:
                        <ul>
                            <li>
                                <b>text</b> - the item text,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "name";
                                <br />
                            </li>
                            <li>
                                <b>id</b> - the item index,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "1".
                                <br />
                            </li>
                        </ul>
                    </td>
                    <td>object</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.inputHelper_onSelectItem = function(item) {
    if (!item)
        return;

    window.Asc.plugin.executeMethod("InputText", [item.text, window.Asc.plugin.currentText]);
    window.Asc.plugin.getInputHelper().unShow();
};
</pre>
    </li>

    <li>
        <p><b id="onAddComment" class="copy-link">onAddComment</b> - the function called when a comment is added to the document with the <a href="<%= Url.Action("executemethod/addcomment") %>">AddComment</a> method.</p>
        <p>The method takes the <em>comment</em> object containing the comment data in the following form:</p>
        <pre>
{
    "Id": "1_631",
    "Data": {
        "UserName": "John Smith",
        "Text": "comment",
        "Time": "1662737941471",
        "Solved": true,
        "Replies": [{"UserName": "Mark Potato", "Text": "reply 1", "Time": "1662740895892", "Solved": false}]
    }
}
</pre>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>Id</td>
                    <td>The comment ID.</td>
                    <td>string</td>
                    <td>"1_631"</td>
                </tr>
                <tr class="tablerow">
                    <td>Data</td>
                    <td>
                        An object which contains the comment data:
                        <ul>
                            <li>
                                <b>UserName</b> - the comment author,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "John Smith";
                                <br />
                            </li>
                            <li>
                                <b>Text</b> - the comment text,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "comment";
                                <br />
                            </li>
                            <li>
                                <b>Time</b> - the time when the comment was posted (in milliseconds),
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "1662737941471";
                                <br />
                            </li>
                            <li>
                                <b>Solved</b> - specifies if the comment is resolved (<b>true</b>) or not (<b>false</b>),
                                <br />
                                <b>type</b>: boolean,
                                <br />
                                <b>example</b>: true;
                                <br />
                            </li>
                            <li>
                                <b>Replies</b> - an array containing the comment replies represented as the <em>oCommentData</em> objects,
                                <br />
                                <b>type</b>: array of objects.
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
window.Asc.plugin.event_onAddComment = function(comment)
{
    Comments.push(comment);
    $('#scrollable-container-id').append(makeComment(comment.Id, comment));
};
</pre>
    </li>

    <li>
        <p><b id="onBlurContentControl" class="copy-link">onBlurContentControl</b> - the function called to show which content control has been blurred.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>control</td>
                    <td>
                        Defines the content control that has been blurred:
                        <ul>
                            <li>
                                <b>Tag</b> - a tag assigned to the content control. The same tag can be assigned to several content controls so that you can make reference to them in your code,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "{tag}";
                                <br />
                            </li>
                            <li>
                                <b>Id</b> - a unique content control identifier. It can be used to search for a certain content control and make reference to it in your code,
                                <br />
                                <b>type</b>: number,
                                <br />
                                <b>example</b>: 0;
                                <br />
                            </li>
                            <li>
                                <b>Lock</b> - a value that defines if it is possible to delete and/or edit the content control or not,
                                <br />
                                <b>type</b>: number,
                                <br />
                                <b>example</b>: 0;
                                <br />
                            </li>
                            <li>
                                <b>InternalId</b> -  a unique internal identifier of the content control,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "5_665".
                                <br />
                            </li>
                        </ul>
                    </td>
                    <td>object</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <p>The <em>Lock</em> parameter can have the following values:</p>
        <table class="table">
            <thead>
                <tr class="tablerow">
                    <td>Numeric value</td>
                    <td>Edit</td>
                    <td>Delete</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td><b>0</b></td>
                    <td>No</td>
                    <td>Yes</td>
                </tr>
                <tr class="tablerow">
                    <td><b>1</b></td>
                    <td>No</td>
                    <td>No</td>
                </tr>
                <tr class="tablerow">
                    <td><b>2</b></td>
                    <td>Yes</td>
                    <td>No</td>
                </tr>
                <tr class="tablerow">
                    <td><b>3</b></td>
                    <td>Yes</td>
                    <td>Yes</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>

        <div class="header-gray">Example</div>
        <pre>
connector.attachEvent("onBlurContentControl", function(oPr)
{
    if (oPr && "BankBIC" === oPr["Tag"])
    {
        connector.executeMethod("GetFormValue", [oPr["InternalId"]], function(value)
        {
            if ("12345678" !== value)
                return;

            connector.executeMethod("GetFormsByTag", ["BankAccount"], function(forms)
            {
                for (let i = 0; i < forms.length; ++i)
                {
                    connector.executeMethod("SetFormValue", [forms[i]["InternalId"], "10101110100000000123"], null);
                }
            });

            connector.executeMethod("GetFormsByTag", ["BankName"], function(forms)
            {
                for (let i = 0; i < forms.length; ++i)
                {
                    connector.executeMethod("SetFormValue", [forms[i]["InternalId"], "OnlyOffice BANK"], null);
                }
            });

            connector.executeMethod("GetFormsByTag", ["BankPlace"], function(forms)
            {
                for (let i = 0; i < forms.length; ++i)
                {
                    connector.executeMethod("SetFormValue", [forms[i]["InternalId"], "Himalayas"], null);
                }
            });
        });
    }
    console.log("event: onBlurContentControl");
});
</pre>
    </li>

    <li>
        <p><b id="onChangeCommentData" class="copy-link">onChangeCommentData</b> - the function called when the specified comment is changed with the <a href="<%= Url.Action("executemethod/changecomment") %>">ChangeComment</a> method.</p>
        <p>The method takes the <em>comment</em> object containing the comment data in the following form:</p>
        <pre>
{
    "Id": "1_631",
    "Data": {
        "UserName": "John Smith",
        "Text": "comment",
        "Time": "1662737941471",
        "Solved": true,
        "Replies": [{"UserName": "Mark Potato", "Text": "reply 1", "Time": "1662740895892", "Solved": false}]
    }
}
</pre>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>Id</td>
                    <td>The comment ID.</td>
                    <td>string</td>
                    <td>"1_631"</td>
                </tr>
                <tr class="tablerow">
                    <td>Data</td>
                    <td>
                        An object which contains the updated comment data:
                        <ul>
                            <li>
                                <b>UserName</b> - the comment author,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "John Smith";
                                <br />
                            </li>
                            <li>
                                <b>Text</b> - the comment text,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "comment";
                                <br />
                            </li>
                            <li>
                                <b>Time</b> - the time when the comment was posted (in milliseconds),
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "1662737941471";
                                <br />
                            </li>
                            <li>
                                <b>Solved</b> - specifies if the comment is resolved (<b>true</b>) or not (<b>false</b>),
                                <br />
                                <b>type</b>: boolean,
                                <br />
                                <b>example</b>: true;
                                <br />
                            </li>
                            <li>
                                <b>Replies</b> - an array containing the comment replies represented as the <em>oCommentData</em> objects,
                                <br />
                                <b>type</b>: array of objects.
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
window.Asc.plugin.event_onChangeCommentData = function(comment)
{
    changeComment(comment);
};
</pre>
    </li>

    <li>
        <p><b id="onChangeContentControl" class="copy-link">onChangeContentControl</b> - the function called to show which content control has been changed.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>control</td>
                    <td>
                        Defines the content control that has been changed:
                        <ul>
                            <li>
                                <b>Tag</b> - a tag assigned to the content control. The same tag can be assigned to several content controls so that you can make reference to them in your code,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "{tag}";
                                <br />
                            </li>
                            <li>
                                <b>Id</b> - a unique content control identifier. It can be used to search for a certain content control and make reference to it in your code,
                                <br />
                                <b>type</b>: number,
                                <br />
                                <b>example</b>: 0;
                                <br />
                            </li>
                            <li>
                                <b>Lock</b> - a value that defines if it is possible to delete and/or edit the content control or not,
                                <br />
                                <b>type</b>: number,
                                <br />
                                <b>example</b>: 0;
                                <br />
                            </li>
                            <li>
                                <b>InternalId</b> -  a unique internal identifier of the content control,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "5_665".
                                <br />
                            </li>
                        </ul>
                    </td>
                    <td>object</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <p>The <em>Lock</em> parameter can have the following values:</p>
        <table class="table">
            <thead>
                <tr class="tablerow">
                    <td>Numeric value</td>
                    <td>Edit</td>
                    <td>Delete</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td><b>0</b></td>
                    <td>No</td>
                    <td>Yes</td>
                </tr>
                <tr class="tablerow">
                    <td><b>1</b></td>
                    <td>No</td>
                    <td>No</td>
                </tr>
                <tr class="tablerow">
                    <td><b>2</b></td>
                    <td>Yes</td>
                    <td>No</td>
                </tr>
                <tr class="tablerow">
                    <td><b>3</b></td>
                    <td>Yes</td>
                    <td>Yes</td>
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
        <p><b id="onClick" class="copy-link">onClick</b> - the function called when the user clicks on the element.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>isSelectionUse</td>
                    <td>
                        Defines if the selection is used or not.
                    </td>
                    <td>boolean</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.event_onClick = function(isSelectionUse) {
    window.Asc.plugin.executeMethod("GetCurrentContentControlPr", [], function(obj) {
        window.Asc.plugin.currentContentControl = obj;
        var controlTag = obj ? obj.Tag : "";
        if (isSelectionUse)
            controlTag = "";
        ... 
    }); 
};
</pre>
    </li>

    <li>
        <p><b id="onCommandCallback" class="copy-link">onCommandCallback</b> - the function called to return the result of the previously executed command. 
            It can be used to return data after executing the <a href="<%= Url.Action("executecommand") %>">executeCommand</a> method.</p>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.onCommandCallback = function() {
    var plugin = window.Asc.plugin;
    plugin.executeCommand("close", "");
};
</pre>
    </li>

    <li>
        <p><b id="onDocumentContentReady" class="copy-link">onDocumentContentReady</b> - the function called when the document is completely loaded.</p>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.event_onDocumentContentReady = function() {
    var oProperties = {
        "searchString"  : "ONLYOFFICE",
        "replaceString" : "ONLYOFFICE is cool",
        "matchCase"     : false
    };

    window.Asc.plugin.executeMethod("SearchAndReplace", [oProperties], function() {
            window.Asc.plugin.executeCommand("close", "");
    });
};
</pre>
    </li>

    <li>
        <p><b id="onEnableMouseEvent" class="copy-link">onEnableMouseEvent</b> - the function called to turn the mouse or touchpad events on/off.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>isEnabled</td>
                    <td>
                        Defines if the mouse or touchpad is enabled or not.
                    </td>
                    <td>boolean</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.onEnableMouseEvent = function(isEnabled) {
    var _frames = document.getElementsByTagName("iframe");
    if (_frames && _frames[0]) {
        _frames[0].style.pointerEvents = isEnabled ? "none" : "";
    }
};
</pre>
    </li>

    <li>
        <p><b id="onExternalMouseUp" class="copy-link">onExternalMouseUp</b> - the function called when the mouse button is released outside the plugin iframe.</p>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.onExternalMouseUp = function () {
    var evt = document.createEvent("MouseEvents");
    evt.initMouseEvent("mouseup", true, true, window, 1, 0, 0, 0, 0, false, false, false, false, 0, null);
    document.dispatchEvent(evt);
};
</pre>
    </li>

    <li>
        <p><b id="onExternalPluginMessage" class="copy-link">onExternalPluginMessage</b> - the function called to show the editor integrator message.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>data</td>
                    <td>
                        Defines the editor integrator message:
                        <ul>
                            <li>
                                <b>type</b> - the message type,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "close";
                                <br />
                            </li>
                            <li>
                                <b>text</b> - the message text,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "text".
                                <br />
                            </li>
                        </ul>
                    </td>
                    <td>object</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.onExternalPluginMessage = function(data) {
    switch (data.type) {
        case "close": {
            this.executeCommand("close", "");
            break;
        }
        case "insertText": {
            Asc.scope.text = data.text;
            this.callCommand(function() {
                var oDocument = Api.GetDocument();
                var oParagraph = Api.CreateParagraph();
                oParagraph.AddText(Asc.scope.text);
                oDocument.InsertContent([oParagraph]);
            }, false);
            break;
        }
    }
};
</pre>
    </li>

    <li>
        <p><b id="onFocusContentControl" class="copy-link">onFocusContentControl</b> - the function called to show which content control has been focused.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>control</td>
                    <td>
                        Defines the content control that has been focused:
                        <ul>
                            <li>
                                <b>Tag</b> - a tag assigned to the content control. The same tag can be assigned to several content controls so that you can make reference to them in your code,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "{tag}";
                                <br />
                            </li>
                            <li>
                                <b>Id</b> - a unique content control identifier. It can be used to search for a certain content control and make reference to it in your code,
                                <br />
                                <b>type</b>: number,
                                <br />
                                <b>example</b>: 0;
                                <br />
                            </li>
                            <li>
                                <b>Lock</b> - a value that defines if it is possible to delete and/or edit the content control or not,
                                <br />
                                <b>type</b>: number,
                                <br />
                                <b>example</b>: 0;
                                <br />
                            </li>
                            <li>
                                <b>InternalId</b> -  a unique internal identifier of the content control,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "5_665".
                                <br />
                            </li>
                        </ul>
                    </td>
                    <td>object</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <p>The <em>Lock</em> parameter can have the following values:</p>
        <table class="table">
            <thead>
                <tr class="tablerow">
                    <td>Numeric value</td>
                    <td>Edit</td>
                    <td>Delete</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td><b>0</b></td>
                    <td>No</td>
                    <td>Yes</td>
                </tr>
                <tr class="tablerow">
                    <td><b>1</b></td>
                    <td>No</td>
                    <td>No</td>
                </tr>
                <tr class="tablerow">
                    <td><b>2</b></td>
                    <td>Yes</td>
                    <td>No</td>
                </tr>
                <tr class="tablerow">
                    <td><b>3</b></td>
                    <td>Yes</td>
                    <td>Yes</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>

        <div class="header-gray">Example</div>
        <pre>
connector.attachEvent("onFocusContentControl", function()
{
    console.log("event: onFocusContentControl");
});
</pre>
    </li>

    <li>
        <p><b id="onInputHelperClear" class="copy-link">onInputHelperClear</b> - the function called when the user is trying to clear the text and the input helper disappears.</p>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.event_onInputHelperClear = function() {
    window.Asc.plugin.currentText = "";
    window.Asc.plugin.getInputHelper().unShow();
};           
</pre>
    </li>

    <li>
        <p><b id="onInputHelperInput" class="copy-link">onInputHelperInput</b> - the function called when the user is trying to input the text and the input helper appears.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>data</td>
                    <td>
                        Defines the text which the user inputs:
                        <ul>
                            <li>
                                <b>add</b> - defines if the text is added to the current text or this is the beginning of the text,
                                <br />
                                <b>type</b>: boolean,
                                <br />
                                <b>example</b>: true;
                                <br />
                            </li>
                            <li>
                                <b>text</b> - the text which the user inputs,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "text".
                                <br />
                            </li>
                        </ul>
                    </td>
                    <td>object</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.event_onInputHelperInput = function(data) {
    if (data.add)
        window.Asc.plugin.currentText += data.text;
    else
        window.Asc.plugin.currentText = data.text;
        ...
}
</pre>
    </li>

    <li>
        <p><b id="onMethodReturn" class="copy-link">onMethodReturn</b> - the function called to return the result of the previously executed method. 
            It can be used to return data after executing the <a href="<%= Url.Action("executemethod/") %>">executeMethod</a> method.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>returnValue</td>
                        <td>
                            Defines the value that will be returned.
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.executeMethod("InsertAndReplaceContentControls", [_obj]);
window.Asc.plugin.onMethodReturn = function(returnValue) {
    if (window.Asc.plugin.info.methodName == "InsertAndReplaceContentControls") {
        window.Asc.plugin.executeMethod("GetAllContentControls");
    } else if ("GetAllContentControls") {
        window.Asc.plugin.executeCommand("close", console.log(JSON.stringify(returnValue)));
    } 
};
</pre>
    </li>

    <li>
        <p><b id="onRemoveComment" class="copy-link">onRemoveComment</b> - the function called when the specified comment is removed with the <a href="<%= Url.Action("executemethod/removecomments") %>">RemoveComments</a> method.</p>
        <p>The method takes the <em>comment</em> object containing the comment data in the following form:</p>
        <pre>
{
    "Id": "1_631",
    "Data": {
        "UserName": "John Smith",
        "Text": "comment",
        "Time": "1662737941471",
        "Solved": true,
        "Replies": [{"UserName": "Mark Potato", "Text": "reply 1", "Time": "1662740895892", "Solved": false}]
    }
}
</pre>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>Id</td>
                    <td>The comment ID.</td>
                    <td>string</td>
                    <td>"1_631"</td>
                </tr>
                <tr class="tablerow">
                    <td>Data</td>
                    <td>
                        An object which contains the comment data:
                        <ul>
                            <li>
                                <b>UserName</b> - the comment author,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "John Smith";
                                <br />
                            </li>
                            <li>
                                <b>Text</b> - the comment text,
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "comment";
                                <br />
                            </li>
                            <li>
                                <b>Time</b> - the time when the comment was posted (in milliseconds),
                                <br />
                                <b>type</b>: string,
                                <br />
                                <b>example</b>: "1662737941471";
                                <br />
                            </li>
                            <li>
                                <b>Solved</b> - specifies if the comment is resolved (<b>true</b>) or not (<b>false</b>),
                                <br />
                                <b>type</b>: boolean,
                                <br />
                                <b>example</b>: true;
                                <br />
                            </li>
                            <li>
                                <b>Replies</b> - an array containing the comment replies represented as the <em>oCommentData</em> objects,
                                <br />
                                <b>type</b>: array of objects.
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
window.Asc.plugin.event_onRemoveComment = function(comment)
{
    removeComments([comment.Id]);
};
</pre>
    </li>

    <li>
        <p><b id="onTargetPositionChanged" class="copy-link">onTargetPositionChanged</b> - the function called when the target position in the editor is changed.</p>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.event_onTargetPositionChanged = function() {
    if (!fClickLabel) {
        window.Asc.plugin.executeMethod("GetCurrentContentControl");
    }
    fClickLabel = false;
};
</pre>
    </li>

    <li>
        <p><b id="onTranslate" class="copy-link">onTranslate</b> - the function called right after the plugin startup or later in case the plugin language is changed.</p>
        <div class="header-gray">Example</div>
        <pre>
window.Asc.plugin.onTranslate = function() {
    var label = document.getElementById("button_new");
    if (label)
        label.innerHTML = window.Asc.plugin.tr("New");
}
</pre>
    </li>

</ul>

</asp:Content>
