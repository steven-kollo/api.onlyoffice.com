<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableLayout</span>
</h1>
<h4 class="header-gray" id="SetTableLayout">SetTableLayout(sType)</h4>
                
<p class="dscr">Specify the algorithm which will be used to lay out the contents of this table within the document.</p>

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
<em>"autofit"</em>
|
<em>"fixed"</em>
                        </td>
                        <td>The type of the table layout in the document.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the table cells to preserve their size:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTable = Api.CreateTable(3, 3);
oTablePr.SetTableLayout("fixed");
oTable.SetTableLook(true, true, true, true, false, false);
oTable.SetStyle(oTableStyle);
var oCell = oTable.GetRow(0).GetCell(0);
oCell.GetContent().GetElement(0).AddText("Fixed layout");
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableLayout.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<p>The resulting sample document will be available here with the nearest ONLYOFFICE Document Builder API documentation website update.</p>