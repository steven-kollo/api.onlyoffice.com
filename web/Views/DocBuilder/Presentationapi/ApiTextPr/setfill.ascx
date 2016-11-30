<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFill</span>
</h1>
<h4 class="header-gray" id="SetFill">SetFill(oFill)</h4>
    
<p class="dscr">
Set the text color for the current text run.
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
            <td><em>oFill</em></td>
            <td>
                <a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>
            </td>
            <td>The color or pattern used to fill the text color.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(50);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 255, 0));
oTextPr.SetFill(oFill);
oRun.AddText("This is a text run with the font color set to yellow using the text properties.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetFill.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011330&doc=MU9LdWlpZFJuckdOcG1CamlwQU81amRjcGphK0ZtYTFjZ3YyblcyOC95Zz0_IjUwMTEzMzAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>