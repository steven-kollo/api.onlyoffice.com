<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSolidFill</span>
</h1>
<h4 class="header-gray" id="CreateSolidFill">CreateSolidFill(oUniColor) &rarr; {<a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>}</h4>
    <p class="dscr">
        Create a solid fill which allows to fill the object using a selected solid color as the object background.
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
            <td><em>oUniColor</em></td>
            <td>
                <a href="<%= Url.Action("presentationapi/apiunicolor") %>">ApiUniColor</a>
            </td>
            <td>The color used for the element fill.</td>
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
oRGBColor = Api.CreateRGBColor(0, 255, 0);
oFill = Api.CreateSolidFill(oRGBColor);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateSolidFill.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004820&doc=MUJXR0xaSzh0RTNHaGxhSnppK09TT1JGSDB3UmtleS8wSnlHZ3BIaitDST0_IjUwMDQ4MjAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>