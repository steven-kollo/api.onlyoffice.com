<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetAllOleObjects", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting all OLE object data for objects which can be opened by the specified plugin.
    If <em>sPluginId</em> is not defined, this method returns all OLE objects contained in the currrent document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetAllOleObjects", [sPluginId]);
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>sPluginId</td>
            <td>Plugin identifier. It <b>must</b> be of the <em>asc.{UUID}</em> type.</td>
            <td>string</td>
            <td>"asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns an array of the <em>OLEObjectData</em> objects containing the data about the OLE object parameters:</p>
<pre>
{
    "Data" : string,
    "ImageData" : string,
    "ApplicationId" : string,
    "InternalId" : string,
    "ParaDrawingId" : string,
    "Width" : number,
    "Height" : number,
    "WidthPix" : number,
    "HeightPix" : number
}
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>Data</td>
            <td>OLE object data (internal format).</td>
            <td>string</td>
            <td>"{data}"</td>
        </tr>
        <tr class="tablerow">
            <td>ImageData</td>
            <td>An image in the base64 format stored in the OLE object and used by the plugin.</td>
            <td>string</td>
            <td>"data:image/png;base64,image-in-the-base64-format"</td>
        </tr>
        <tr class="tablerow">
            <td>ApplicationId</td>
            <td>An identifier of the plugin which can edit the current OLE object and must be of the <em>asc.{UUID}</em> type.</td>
            <td>string</td>
            <td>"asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}"</td>
        </tr>
        <tr class="tablerow">
            <td>InternalId</td>
            <td>The OLE object identifier which is used to work with OLE object added to the document.</td>
            <td>string</td>
            <td>"5_556"</td>
        </tr>
        <tr class="tablerow">
            <td>ParaDrawingId</td>
            <td>An identifier of the drawing object containing the current OLE object.</td>
            <td>string</td>
            <td>"1_713"</td>
        </tr>
        <tr class="tablerow">
            <td>Width</td>
            <td>The OLE object width measured in millimeters.</td>
            <td>number</td>
            <td>70</td>
        </tr>
        <tr class="tablerow">
            <td>Height</td>
            <td>The OLE object height measured in millimeters.</td>
            <td>number</td>
            <td>70</td>
        </tr>
        <tr class="tablerow">
            <td>WidthPix</td>
            <td>The OLE object image width in pixels.</td>
            <td>number</td>
            <td>60 * 36000</td>
        </tr>
        <tr class="tablerow">
            <td>HeightPix</td>
            <td>The OLE object image height in pixels.</td>
            <td>number</td>
            <td>60 * 36000</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("GetAllOleObjects", ["asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}"]);
</pre>
