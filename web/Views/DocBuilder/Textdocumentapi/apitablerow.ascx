<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiTableRow</span>
</h1>

<h4 class="header-gray" id="ApiTableRow">new ApiTableRow()</h4>
<p class="dscr">Class representing a table row.</p>

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
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerowpr") %>">ApiTableRowPr</a></td>
                        <td>Class representing table row properties.</td>
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
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/getcell") %>">GetCell</a></td>
                        <td>Get the cell by its position.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/getcellscount") %>">GetCellsCount</a></td>
                        <td>Get the number of cells in the current row.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/setheight") %>">SetHeight</a></td>
                        <td>Set the height of the current table row within the current table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/settableheader") %>">SetTableHeader</a></td>
                        <td>Specify that the current table row will be repeated at the top of each new page wherever this table is displayed. This gives this table row the behavior of a 'header' row on each of these pages. This element can be applied to any number of rows at the top of the table structure in order to generate multi-row table headers.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableRow;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set the height of half an inch to row #1:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
oTableRow.SetHeight("atLeast", 720);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetHeight.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896841&doc=S3psUHQ1UUlaZGFHU3Zmcm5YTDhqK0VkdDNrdmZmdVZJcVFrTkJWWFUxWT0_IjQ4OTY4NDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>