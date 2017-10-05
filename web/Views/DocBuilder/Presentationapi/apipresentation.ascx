<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiPresentation</span>
</h1>
<h4 class="header-gray" id="ApiParaPr">new ApiPresentation()</h4>
<p class="dscr">Class representing a presentation.</p>
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
            <td><a href="<%= Url.Action("presentationapi/apipresentation/addslide") %>">AddSlide</a></td>
            <td>Append a new slide to the end of the presentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/getcurslideindex") %>">GetCurSlideIndex</a></td>
            <td>Get the index for the current slide.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/getcurrentslide") %>">GetCurrentSlide</a></td>
            <td>Get the current slide.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/getslidebyindex") %>">GetSlideByIndex</a></td>
            <td>Get the slide by its position in the presentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/setsizes") %>">SetSizes</a></td>
            <td>Set the size for the current presentation.</td>
        </tr>
    </tbody>
</table>
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
oPresentation.SetSizes(254 * 36000, 190 * 36000);
var oSlide = oPresentation.GetCurrentSlide();
oSlide.RemoveAllObjects();
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "ApiPresentation.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011291&doc=VE5qbGpRMjZabHlaMnZUMGdndnZDN1oxUW51TTZJelJCbU93ZTVDL1V2dz0_IjUwMTEyOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
