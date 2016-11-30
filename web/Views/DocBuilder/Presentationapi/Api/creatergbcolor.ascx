<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateRGBColor</span>
</h1>
<h4 class="header-gray" id="CreateRGBColor">CreateRGBColor(r, g, b) &rarr; {<a href="<%= Url.Action("presentationapi/apirgbcolor") %>">ApiRGBColor</a>}</h4>
    <p class="dscr">
        Create an RGB color setting the appropriate values for the red, green and blue color components.
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
            <td><em>r</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Red color component value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>g</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Green color component value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>b</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Blue color component value.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("presentationapi/apirgbcolor") %>">ApiRGBColor</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
var oRGBColor = Api.CreateRGBColor(255, 164, 101);
oGs1 = Api.CreateGradientStop(Api.CreatePresetColor("lightYellow"), 0);
oGs2 = Api.CreateGradientStop(oRGBColor, 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateRGBColor.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004805&doc=ZHI3VFNzYTF1dkxWYjVjZW4xc2N6TXl1eXhUVVV3USsrQm9pOWI3Q0d5ST0_IjUwMDQ4MDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>