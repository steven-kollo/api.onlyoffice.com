<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTablePr</span>
</h1>

<h4 class="header-gray" id="GetTablePr">GetTablePr() &rarr; (nullable) {<a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a>}</h4>
<p class="dscr">Get the table properties of the current style.</p>

            <h2>Returns:</h2>
<p>
If the type of this style is not a <em>"table"</em> then it will return <em>"null"</em>.
</p>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable, oTableStyle;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTablePr = oTableStyle.GetTablePr();
oTablePr.SetTableInd(0);
oTablePr.SetTableCellMarginTop(720);
oTablePr.SetTableCellMarginLeft(120);
oTablePr.SetTableCellMarginRight(120);
oTablePr.SetTableCellMarginBottom(0);
oDocument.Push(oTable);
oTable.SetStyle(oTableStyle);
oTable.SetTableLook(true, true, true, true, true, true);
oTableStyle.GetConditionalTableStyle("topLeftCell").GetTableCellPr().SetShd("clear", 255, 0, 0);
oTableStyle.GetConditionalTableStyle("topRightCell").GetTableCellPr().SetShd("clear", 0, 255, 0);
oTableStyle.GetConditionalTableStyle("bottomLeftCell").GetTableCellPr().SetShd("clear", 0, 0, 255);
oTableStyle.GetConditionalTableStyle("bottomRightCell").GetTableCellPr().SetShd("clear", 255, 255, 0); 
builder.SaveFile("docx", "GetTablePr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892928&doc=WGFUUTdaV0pXc3dtdWNxN1p5ajBXd2dEUEJ2VjVPZU9HRElSd3RKeGtmRT0_IjQ4OTI5Mjgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
