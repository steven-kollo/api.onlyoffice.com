<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateShape</span>
</h1>

<h4 class="header-gray" id="CreateShape">CreateShape(sType<sub>opt</sub>, nWidth, nHeight, oFill, oStroke) &rarr; {<a href="<%= Url.Action("textdocumentapi/apishape") %>">ApiShape</a>}</h4>
<p class="dscr">
Create a shape with the parameters specified.
</p>
    
<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Default</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#ShapeType">ShapeType</a>
            </td>
            <td>&lt;optional><br>
            </td>
            <td>"rect"</td>
            <td>The shape type which specifies the preset shape geometry.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nWidth</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td></td>
            <td></td>
            <td>The shape width in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nHeight</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td></td>
            <td></td>
            <td>The shape height in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oFill</em></td>
            <td>
                <a href="<%= Url.Action("textdocumentapi/apifill") %>">ApiFill</a>
            </td>
            <td></td>
            <td></td>
            <td>The color or pattern used to fill the shape.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oStroke</em></td>
            <td>
                <a href="<%= Url.Action("textdocumentapi/apistroke") %>">ApiStroke</a>
            </td>
            <td></td>
            <td></td>
            <td>The stroke used to create the element shadow.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apishape") %>">ApiShape</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateShape.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882212&doc=MWJmK1gzdTZUbThYQUwzaUlvL2libHFIVm02OFBvTDdRb3NtOVltMTczaz0_IjQ4ODIyMTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>