<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableHeader</span>
</h1>

<h4 class="header-gray" id="SetTableHeader">SetTableHeader(isHeader)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablerowpr/settableheader") %>">ApiTableRowPr.SetTableHeader</a>
                </li></ul></dd>
                </dl>

<p class="dscr">Specify that the current table row will be repeated at the top of each new page wherever this tableis displayed. This gives this table row the behavior of a 'header' row on each of these pages. This element canbe applied to any number of rows at the top of the table structure in order to generate multi-row table headers.</p>

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
                        <td><em>isHeader</em></td>
                        <td>                
                        <em>boolean</em>
                        </td>
                        <td>The <em>true</em> value will enable the <em>SetTableHeader</em> method use.</td>
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
oParagraph.AddText("We create a 3x90 table and set row #1 as the table header:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 90);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
oTableRow.SetTableHeader(true);
oCell = oTableRow.GetCell(0);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Header cell #1");
oCell = oTableRow.GetCell(1);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Header cell #2");
oCell = oTableRow.GetCell(2);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Header cell #3");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableHeader.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896846&doc=RjZvMTJwTGhWbVVIQmJsUmUwK3VpblFnZkV0YXlPaDJ3RitEaSs3WEJCOD0_IjQ4OTY4NDYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>