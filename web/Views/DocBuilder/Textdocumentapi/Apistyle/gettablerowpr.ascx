<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTableRowPr</span>
</h1>

<h4 class="header-gray" id="GetTableRowPr">GetTableRowPr() &rarr; (nullable) {<a href="<%= Url.Action("textdocumentapi/apitablerowpr") %>">ApiTableRowPr</a>}</h4>
<p class="dscr">Get the table row properties of the current style.</p>

            <h2>Returns:</h2>
<p>
If the type of this style is not a <em>"table"</em> then it will return <em>"null"</em>.
</p>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apitablerowpr") %>">ApiTableRowPr</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable, oTableStyle;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oDocument.Push(oTable);
oTable.SetStyle(oTableStyle);
oTable.SetTableLook(true, true, true, true, false, false);
oTableStyle.GetTableRowPr().SetHeight("atLeast", 1440);
oTableStyle.GetConditionalTableStyle("topLeftCell").GetTableCellPr().SetShd("clear", 255, 0, 0);
oTableStyle.GetConditionalTableStyle("topRightCell").GetTableCellPr().SetShd("clear", 0, 255, 0);
oTableStyle.GetConditionalTableStyle("bottomLeftCell").GetTableCellPr().SetShd("clear", 0, 0, 255);
oTableStyle.GetConditionalTableStyle("bottomRightCell").GetTableCellPr().SetShd("clear", 255, 255, 0); 
builder.SaveFile("docx", "GetTableRowPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892942&doc=cHZoMERNVmFuSUFLRDBCMFRBSFR1WVEzQXNCV1NYY3JRR3lSOVNQMnlYcz0_IjQ4OTI5NDIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>