<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateBlipFill</span>
</h1>
<h4 class="header-gray" id="CreateBlipFill">CreateBlipFill(sImageUrl, sBlipFillType) &rarr; {<a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>}</h4>
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
oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile");
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateBlipFill.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007636&doc=cGwraURxM29qWXVXRkxMUkpmNWlITjBLbktlMjZtTkllbjlJbE43LzlObz0_IjUwMDc2MzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>