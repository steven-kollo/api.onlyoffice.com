<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetRowsCount</span>
</h1>

<h4 class="header-gray" id="GetRowsCount">GetRowsCount()</h4>
<p class="dscr">Get the number of rows in the current table.</p>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 2x2 table and add a new row, so that it becomes 2x3:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
var oTableRowsNumber = oTable.GetRowsCount();
oTable.AddRow(oTable.GetRow(1).GetCell(0), true);
var oTableRowsNumber1 = oTable.GetRowsCount();
oDocument.Push(oTable);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("The table above had " + oTableRowsNumber + " rows before we added a new one. ");
oParagraph.AddText("Now this table has " + oTableRowsNumber1 + " rows.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetRowsCount.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894689&doc=Q2dHOE0rb0lacDZESGhSaUtjdTdJRXltREt6emdpMHczMDQzUFB0RGNwVT0_IjQ4OTQ2ODki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>