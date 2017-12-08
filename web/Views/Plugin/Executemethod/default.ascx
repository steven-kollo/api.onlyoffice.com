<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod(Name, [args])</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">The <em>window.Asc.plugin</em> object method that allows to execute certain editor methods using the plugin.</p>

<p>See the available <em>window.Asc.plugin.executeMethod</em> methods below to find more on each of them.</p>

<div class="header-gray">Methods and properties</div>

<p>Currently, the following 6 methods are available that can be executed in this way:</p>

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
    </tbody>
</table>

<div class="note">For the plugin to work correctly, it's necessary to wait until the current method is executed before executing the next method.</div>

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
