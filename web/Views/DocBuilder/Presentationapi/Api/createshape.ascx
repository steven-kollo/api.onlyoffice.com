<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateShape</span>
</h1>
<h4 class="header-gray" id="CreateShape">CreateShape(sType<sub>opt</sub>, nWidth, nHeight, oFill, oStroke) &rarr; {<a href="<%= Url.Action("presentationapi/apishape") %>">ApiShape</a>}</h4>
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
                <a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>
            </td>
            <td></td>
            <td></td>
            <td>The color or pattern used to fill the shape.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oStroke</em></td>
            <td>
                <a href="<%= Url.Action("presentationapi/apistroke") %>">ApiStroke</a>
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
        <a href="<%= Url.Action("presentationapi/apishape") %>">ApiShape</a>
    </dd>
</dl>

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
oRun.SetFontSize(60);
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetFontSize(60);
oRun.SetFontFamily("Comic Sans MS");
oRun.AddText("This is a text run with the font family set to 'Comic Sans MS'.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "CreateShape.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007717&doc=bktubVBKT2FQOTNDWWNqOWthWk4yNVpqQmN4Qmh2V1BJV2laN0dzT2N3cz0_IjUwMDc3MTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>