<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateRadialGradientFill</span>
</h1>
<h4 class="header-gray" id="CreateRadialGradientFill">CreateRadialGradientFill(aGradientStop) &rarr; {<a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>}</h4>
<p class="dscr">
Create a radial gradient fill which allows to fill the object using a selected radial gradient as the object background.
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
            <td><em>aGradientStop</em></td>
            <td>
                <em>Array</em>
            </td>
            <td>The array of gradient color stops measured in 1000th of percent.</td>
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
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateRadialGradientFill.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004788&doc=WGR4M0lYZzdTUDA5eUErTDZQY1VIdTIvRXBWLy9yRVZQcXc3TkhUaE9YYz0_IjUwMDQ3ODgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>