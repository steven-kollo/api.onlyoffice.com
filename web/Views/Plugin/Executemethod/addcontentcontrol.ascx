<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("AddContentControl", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows adding an empty content control to the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("AddContentControl", [type, commonPr]);
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
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
            <td>type</td>
            <td>A numeric value that specifies the content control type. It can have one of the following values: <b>1</b> (block), <b>2</b> (inline), <b>3</b> (row) or <b>4</b> (cell).</td>
            <td>integer</td>
            <td>2</td>
        </tr>
        <tr class="tablerow">
            <td>commonPr</td>
            <td>
                Defines the common content control properties:
                <ul>
                    <li>
                        <b>Id</b> - a unique identifier of the content control. It can be used to search for a certain content control and make reference to it in the code,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 2;
                        <br />
                    </li>
                    <li>
                        <b>Tag</b> - a tag assigned to the content control. The same tag can be assigned to several content controls so that it is possible to make reference to them in your code,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{tag}";
                        <br />
                    </li>
                    <li>
                        <b>Lock</b> - a value which defines if it is possible to delete and/or edit the content control or not,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 0;
                        <br />
                    </li>
                    <li>
                        <b>InternalId</b> - a unique internal identifier of the content control,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "1_713";
                        <br />
                    </li>
                    <li>
                        <b>Alias</b> - the alias attribute,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "&#8470;1";
                        <br />
                    </li>
                    <li>
                        <b>PlaceHolderText</b> - the content control placeholder text,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "placeholder text";
                        <br />
                    </li>
                    <li>
                        <b>Appearance</b> - defines if the content control is shown as the bounding box (<b>1</b>) or not (<b>2</b>),
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 1;
                        <br />
                    </li>
                    <li>
                        <b>Color</b> - the color for the current content control in the RGB format (<b>R</b> - red color component value, <b>G</b> - green color component value,
                        <b>B</b> - blue color component value). For example: {"R": 0, "G": 0, "B": 255},
                        <br />
                        <b>type</b>: object.
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

<div class="header-gray">Returns</div>

<p>The method returns a JSON object containing the data about the created content control in the following form:</p>
<pre>
{
    "Tag": "{tag}",
    "Id": 0,
    "Lock": 0,
    "InternalId": "1_713"
}
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
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
            <td>Tag</td>
            <td>A tag assigned to the content control. The same tag can be assigned to several content controls so that it is possible to make reference to them in the code.</td>
            <td>string</td>
            <td>"{tag}"</td>
        </tr>
        <tr class="tablerow">
            <td>Id</td>
            <td>A unique identifier of the content control. It can be used to search for a certain content control and make reference to it in the code.</td>
            <td>integer</td>
            <td>2</td>
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
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("AddContentControl", [1, {"Id" : 7, "Tag" : "{tag}", "Lock" : 0}]);
</pre>
