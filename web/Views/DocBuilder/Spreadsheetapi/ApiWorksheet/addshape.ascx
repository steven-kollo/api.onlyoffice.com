<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddShape</span>
</h1>

<h4 class="header-gray" id="SetName">AddShape(sType, nWidth, nHeight, oFill, oStroke, nFromCol, nColOffset, nFromRow, nRowOffset) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apishape") %>">ApiShape</a>}</h4>
<p class="dscr">Adds the shape to the current sheet with the parameters specified.</p>

            <h2>Parameters:</h2>
            <table class="table">
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Type</td>
                        <td>Attributes</td>
                        <td>Default</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><em>sType</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#ShapeType">ShapeType</a>
                        </td>
                        <td>&lt;optional></td>
                        <td>"rect"</td>
                        <td>The shape type which specifies the preset shape geometry.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nWidth</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The shape width in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nHeight</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The shape height in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>oFill</em></td>
                        <td>
                            <a href="<%= Url.Action("spreadsheetapi/apifill") %>">ApiFill</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The color or pattern used to fill the shape.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>oStroke</em></td>
                        <td>
                            <a href="<%= Url.Action("spreadsheetapi/apistroke") %>">ApiStroke</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The stroke used to create the element shadow.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nFromCol</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The number of the column where the beginning of the image will be placed.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nColOffset</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The offset from the <em>nFromCol</em> column to the left part of the shape measured in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nFromRow</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The number of the row where the beginning of the image will be placed.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nRowOffset</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The offset from the <em>nFromRow</em> row to the upper part of the shape measured in English measure units.</td>
                    </tr>
                </tbody>
            </table>
            <div class="note">Please note, that the horizontal <em>nColOffset</em> and vertical <em>nRowOffset</em> offsets are calculated within the limits of the specified <em>nFromCol</em> column and <em>nFromRow</em> row cell only. If this value exceeds the cell width or height, another vertical/horizontal position will be set.</div>
            
            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <a href="<%= Url.Action("spreadsheetapi/apishape") %>">ApiShape</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
builder.SaveFile("xlsx", "AddShape.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5003261&doc=SWpKN2RWYk93aU9lSjNNWGw4MTJsNTBvUXhyR1pSMDNDcjhHVFZwQk5OUT0_IjUwMDMyNjEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
