<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateImage</span>
</h1>

<h4 class="header-gray" id="CreateImage">CreateImage(sImageSrc, nWidth, nHeight) &rarr; {<a href="<%= Url.Action("textdocumentapi/apiimage") %>">ApiImage</a>}</h4>
<p class="dscr">
Create an image with the parameters specified.
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
            <td><em>sImageSrc</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The image source where the image to be inserted should be taken from (currently only internet URL or Base64 encoded images are supported).</td>
        </tr>
        <tr class="tablerow">
            <td><em>nWidth</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td>The image width in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nHeight</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td>The image height in English measure units.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apiimage") %>">ApiImage</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oDrawing;
oParagraph = oDocument.GetElement(0);
oDrawing = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateImage.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882168&doc=M2grR2tVeWRKV1F5a0hnbVVBdk43UTROUzlyZEc3VkpFVE5nV3Fnc0VYOD0_IjQ4ODIxNjgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>