<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiTablePr</span>
</h1>
<h4 class="header-gray" id="ApiTablePr">new ApiTablePr()</h4>
<p class="dscr">Class representing table properties.</p>
                    
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
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setcellspacing") %>">SetCellSpacing</a></td>
            <td>Specify the default table cell spacing (the spacing between adjacent cells and the edges of the table).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setjc") %>">SetJc</a></td>
            <td>Specify the alignment of the current table with respect to the text margins in the current section.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setshd") %>">SetShd</a></td>
            <td>Specify the shading which is applied to the extents of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setstylecolbandsize") %>">SetStyleColBandSize</a></td>
            <td>Specify the number of columns which will comprise each table column band for this table style.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setstylerowbandsize") %>">SetStyleRowBandSize</a></td>
            <td>Specify the number of rows which will comprise each table row band for this table style.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderbottom") %>">SetTableBorderBottom</a></td>
            <td>Set the border which will be displayed at the bottom of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderinsideh") %>">SetTableBorderInsideH</a></td>
            <td>Specify the border which will be displayed on all horizontal table cell borders which are not on an outmost edge of the parent table (all horizontal borders which are not the topmost or bottommost border).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderinsidev") %>">SetTableBorderInsideV</a></td>
            <td>Specify the border which will be displayed on all vertical table cell borders which are not on an outmost edge of the parent table (all vertical borders which are not the leftmost or rightmost border).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderleft") %>">SetTableBorderLeft</a></td>
            <td>Set the border which will be displayed on the left of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderright") %>">SetTableBorderRight</a></td>
            <td>Set the border which will be displayed on the right of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablebordertop") %>">SetTableBorderTop</a></td>
            <td>Set the border which will be displayed at the top of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmarginbottom") %>">SetTableCellMarginBottom</a></td>
            <td>Specify the amount of space which will be left between the bottom extent of the cell contents and the border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmarginleft") %>">SetTableCellMarginLeft</a></td>
            <td>Specify the amount of space which will be present between the left extent of the cell contents and the left border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmarginright") %>">SetTableCellMarginRight</a></td>
            <td>Specify the amount of space which will be present between the right extent of the cell contents and the right border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmargintop") %>">SetTableCellMarginTop</a></td>
            <td>Specify the amount of space which will be present between the top extent of the cell contents and the top border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableind") %>">SetTableInd</a></td>
            <td>Specify the indentation which will be added before the leading edge of the current table in the document (the left edge in a left-to-right table, and the right edge in a right-to-left table).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablelayout") %>">SetTableLayout</a></td>
            <td>Specify the algorithm which will be used to lay out the contents of this table within the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setwidth") %>">SetWidth</a></td>
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
var oParagraph, oTable, oTableStyle, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("The table is aligned at the center of the page horizontally:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTablePr.SetJc("center");
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 50);
oTable.SetTableLook(true, true, true, true, false, false);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetJc.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896608&doc=cGNoanArTnBEQ0tKSUZlVjQ5UlNFQWRmUzBwYzVzTnpaRUxpK285Q3ZCND0_IjQ4OTY2MDgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>