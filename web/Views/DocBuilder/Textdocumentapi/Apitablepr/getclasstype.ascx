<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>
<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"tablePr"}</h4>
                
<p class="dscr">Get the type of this class.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
            <dt>
            Type
            </dt>
            <dd>
            <em>"tablePr"</em>
            </dd>
            </dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTablePr;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
var oClassType = oTablePr.GetClassType();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Class Type = " + oClassType);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896603&doc=VVl0NVZNWUFxLzRLVWw0WURqcXdtVDFMT1k1RDV3a3FyOVloakV5dWVGST0_IjQ4OTY2MDMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>