<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("EditOleObject", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows editing the OLE object in the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("EditOleObject", [data]);
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
            <td>data</td>
            <td>The OLE object properties:
                <ul>
                    <li>
                        <b>data</b> - OLE object data (internal format),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{data}";
                        <br />
                    </li>
                    <li>
                        <b>imgSrc</b> - a link to the image (its visual representation) stored in the OLE object and used by the plugin,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://link-to-the-image.jpg";
                        <br />
                    </li>
                    <li>
                        <b>objectId</b> - the OLE object identifier,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "5_556";
                        <br />
                    </li>
                    <li>
                        <b>width</b> - the OLE object width measured in millimeters,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 70;
                        <br />
                    </li>
                    <li>
                        <b>height</b> - the OLE object height measured in millimeters,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 70;
                        <br />
                    </li>
                    <li>
                        <b>widthPix</b> - the OLE object image width in pixels,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 60 * 36000;
                        <br />
                    </li>
                    <li>
                        <b>heightPix</b> - the OLE object image height in pixels,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 60 * 36000.
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
window.Asc.plugin.executeMethod("EditOleObject", [{"data": "{data}", "imgSrc": "https://link-to-the-image.jpg", "objectId": "5_556", "width": 70, "height": 70, "widthPix": 60 * 36000, "heightPix": 60 * 36000}]);
</pre>
