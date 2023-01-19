<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("InsertAndReplaceContentControls", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows inserting the content control containing data. The data is specified by the <em>js</em> code for <a href="<%= Url.Action("basic", "docbuilder") %>">Document Builder</a>, or by a link to the shared document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("InsertAndReplaceContentControls", [arrDocuments]);
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
            <td>arrDocuments</td>
            <td>
                An array of properties and contents of the content control. Each object from this array can have the following values:
                <ul>
                    <li>
                        <b>Props</b> - the content control properties,
                        <br />
                        <b>type</b>: object;
                    </li>
                    <li>
                        <b>Script</b> - a script that will be executed to generate the data within the content control (can be replaced with the <em>Url</em> parameter),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{script}";
                        <br />
                    </li>
                    <li>
                        <b>Url</b> - a link to the shared file (can be replaced with the <em>Script</em> parameter),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/script.docbuilder".
                        <br />
                    </li>
                </ul>
            </td>
            <td>array of objects</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>The <em>Props</em> object can have the following values:</p>
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

<div class="header-gray">Returns</div>

<p>The method returns the data which the created content control contains (in JSON format):</p>
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

<div class="header-gray">Example of changing the existed content control</div>

<pre>
var arrDocuments = [{
    "Props": {
        "InternalId": "2_803"
    },
    "Script": "var oParagraph = Api.CreateParagraph();oParagraph.AddText('New text');Api.GetDocument().InsertContent([oParagraph]);"
}]
window.Asc.plugin.executeMethod("InsertAndReplaceContentControls", [arrDocuments]);
</pre>

<div class="header-gray">Example of adding a new content control</div>

<pre>
var arrDocuments = [{
    "Props": {
        "Id": 100,
        "Tag": "CC_Tag",
        "Lock": 3
    },
    "Script": "var oParagraph = Api.CreateParagraph();oParagraph.AddText('Hello world!');Api.GetDocument().InsertContent([oParagraph]);"
}]
window.Asc.plugin.executeMethod("InsertAndReplaceContentControls", [arrDocuments]);
</pre>
