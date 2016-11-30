<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreatePatternFill</span>
</h1>
<h4 class="header-gray" id="CreatePatternFill">CreatePatternFill(sPatternType, BgColor, FgColor) &rarr; {<a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>}</h4>
    <p class="dscr">
        Create a pattern fill which allows to fill the object using a selected pattern as the object background.
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
            <td><em>sPatternType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#PatternType">PatternType</a>
            </td>
            <td>The pattern type used for the fill selected from one of the available pattern types.</td>
        </tr>
        <tr class="tablerow">
            <td><em>BgColor</em></td>
            <td>
                <a href="<%= Url.Action("presentationapi/apiunicolor") %>">ApiUniColor</a>
            </td>
            <td>The background color used for the pattern creation.</td>
        </tr>
        <tr class="tablerow">
            <td><em>FgColor</em></td>
            <td>
                <a href="<%= Url.Action("presentationapi/apiunicolor") %>">ApiUniColor</a>
            </td>
            <td>The foreground color used for the pattern creation.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oFill = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 224, 204), Api.CreateRGBColor(255, 164, 101));
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateLinearGradientFill.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004801&doc=NW5PdlJJR2hLSXdha1JaY0gvLytjVEhKMngyV2JUcktvdlpnSVdUc0Eydz0_IjUwMDQ4MDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>