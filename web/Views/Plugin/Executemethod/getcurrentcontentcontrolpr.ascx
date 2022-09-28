<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetCurrentContentControlPr", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting current content control properties.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetCurrentContentControlPr", [contentFormat]);
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
            <td>contentFormat</td>
            <td>The content format (<em>"none"</em>, <em>"text"</em>, <em>"html"</b>, <em>"ole"</em> or <em>"desktop"</em>).</td>
            <td>string</td>
            <td>"text"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>ContentControlProperties</em> object containing the content control properties in the following form (JSON):</p>
<pre>
{
    "Id" : integer,
    "Tag" : string,
    "Lock" : integer,
    "InternalId" : string,
    "Alias" : string,
    "PlaceHolderText" : string,
    "Appearance" : integer,
    "Color" : {
        "R": integer,
        "G": integer,
        "B": integer
    }
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
            <td>Id</td>
            <td>A unique identifier of the content control. It can be used to search for a certain content control and make reference to it in the code.</td>
            <td>integer</td>
            <td>2</td>
        </tr>
        <tr class="tablerow">
            <td>Tag</td>
            <td>A tag assigned to the content control. The same tag can be assigned to several content controls so that it is possible to make reference to them in the code.</td>
            <td>string</td>
            <td>"{tag}"</td>
        </tr>
        <tr class="tablerow">
            <td>Lock</td>
            <td>A value which defines if it is possible to delete and/or edit the content control or not.</td>
            <td>integer</td>
            <td>0</td>
        </tr>
        <tr class="tablerow">
            <td>InternalId</td>
            <td>A unique internal identifier of the content control.</td>
            <td>string</td>
            <td>"1_713"</td>
        </tr>
        <tr class="tablerow">
            <td>Alias</td>
            <td>The alias attribute.</td>
            <td>string</td>
            <td>"&#8470;1"</td>
        </tr>
        <tr class="tablerow">
            <td>PlaceHolderText</td>
            <td>The content control placeholder text.</td>
            <td>string</td>
            <td>"placeholder text"</td>
        </tr>
        <tr class="tablerow">
            <td>Appearance</td>
            <td>Defines if the content control is shown as the bounding box (<b>1</b>) or not (<b>2</b>).</td>
            <td>integer</td>
            <td>1</td>
        </tr>
        <tr class="tablerow">
            <td>Color</td>
            <td>
                The color for the current content control in the RGB format:
                <ul>
                    <li>
                        <b>R</b> - red color component value,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 0;
                        <br />
                    </li>
                    <li>
                        <b>G</b> - green color component value,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 0;
                        <br />
                    </li>
                    <li>
                        <b>B</b> - blue color component value,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 255;
                        <br />
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
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
