<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiTable</span>
</h1>

<h4 class="header-gray" id="ApiTable">new ApiTable()</h4>
<p class="dscr">Class representing a table.</p>

<h2>Extends</h2>
<table class="table table-classlist">
                    <thead>
                        <tr class="tablerow">
                            <td class="table-classlist-name">Name</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a></td>
                        <td>Class representing table properties.</td>
                    </tr>
                </tbody>
                </table>
            
<h2>Methods</h2>
<table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/addcolumn") %>">AddColumn</a></td>
            <td>Add a new column to the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/addrow") %>">AddRow</a></td>
            <td>Add a new row to the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/getrow") %>">GetRow</a></td>
            <td>Get the table row by its position in the table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/getrowscount") %>">GetRowsCount</a></td>
            <td>Get the number of rows in the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/mergecells") %>">MergeCells</a></td>
            <td>Merge an array of cells. If the merge is done successfully it will return the resulting merged cell, otherwise the result will be <em>"null"</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/removecolumn") %>">RemoveColumn</a></td>
            <td>Remove the table column with a specified cell.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/removerow") %>">RemoveRow</a></td>
            <td>Remove the table row with a specified cell.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setcellspacing") %>">SetCellSpacing</a></td>
            <td>Specify the default table cell spacing (the spacing between adjacent cells and the edges of the table).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setjc") %>">SetJc</a></td>
            <td>Specify the alignment of the current table with respect to the text margins in the current section.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setshd") %>">SetShd</a></td>
            <td>Specify the shading which is applied to the extents of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setstyle") %>">SetStyle</a></td>
            <td>Set the style for the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setstylecolbandsize") %>">SetStyleColBandSize</a></td>
            <td>Specify the number of columns which will comprise each table column band for this table style.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setstylerowbandsize") %>">SetStyleRowBandSize</a></td>
            <td>Specify the number of rows which will comprise each table row band for this table style.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderbottom") %>">SetTableBorderBottom</a></td>
            <td>Set the border which will be displayed at the bottom of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderinsideh") %>">SetTableBorderInsideH</a></td>
            <td>Specify the border which will be displayed on all horizontal table cell borders which are not on an outmost edge of the parent table (all horizontal borders which are not the topmost or bottommost border).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderinsidev") %>">SetTableBorderInsideV</a></td>
            <td>Specify the border which will be displayed on all vertical table cell borders which are not on an outmost edge of the parent table (all vertical borders which are not the leftmost or rightmost border).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderleft") %>">SetTableBorderLeft</a></td>
            <td>Set the border which will be displayed on the left of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderright") %>">SetTableBorderRight</a></td>
            <td>Set the border which will be displayed on the right of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablebordertop") %>">SetTableBorderTop</a></td>
            <td>Set the border which will be displayed at the top of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginbottom") %>">SetTableCellMarginBottom</a></td>
            <td>Specify the amount of space which will be left between the bottom extent of the cell contents and the border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginleft") %>">SetTableCellMarginLeft</a></td>
            <td>Specify the amount of space which will be present between the left extent of the cell contents and the left border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginright") %>">SetTableCellMarginRight</a></td>
            <td>Specify the amount of space which will be present between the right extent of the cell contents and the right border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablecellmargintop") %>">SetTableCellMarginTop</a></td>
            <td>Specify the amount of space which will be present between the top extent of the cell contents and the top border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableind") %>">SetTableInd</a></td>
            <td>Specify the indentation which will be added before the leading edge of the current table in the document (the left edge in a left-to-right table, and the right edge in a right-to-left table).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablelayout") %>">SetTableLayout</a></td>
            <td>Specify the algorithm which will be used to lay out the contents of this table within the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablelook") %>">SetTableLook</a></td>
            <td>Specify the components of the conditional formatting of the referenced table style (if one exists) which will be applied to the set of table rows with the current table-level property exceptions. A table style can specify up to six different optional conditional formats, for example, different formatting for first column, which then can be applied or omitted from individual table rows in the parent table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setwidth") %>">SetWidth</a></td>
            <td>Set the preferred width for this table.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable, oTableStyle, oCell;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(5, 5);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oCell = oTable.MergeCells([oTable.GetRow(1).GetCell(1), oTable.GetRow(1).GetCell(2), oTable.GetRow(2).GetCell(1), oTable.GetRow(2).GetCell(2)]);
oCell.GetContent().GetElement(0).AddText("Merged cell");
oDocument.Push(oTable);
builder.SaveFile("docx", "MergeCells.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894751&doc=YTB1V29rR1lSVDZRRTV0YTk4OVRzaG85T2ZRb2loOUsxWnp0ZjhkLzVCOD0_IjQ4OTQ3NTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>