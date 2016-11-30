<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateBlipFill</span>
</h1>


<h4 class="header-gray" id="CreateBlipFill">CreateBlipFill(sImageUrl, sBlipFillType) &rarr; {<a href="<%= Url.Action("textdocumentapi/apifill") %>">ApiFill</a>}</h4>
<p class="dscr">
Create a blip fill which allows to fill the object using a selected image as the object background.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sImageUrl</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The path to the image used for the blip fill (currently only internet URL or Base64 encoded images are supported).</td>
        </tr>
        <tr class="tablerow">
            <td><em>sBlipFillType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#BlipFillType">BlipFillType</a>
            </td>
            <td>The type of the fill used for the blip fill (<em>tile</em> or <em>stretch</em>).</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apifill") %>">ApiFill</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile");
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("star10", 5930900, 595605, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateBlipFill.docx");
builder.CloseFile();
</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887196&doc=SFhPYnI0VmxZajAyUFZrS2I3YzJXeG5JdzNNc0ZOaGZzYnpOQW1sVitPUT0_IjQ4ODcxOTYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>