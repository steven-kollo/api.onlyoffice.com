<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("PutImageDataToSelection", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows replacing the first selected drawing with the image specified in the parameters. If there are no drawings selected, the method inserts the image at the current position.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("PutImageDataToSelection", [oImageData]);
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
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
            <td>oImageData</td>
            <td>
                The information about the base64 encoded <em>png</em> image:
                <ul>
                    <li>
                        <b>src</b> - the image source in the base64 format,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "data:image/png;base64,image-in-the-base64-format";
                        <br />
                    </li>
                    <li>
                        <b>nWidth</b> - the image width in pixels,
                        <br />
                        <b>type</b>: number,
                        <br />
                        <b>example</b>: 300;
                        <br />
                    </li>
                    <li>
                        <b>nHeight</b> - the image height in pixels,
                        <br />
                        <b>type</b>: number,
                        <br />
                        <b>example</b>: 200.
                        <br />
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.saveImage = function () {
    let sImageSrc = imageEditor.toDataURL();
    let editorDimension = imageEditor.getCanvasSize();
    let nWidth = editorDimension.width;
    let nHeight = editorDimension.height;
    let oImageData = {
        "src": sImageSrc,
        "width": nWidth,
        "height": nHeight
    };
    window.Asc.plugin.executeMethod ("PutImageDataToSelection", [oImageData]);
    window.Asc.plugin.executeCommand("close", "");
};
</pre>
