<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("InsertAndReplaceContentControls", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows inserting a content control containing data. The data is specified by the <em>js</em> code for <a href="<%= Url.Action("basic", "docbuilder") %>">Document Builder</a>, or by a link to the shared document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("InsertAndReplaceContentControls", [arrDocuments]);
</pre>
<div class="header-gray">Parameters</div>
<div id="mobile-content"></div>
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
            <td>arrDocuments</td>
            <td>
                A JSON array of properties and contents for content controls. Each object from this array can have the following values:
                <ul>
                    <li>
                        <b>Props</b> - the content control properties,
                        <br />
                        <b>type</b>: object;
                    </li>
                    <li>
                        <b>Script</b> - a script that will be executed to generate data within the content control (can be replaced with the <em>Url</em> parameter),
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

<p>The <em>Props</em> object can have the following values:</p>
<ul>
    <li><em>Id</em> (e.g. <em>{"Id": 2}</em> ) is a unique identifier of the content control. It can be used to search for a certain content control and make reference to it in the code.</li>
    <li><em>Tag</em> ( e.g. <em>{"Tag": "{tag}"}</em> ) is a tag assigned to the content control. The same tag can be assigned to several content controls so that it is possible to make reference to them in the code.</li>
    <li><em>InternalId</em> (e.g. <em>{"InternalId": 1_713}</em> ) is a unique internal identifier of the content control.</li>
    <li><em>Lock</em> (e.g. <em>{"Lock": 0}</em> ) is a value which defines if it is possible to delete and/or edit the content control or not. The values can be as follows:</li>
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
