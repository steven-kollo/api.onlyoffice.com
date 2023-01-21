<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("ChangeOleObject", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows changing the OLE object with the <em>InternalId</em> specified in OLE object data.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("ChangeOleObject", [ObjectData]);
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
            <td>ObjectData</td>
            <td>
                The <b>OLEObjectData</b> object which contains the following parameters:
                <ul>
                    <li>
                        <b>Data</b> - OLE object data (internal format),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{data}";
                        <br />
                    </li>
                    <li>
                        <b>ImageData</b> - an image in the base64 format stored in the OLE object and used by the plugin,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "data:image/png;base64,image-in-the-base64-format";
                        <br />
                    </li>
                    <li>
                        <b>ApplicationId</b> - an identifier of the plugin which can edit the current OLE object and must be of the <em>asc.{UUID}</em> type,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}";
                        <br />
                    </li>
                    <li>
                        <b>InternalId</b> - the OLE object identifier which is used to work with OLE object added to the document,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "5_556";
                        <br />
                    </li>
                    <li>
                        <b>ParaDrawingId</b> - an identifier of the drawing object containing the current OLE object,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "1_713";
                        <br />
                    </li>
                    <li>
                        <b>Width</b> - the OLE object width measured in millimeters,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 70;
                        <br />
                    </li>
                    <li>
                        <b>Height</b> - the OLE object height measured in millimeters,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 70;
                        <br />
                    </li>
                    <li>
                        <b>WidthPix</b> - the OLE object image width in pixels,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 60 * 36000;
                        <br />
                    </li>
                    <li>
                        <b>HeightPix</b> - the OLE object image height in pixels,
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
window.Asc.plugin.executeMethod("ChangeOleObject", [{"Data": "{data}", "ImageData": "data:image/png;base64,image-in-the-base64-format", "ApplicationId": "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}", "InternalId": "5_556", "ParaDrawingId": "1_713", "Width": 70, "Height": 70, "WidthPix": 60 * 36000, "HeightPix": 60 * 36000}]);
</pre>
