<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("AddOleObject", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows adding the OLE object to the current document position.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("AddOleObject", [data]);
</pre>
<div class="header-gray">Parameters</div>
<div id="mobile-content"></div>
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
                        <b>guid</b> - an identifier of the plugin which can edit the current OLE object and must be of the <em>asc.{UUID}</em> type,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}";
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
window.Asc.plugin.executeMethod("AddOleObject", [{"data": "{data}", "imgSrc": "https://link-to-the-image.jpg", "guid": "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}", "width": 70, "height": 70, "widthPix": 60 * 36000, "heightPix": 60 * 36000}]);
</pre>
