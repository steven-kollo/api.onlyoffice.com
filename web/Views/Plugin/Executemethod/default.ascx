<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod (name, [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method used to execute certain editor methods using the plugin.</p>

<p>The <em>callback</em> is the result that the method returns. It is an optional parameter. In case it is missing, the 
    <a href="<%= Url.Action("events") %>#onMethodReturn">window.Asc.plugin.onMethodReturn</a> function will be used to return the result of the method execution.</p>

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
                <td>The name of the specific method that must be executed</td>
                <td>string</td>
            </tr>
            <tr class="tablerow">
                <td>args</td>
                <td>The arguments that the method in use has (if it has any).</td>
                <td>array</td>
            </tr>
            <tr class="tablerow">
                <td>callback</td>
                <td>The result that the method returns.</td>
                <td>function</td>
            </tr>
        </tbody>
    </table>
<div class="mobile-content"></div>


<p>See the available <em>window.Asc.plugin.executeMethod</em> methods below to find more about them.</p>

<div class="header-gray">Methods and properties</div>

<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/acceptreviewchanges") %>">AcceptReviewChanges</a></td>
            <td>This method allows to accept review changes.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addcomment") %>">AddComment</a></td>
            <td>This method allows to add a comment to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addcontentcontrol") %>">AddContentControl</a></td>
            <td>This method allows to add an empty content control to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addcontentcontrolcheckbox") %>">AddContentControlCheckBox</a></td>
            <td>This method allows to add an empty content control checkbox to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addcontentcontroldatepicker") %>">AddContentControlDatePicker</a></td>
            <td>This method allows to add an empty content control datepicker to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addcontentcontrollist") %>">AddContentControlList</a></td>
            <td>This method allows to add an empty content control list to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addcontentcontrolpicture") %>">AddContentControlPicture</a></td>
            <td>This method allows to add an empty content control picture to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addoleobject") %>">AddOleObject</a></td>
            <td>This method allows to add the OLE object to the current document position.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/changecomment") %>">ChangeComment</a></td>
            <td>This method allows to change the specified comment.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/changeoleobject") %>">ChangeOleObject</a></td>
            <td>This method allows to change the OLE object with the <em>InternalId</em> specified in OLE object data.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/changeoleobjects") %>">ChangeOleObjects</a></td>
            <td>This method allows to change multiple OLE objects with the <em>InternalIds</em> specified in OLE object data.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/coauthoringchatsendmessage") %>">CoAuthoringChatSendMessage</a></td>
            <td>This method allows to send a message to the co-authoring chat.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/convertdocument") %>">ConvertDocument</a></td>
            <td>This method allows to convert a document to Markdown or HTML text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/editoleobject") %>">EditOleObject</a></td>
            <td>This method allows to change the OLE object with the <em>InternalId</em> specified in OLE object data.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/endaction") %>">EndAction</a></td>
            <td>This method allows to specify the end action for long operations.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getallcomments") %>">GetAllComments</a></td>
            <td>This method allows to get all the comments from the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getallcontentcontrols") %>">GetAllContentControls</a></td>
            <td>This method allows to get information about all the content controls that have been added to the page.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getallforms") %>">GetAllForms</a></td>
            <td>This method allows to get information about all the forms that have been added to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getalloleobjects") %>">GetAllOleObjects</a></td>
            <td>This method allows to get all OLE object data for objects which can be opened by the specified plugin.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getcurrentcontentcontrol") %>">GetCurrentContentControl</a></td>
            <td>This method allows to get the identifier of the selected content control.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getcurrentcontentcontrolpr") %>">GetCurrentContentControlPr</a></td>
            <td>This method allows to get current content control properties.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getfields") %>">GetFields</a></td>
            <td>This method allows to get all fields as a text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getfilehtml") %>">GetFileHTML</a></td>
            <td>This method allows to get file content in the HTML format.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getfiletodownload") %>">GetFileToDownload</a></td>
            <td>This method allows to get the current file to download it in the specified format.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getfontlist") %>">GetFontList</a></td>
            <td>This method allows to get the fonts list.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getformsbytag") %>">GetFormsByTag</a></td>
            <td>This method allows to get information about all the forms that have been added to the document with the specified tag.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getformvalue") %>">GetFormValue</a></td>
            <td>This method allows to get a value of the specified form.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getimagedatafromselection") %>">GetImageDataFromSelection</a></td>
            <td>This method allows to get the image data from the first of the selected drawings.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getinstalledplugins") %>">GetInstalledPlugins</a></td>
            <td>This method allows to get all the installed plugins.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getmacros") %>">GetMacros</a></td>
            <td>This method allows to get the document macros.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getselectedtext") %>">GetSelectedText</a></td>
            <td>This method allows to get the selected text from the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getselectiontype") %>">GetSelectionType</a></td>
            <td>This method allows to get the type of the current selection.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getversion") %>">GetVersion</a></td>
            <td>This method allows to get the editor version.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/inputtext") %>">InputText</a></td>
            <td>This method allows to insert text into the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/insertandreplacecontentcontrols") %>">InsertAndReplaceContentControls</a></td>
            <td>This method allows to insert the content control that contains data.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/insertoleobject") %>">InsertOleObject</a></td>
            <td>This method allows to insert the OLE object at the current document position.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/installplugin") %>">InstallPlugin</a></td>
            <td>This method allows to install a plugin by the URL to the plugin config.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/movecursortocontentcontrol") %>">MoveCursorToContentControl</a></td>
            <td>This method allows to move a cursor to the specified content control.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/movecursortoend") %>">MoveCursorToEnd</a></td>
            <td>This method allows to move a cursor to the end of the current editing area (document body, footer/header, footnote, or autoshape).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/movecursortostart") %>">MoveCursorToStart</a></td>
            <td>This method allows to move a cursor to the beginning of the current editing area (document body, footer/header, footnote, or autoshape).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/movetocomment") %>">MoveToComment</a></td>
            <td>This method allows to move a cursor to the specified comment.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/movetonextreviewchange") %>">MoveToNextReviewChange</a></td>
            <td>This method allows to navigate through the review changes.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/onencryption") %>">OnEncryption</a></td>
            <td>This method allows to encrypt the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/openfile") %>">OpenFile</a></td>
            <td>This method allows to open a file with fields.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/pastehtml") %>">PasteHtml</a></td>
            <td>This method allows to paste text in the <em>html</em> format into the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/pastetext") %>">PasteText</a></td>
            <td>This method allows to paste text into the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/putimagedatatoselection") %>">PutImageDataToSelection</a></td>
            <td>This method allows to replace the first selected drawing with the image specified in the parameters.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/rejectreviewchanges") %>">RejectReviewChanges</a></td>
            <td>This method allows to reject review changes.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removecomments") %>">RemoveComments</a></td>
            <td>This method allows to remove the specified comments.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removecontentcontrol") %>">RemoveContentControl</a></td>
            <td>This method allows to remove the currently selected content control retaining all its contents.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removecontentcontrols") %>">RemoveContentControls</a></td>
            <td>This method allows to remove several content controls.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removeoleobject") %>">RemoveOleObject</a></td>
            <td>This method allows to remove OLE object from the document by its internal ID.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removeoleobjects") %>">RemoveOleObjects</a></td>
            <td>This method allows to remove several OLE objects from the document by their internal IDs.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removeplugin") %>">RemovePlugin</a></td>
            <td>This method allows to remove a plugin with the specified GUID.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removeselectedcontent") %>">RemoveSelectedContent</a></td>
            <td>This method allows to remove the selected content from the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/replacetextsmart") %>">ReplaceTextSmart</a></td>
            <td>This method allows to replace each paragraph (or text in cell) in the select with the corresponding text from an array of strings.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/searchandreplace") %>">SearchAndReplace</a></td>
            <td>This method allows to find and replace the text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/selectcontentcontrol") %>">SelectContentControl</a></td>
            <td>This method allows to select the specified content control.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/selectoleobject") %>">SelectOleObject</a></td>
            <td>This method allows to select the specified OLE object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/setdisplaymodeinreview") %>">SetDisplayModeInReview</a></td>
            <td>This method allows to set the display mode for track changes.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/setformvalue") %>">SetFormValue</a></td>
            <td>This method allows to set a value to the specified form.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/setmacros") %>">SetMacros</a></td>
            <td>This method allows to set macros to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/setproperties") %>">SetProperties</a></td>
            <td>This method allows to set the properties to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/showbutton") %>">ShowButton</a></td>
            <td>This method allows to show or hide buttons in the header.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/showinputhelper") %>">ShowInputHelper</a></td>
            <td>This method allows to show the input helper.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/startaction") %>">StartAction</a></td>
            <td>This method allows to specify the start action for long operations.</td>
        </tr>       
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/unshowinputhelper") %>">UnShowInputHelper</a></td>
            <td>This method allows to unshow the input helper.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/updateplugin") %>">UpdatePlugin</a></td>
            <td>This method allows to update a plugin by the URL to the plugin config.</td>
        </tr>
    </tbody>
</table>