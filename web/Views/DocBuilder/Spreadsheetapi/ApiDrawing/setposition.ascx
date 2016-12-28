<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetPosition</span>
</h1>

<h4 class="header-gray" id="SetName">SetPosition(nFromCol, nColOffset, nFromRow, nRowOffset)</h4>
<p class="dscr">Change the position for the drawing object.</p>
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
                        <td><em>nFromCol</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The number of the column where the beginning of the drawing object will be placed.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nColOffset</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The offset from the <em>nFromCol</em> column to the left part of the drawing object measured in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nFromRow</em></td>
                        <td>
                            <span class="param-type">number</span>
                        </td>
                        <td>The number of the row where the beginning of the drawing object will be placed.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nRowOffset</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The offset from the <em>nFromRow</em> row to the upper part of the drawing object measured in English measure units.</td>
                    </tr>
                </tbody>
            </table>
            <div class="note">Please note, that the horizontal <em>nColOffset</em> and vertical <em>nRowOffset</em> offsets are calculated within the limits of the specified <em>nFromCol</em> column and <em>nFromRow</em> row cell only. If this value exceeds the cell width or height, another vertical/horizontal position will be set.</div>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oDrawing = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDrawing.SetSize(120 * 36000, 70 * 36000);
oDrawing.SetPosition(4, 2 * 36000, 2, 3 * 36000);
builder.SaveFile("xlsx", "SetPosition.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004855&doc=SzFxTDYveVpMRUlPR2ZZREh1UXBpYjFwZFovOTByR3hHS1BaM2NlN1FxVT0_IjUwMDQ4NTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>