<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetCurrentContentControlPr", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting current content control properties.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetCurrentContentControlPr");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the <em>ContentControlProperties</em> object containing the content control properties in the following form (JSON):</p>
<pre>
{
    "Id" : number,
    "Tag" : string,
    "Lock" : number,
    "Alias" : string,
    "Appearance" : string,
    "Color" : {
        "R": number,
        "G": number,
        "B": number
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
            <td>A unique content control identifier. It can be used to search for a certain content control and make reference to it in your code.</td>
            <td>number</td>
            <td>0</td>
        </tr>
        <tr class="tablerow">
            <td>Tag</td>
            <td>A tag assigned to the content control. The same tag can be assigned to several content controls so that you can make reference to them in your code.</td>
            <td>string</td>
            <td>"{tag}"</td>
        </tr>
        <tr class="tablerow">
            <td>Lock</td>
            <td>A value that defines if it is possible to delete and/or edit the content control or not.</td>
            <td>number</td>
            <td>0</td>
        </tr>
        <tr class="tablerow">
            <td>Alias</td>
            <td>The alias attribute.</td>
            <td>string</td>
            <td>"&#8470;1"</td>
        </tr>
        <tr class="tablerow">
            <td>Appearance</td>
            <td>Defines if the content control is shown as the bounding box or not.</td>
            <td>"string"</td>
            <td>"Bounding box"</td>
        </tr>
        <tr class="tablerow">
            <td>Color</td>
            <td>
                The color for the current content control in the RGB format:
                <ul>
                    <li>
                        <b>R</b> - red color component value,
                        <br />
                        <b>type</b>: number,
                        <br />
                        <b>example</b>: 0;
                        <br />
                    </li>
                    <li>
                        <b>G</b> - green color component value,
                        <br />
                        <b>type</b>: number,
                        <br />
                        <b>example</b>: 0;
                        <br />
                    </li>
                    <li>
                        <b>B</b> - blue color component value,
                        <br />
                        <b>type</b>: number,
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
