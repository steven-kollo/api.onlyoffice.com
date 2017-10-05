<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableBorderInsideV</span>
</h1>
<h4 class="header-gray" id="SetTableBorderInsideV">SetTableBorderInsideV(sType, nSize, nSpace, r, g, b)</h4>
                
<p class="dscr">Specify the border which will be displayed on all vertical table cell borders which are not on an
outmost edge of the parent table (all vertical borders which are not the leftmost or rightmost border).</p>

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
                        <td><em>sType</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#BorderType">BorderType</a>
                        </td>
                        <td>The vertical table cell border style.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSize</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt_8">pt_8</a>
                        </td>
                        <td>The width of the current border measured in eighths of a point.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSpace</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt">pt</a>
                        </td>
                        <td>The spacing offset in the vertical table cells of the table measured in points used to place this border.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>r</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Red color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>g</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Green color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>b</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Blue color component value.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We add the inside vertical 4 point blue border:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTablePr.SetTableBorderInsideV("single", 32, 0, 0, 0, 255);
oTable.SetTableLook(true, true, true, true, false, false);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableBorderInsideV.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896637&doc=Q2lla1RpeE1iYTNicVZjMDRTSVk1SWYrbVNINFRidUtCeVJyM0hjMW5iaz0_IjQ4OTY2Mzci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
