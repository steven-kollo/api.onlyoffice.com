<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetCellsCount</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableRow;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
var oCellsCount = oTableRow.GetCellsCount();
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Number of cells in the first row = " + oCellsCount);
builder.SaveFile("docx", "GetCellsCount.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>