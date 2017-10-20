<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetCellsCount</span>
</h1>

<h4 class="header-gray" id="GetCellsCount">GetCellsCount() &rarr; {number}</h4>
<p class="dscr">Get the number of cells in the current row.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <em>number</em>
                </dd>
            </dl>

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
var oCellsCount = oTableRow.GetCellsCount();
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Number of cells in the first row = " + oCellsCount);
builder.SaveFile("docx", "GetCellsCount.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896831&doc=aG5rMnh0d2wrSDRTVUZCZkgyVC9BSkZmQVloWkJwQ2drL2lEbkZCTk1ORT0_IjQ4OTY4MzEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
