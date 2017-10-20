<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTableCellPr</span>
</h1>

<h4 class="header-gray" id="GetTableCellPr">GetTableCellPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apitablecellpr") %>">ApiTableCellPr</a>}</h4>
<p class="dscr">Get the set of the table cell properties which will be applied to all the cells within a table which match the conditional formatting type.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apitablecellpr") %>">ApiTableCellPr</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTableStylePr, oParaPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set the gray shading for cell #1:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableStylePr = oTableStyle.GetConditionalTableStyle("topLeftCell");
oTable.SetTableLook(true, true, true, true, true, true);
oTableStylePr.GetTableCellPr().SetShd("clear", 0xEE, 0xEE, 0xEE);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "GetTableCellPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898069&doc=M3h2OUJkellVbnVQRG01ZmlVTWI2aFJsUmJOQUhnRjR2TnFXK0JHNXFkMD0_IjQ4OTgwNjki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
