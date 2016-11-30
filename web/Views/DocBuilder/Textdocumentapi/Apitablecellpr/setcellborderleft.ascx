<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCellBorderLeft</span>
</h1>
<h4 class="header-gray" id="SetCellBorderLeft">SetCellBorderLeft(sType, nSize, nSpace, r, g, b)</h4>

<p class="dscr">Set the border which will be displayed to the left of the current table cell.</p>

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
                        <td>The cell left border style.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSize</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt_8">pt_8</a>
                        </td>
                        <td>The width of the current cell left border measured in eighths of a point.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSpace</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt">pt</a>
                        </td>
                        <td>The spacing offset in the left part of the table cell measured in points used to place this border.</td>
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
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableCellPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and add the left 4 point blue border to all cells:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableCellPr = oTableStyle.GetTableCellPr();
oTableCellPr.SetCellBorderLeft("single", 32, 0, 0, 0, 255);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetCellBorderLeft.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896434&doc=eGVBQWpZdU00ZzZObTVYRnBIWjh4ZUd4cW45eGl2MHJ2dkkwcWZucE40az0_IjQ4OTY0MzQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>