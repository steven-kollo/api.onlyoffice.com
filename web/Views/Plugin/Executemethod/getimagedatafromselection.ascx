<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetImageDataFromSelection", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the image data from the first of the selected drawings. If there are no drawings selected, the method returns a white rectangle.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetImageDataFromSelection");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the <em>oImageData</em> object containig the information about the base64 encoded <em>png</em> image:</p>
<pre>
{
    "src": string,
    "nWidth": number,
    "nHeight": number
}
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>src</td>
            <td>The image source in the base64 format.</td>
            <td>string</td>
            <td>"data:image/png;base64,image-in-the-base64-format"</td>
        </tr>
        <tr class="tablerow">
            <td>nWidth</td>
            <td>The image width in pixels.</td>
            <td>number</td>
            <td>300</td>
        </tr>
        <tr class="tablerow">
            <td>nHeight</td>
            <td>The image height in pixels.</td>
            <td>number</td>
            <td>200</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("GetImageDataFromSelection", [], function(oResult) {
    oImage = document.createElement("img");
    oImage.src = oResult.src;
    oImage.width = oResult.width;
    oImage.height = oResult.height;
    CreateImageEditor();
    initializationDone = true;
    var imageHeight = null;
    oImage.height > 500 ? imageHeight = 500 : imageHeight = oImage.height;
    window.Asc.plugin.resizeWindow(undefined, undefined, 870, imageHeight + 300, 0, 0);
});
</pre>
