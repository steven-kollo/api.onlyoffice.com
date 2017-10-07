<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiDrawing</span>
</h1>
<h4 class="header-gray" id="ApiDrawing">new ApiDrawing()</h4>
<p class="dscr">Class representing a graphical object.</p>

<h2>Methods</h2>
<table class="table table-classlist">
    <thead>
        <tr class="tablerow">
            <td class="table-classlist-name">Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apidrawing/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of the class based on this base class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apidrawing/setposition") %>">SetPosition</a></td>
            <td>Set the position of the drawing on the slide.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apidrawing/setsize") %>">SetSize</a></td>
            <td>Set the size of the object (image, shape, chart) bounding box.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oShape.SetSize(300 * 36000, 130 * 36000);
oDocContent = oShape.GetDocContent();
oDocContent.RemoveAllElements();
oParagraph = Api.CreateParagraph();
oParagraph.SetJc("left");
oParagraph.AddText("This is an example of a paragraph inside a shape. Nothing special.");
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ApiDrawing.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007743&doc=dThKdTdnLy9nQjVxdkRLK0JLM3VDSXB2U1ZwTXZiQi9RYlhXcy9uUlBVYz0_IjUwMDc3NDMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
