<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <%= Html.ActionLink(" ", "plugin", null, new {@class = "up"}) %>
    <span class="hdr">window.Asc.plugin.info</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">During all the plugin work the auxiliary <em>window.Asc.plugin.info</em> object is available. It stores all the information about the editor where the plugin is used (the <a class="underline" href="<%= Url.Action("info/editortype") %>">editorType</a> used - text documents, spreadsheets, presentations) and additional settings for OLE objects (their width, height, millimeter to pixel ratio for OLE objects vector draw, some other OLE object parameters).</p>

<p>This object is used change the object data and to send additional parameters when executing the <a class="underline" href="<%= Url.Action("executecommand") %>">window.Asc.plugin.executeCommand</a>. For example, if the document content is changed and recalculation is needed, the parameter <a class="underline" href="<%= Url.Action("info/recalculate") %>">window.Asc.plugin.info.recalculate</a> must be set to <em>true</em>. It is necessary because the recalculation process is asynchronous. Moreover, some other data might need to be uploaded (e.g. a font or something else).</p>

<p>See the available <em>window.Asc.plugin.info</em> object methods and properties below to find more on each of them.</p>

<div class="header-gray">Methods and properties</div>

<table class="table">
    <colgroup>
        <col style="width: 150px;" />
        <col />
        <col style="width: 150px;" />
        <col style="width: 100px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Access</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/data") %>">data</a></td>
            <td>The OLE object data which need to be sent to the window.Asc.plugin.info object and used by the plugin.</td>
            <td>OLE object data</td>
            <td>write</td>
        </tr>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/editortype") %>">editorType</a></td>
            <td>Returns the type of the editor where the plugin is currently running.</td>
            <td>string</td>
            <td>read-only</td>
        </tr>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/guid") %>">guid</a></td>
            <td>The OLE object GUID in the current document.</td>
            <td>string</td>
            <td>read-only</td>
        </tr>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/height") %>">height</a></td>
            <td>The OLE object height measured in millimeters.</td>
            <td>number</td>
            <td>read-only</td>
        </tr>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/imgsrc") %>">imgSrc</a></td>
            <td>The link to the image (its visual representation) stored in the OLE object and used by the plugin.</td>
            <td>string</td>
            <td>write</td>
        </tr>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/mmtopx") %>">mmToPx</a></td>
            <td>Millimeter to pixel conversion ratio for the OLE object vector draw.</td>
            <td>number</td>
            <td>read-only</td>
        </tr>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/objectid") %>">objectId</a></td>
            <td>The OLE object identifier in the current document.</td>
            <td>string</td>
            <td>read-only</td>
        </tr>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/recalculate") %>">recalculate</a></td>
            <td>Force the document to recalculate its content data.</td>
            <td>boolean</td>
            <td>write</td>
        </tr>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/resize") %>">resize</a></td>
            <td>Checks if the OLE object size has been changed.</td>
            <td>boolean</td>
            <td>read-only</td>
        </tr>
        <tr class="tablerow">
            <td><a class="underline" href="<%= Url.Action("info/width") %>">width</a></td>
            <td>The OLE object width measured in millimeters.</td>
            <td>number</td>
            <td>read-only</td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Example</div>

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
</pre>
