<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("AddContentControl", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows adding an empty content control to 
the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("AddContentControl", [wrap, obj]);
</pre>
<p>Where:</p>
<ul>
    <li><em>wrap</em> is a numeric value that specifies the content control type. It can have one of the following values: <b>1</b> (block) or <b>2</b> (inline),</li>
    <li><em>obj</em> is a JSON object of the following form:</li>
</ul>
<pre>
{
    "Id" : 0,
    "Lock" : 0,
    "Tag" : "{tag}"
}
</pre>
<p>The <em>obj</em> object has the values that can be the following:</p>
<ul>
    <li>"Id" (e.g. <em>{"Id": 2}</em> ) is a unique identifier of the content control. It can be used to search for a certain content control and make reference to it in your code.</li>
    <li>"Tag" ( e.g. <em>{"Tag": "String"}</em> ) is a tag assigned to the content control. One and the same tag can be assigned to several content controls so that you can make reference to them in your code.</li>
    <li>"Lock" (e.g. <em>{"Lock": 0}</em> ) is a value that defines if it is possible to delete and/or edit the content control or not. The values can be the following:</li>
</ul>
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

<div class="header-gray">Returns</div>

<p>The method returns a JSON object containing the data about the created content control in the following form (JSON):</p>
<pre>
{
    "Tag": "{tag}",
    "Id": 0,
    "Lock": 0,
    "InternalId": "1_713"
}
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
