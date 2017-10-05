<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiTableCell</span>
</h1>

<h4 class="header-gray" id="ApiTableCell">new ApiTableCell()</h4>
<p class="dscr">Class representing a table cell.</p>
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
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr") %>">ApiTableCellPr</a></td>
                        <td>Class representing table cell properties.</td>
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
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/getcontent") %>">GetContent</a></td>
                        <td>Get the cell content.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderbottom") %>">SetCellBorderBottom</a></td>
                        <td>Set the border which will be displayed at the bottom of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderleft") %>">SetCellBorderLeft</a></td>
                        <td>Set the border which will be displayed to the left of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderright") %>">SetCellBorderRight</a></td>
                        <td>Set the border which will be displayed to the right of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellbordertop") %>">SetCellBorderTop</a></td>
                        <td>Set the border which will be displayed at the top of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmarginbottom") %>">SetCellMarginBottom</a></td>
                        <td>Specify the amount of space which will be left between the bottom extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmarginleft") %>">SetCellMarginLeft</a></td>
                        <td>Specify the amount of space which will be left between the left extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmarginright") %>">SetCellMarginRight</a></td>
                        <td>Specify the amount of space which will be left between the right extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmargintop") %>">SetCellMarginTop</a></td>
                        <td>Specify the amount of space which will be left between the upper extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setnowrap") %>">SetNoWrap</a></td>
                        <td>Specify how this table cell is laid out when the parent table is displayed in a document. This setting
only affects the behavior of the cell when the <a href="<%= Url.Action("textdocumentapi/apitablepr/settablelayout") %>">SetTableLayout</a> table layout for this table is
set to use the <em>"autofit"</em> algorithm.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setshd") %>">SetShd</a></td>
                        <td>Specify the shading applied to the contents of the table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/settextdirection") %>">SetTextDirection</a></td>
                        <td>Specify the direction of the text flow for this table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setverticalalign") %>">SetVerticalAlign</a></td>
                        <td>Specify the vertical alignment for text contents within the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setwidth") %>">SetWidth</a></td>
                        <td>Set the preferred width for the current table cell.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableRow;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
oTableRow.SetHeight("atLeast", 1440);
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetVerticalAlign("top");
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Align top");
oCell = oTable.GetRow(0).GetCell(1);
oCell.SetVerticalAlign("center");
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Align center");
oCell = oTable.GetRow(0).GetCell(2);
oCell.SetVerticalAlign("bottom");
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Align bottom");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetVerticalAlign.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896405&doc=R2dyOGVIL2xtbHVVUEsyOWFPQkJRSFJRVUFCcytrSUVwTUloZDhUZEp5dz0_IjQ4OTY0MDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
