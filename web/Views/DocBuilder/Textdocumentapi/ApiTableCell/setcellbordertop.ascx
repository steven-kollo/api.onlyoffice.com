<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCellBorderTop</span>
</h1>

<h4 class="header-gray" id="SetCellBorderTop">SetCellBorderTop(sType, nSize, nSpace, r, g, b)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellbordertop") %>">ApiTableCellPr.SetCellBorderTop</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Set the border which will be displayed at the top of the current table cell.</p>

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
                        <td><code>sType</code></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#BorderType">BorderType</a>
                        </td>
                        <td>The cell top border style.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSize</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt_8">pt_8</a>
                        </td>
                        <td>The width of the current cell top border measured in eighths of a point.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSpace</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt">pt</a>
                        </td>
                        <td>The spacing offset in the top part of the table cell measured in points used to place this border.</td>
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
var oParagraph, oTable, oTableStyle, oCell;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and add the top 4 point blue border to cell #1:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetCellBorderTop("single", 32, 0, 0, 0, 255);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetCellBorderTop.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896339&doc=cHREejhyZlBCSWtiUmRxdFRSTDdhKzZldXpGR2w4M3JHL2FnNEgyWElMbz0_IjQ4OTYzMzki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
