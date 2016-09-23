<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <%= Html.ActionLink(" ", "info/", null, new {@class = "up"}) %>
    <span class="hdr">window.Asc.plugin.info.mmToPx</span>
    <span class="comment">read-only</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Millimeter to pixel conversion ratio for the OLE object vector draw.</p>

<p>The OLE object <a class="underline" href="<%= Url.Action("info/height") %>">height</a> and <a class="underline" href="<%= Url.Action("info/width") %>">width</a> values are returned in millimeters, so you will need to convert them to pixels for raster representation. </p>

<div class="header-gray">Returns</div>

<p>Type number</p>

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
