<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod(Name, [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the <em>window.Asc.plugin</em> object method that allows executing certain methods of the editor using the plugin. <em>Name</em> is the name of the specific method that must be executed, <em>[args]</em> are the arguments that the method in use has (if it has any), and <em>callback</em> is the result that the method returns. The latter is an optional parameter. In case it is missing, the <a href="<%= Url.Action("onmethodreturn") %>">window.Asc.plugin.onMethodReturn</a> method will be used to return the result of the method execution.</p>

<p>See the available <em>window.Asc.plugin.executeMethod</em> methods below to find more about them.</p>

<div class="header-gray">Methods and properties</div>

<p>Currently, the following six methods are available that can be executed in this way:</p>

<table class="table">
    <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/insertandreplacecontentcontrols") %>">InsertAndReplaceContentControls</a></td>
            <td>This method inserts a content control that contains data.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removecontentcontrols") %>">RemoveContentControls</a></td>
            <td>This method allows to remove several content controls.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getallcontentcontrols") %>">GetAllContentControls</a></td>
            <td>This method allows to get information about all content controls that have been added to the page.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addcontentcontrol") %>">AddContentControl</a></td>
            <td>This method allows to add an empty content control to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removecontentcontrol") %>">RemoveContentControl</a></td>
            <td>This method allows to remove a content control, but leave all its contents.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getcurrentcontentcontrol") %>">GetCurrentContentControl</a></td>
            <td>This method allows to get the identifier of the selected content control.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addoleobject") %>">AddOleObject</a></td>
            <td>This method allows to add an OLE object to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/editoleobject") %>">EditOleObject</a></td>
            <td>This method allows to edit an OLE object in the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getfontlist") %>">GetFontList</a></td>
            <td>This method allows to get the fonts list.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/inputtext") %>">InputText</a></td>
            <td>This method allows to insert text into the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/pastehtml") %>">PasteHtml</a></td>
            <td>This method allows to paste text in <em>html</em> format into the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/pastetext") %>">PasteText</a></td>
            <td>This method allows to paste text into the document.</td>
        </tr>
    </tbody>
</table>

<div class="note">NB: For the plugin to work correctly, it is necessary to wait until the current method is executed before executing the next method.</div>

<%--<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.button = function (id) {
    var _info = window.Asc.plugin.info;
    var _method = (_info.objectId === undefined) ? "asc_addOleObject" : "asc_editOleObject";
    _info.width = _info.width ? _info.width : 70;
    _info.height = _info.height ? _info.height : 70;
    _info.widthPix = (_info.mmToPx * _info.width) >> 0;
    _info.heightPix = (_info.mmToPx * _info.height) >> 0;
    _info.imgSrc = window.g_board.getResult(_info.widthPix, _info.heightPix).image;
    _info.data = window.g_board.getData();
    var _code = "Api." + _method + "(" + JSON.stringify(_info) + ");";
    this.executeCommand("close", _code);
};
</pre>--%>
