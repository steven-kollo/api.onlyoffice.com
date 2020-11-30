<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("AddOleObject", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows adding an OLE object to 
the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("AddOleObject", [data]);
</pre>
<p>Where <em>data</em> is a JSON object of the following form:</p>
<pre>
{
    "width" : number,
    "height" : number,
    "data" : "string",
    "guid" : "string",
    "imgSrc" : "string",
    "widthPix" : number,
    "heightPix" : number
}
</pre>
<p>The <em>data</em> object can have the following values:</p>
<ul>
    <li>"width" (e.g. <em>{"width": 70}</em> ) is an object width measured in millimeters.</li>
    <li>"height" ( e.g. <em>{"height": 70}</em> ) is an object height measured in millimeters.</li>
    <li>"data" (e.g. <em>{"data": ""}</em> ) is OLE object data (internal format). It is always equal to <em>""</em>.</li>
    <li>"guid" (e.g. <em>{"guid": "string"}</em> ) is an OLE object program identifier. It must be of the <em>asc.{UUID}</em> type.</li>
    <li>"imgSrc" (e.g. <em>{"imgSrc": "string"}</em> ) is a link to the image (its visual representation) stored in the OLE object and used by the plugin.</li>
    <li>"widthPix" (e.g. <em>{"widthPix": 60 * 36000}</em> ) is an image width in pixels.</li>
    <li>"heightPix" (e.g. <em>{"heightPix": 60 * 36000}</em> ) is an image height in pixels.</li>
</ul>

<div class="header-gray">Returns</div>

<p>The method returns a JSON object containing the data about the created OLE object in the following form (JSON):</p>
<pre>
{
    "width" : number,
    "height" : number,
    "data" : "string",
    "guid" : "string",
    "imgSrc" : "string",
    "widthPix" : number,
    "heightPix" : number,
    "objectId": "1_001"
}
</pre>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("AddOleObject", [{"width": 70, "height": 70, "data": "", "guid": "asc.{TE2BB87B-9F03-5060-8411-3AB4A5C71C39}", "imgSrc": "http://api.teamlab.info/content/img/plugins/plugin-manager.png", "widthPix": 60 * 36000, "heightPix": 60 * 36000}]);
</pre>
