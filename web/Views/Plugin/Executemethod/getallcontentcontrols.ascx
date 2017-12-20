<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("GetAllContentControls", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">This method allows to get information about all content controls that have been added to the page.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("GetAllContentControls");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the data in the following form (JSON):</p>
<pre>
[
    {
        "Tag": "Document",
        "Id": 0,
        "Lock": 0,
        "InternalId": "1_713"
    }
]
</pre>

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
