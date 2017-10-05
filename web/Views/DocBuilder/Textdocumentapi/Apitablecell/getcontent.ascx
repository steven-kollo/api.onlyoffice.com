<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetContent</span>
</h1>

<h4 class="header-gray" id="GetContent">GetContent() &rarr; {<a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>}</h4>
<p class="dscr">Get the cell content.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oCell = oTable.GetRow(0).GetCell(0);
oCell.GetContent().GetElement(0).AddText("Cell #1");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "GetContent.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896289&doc=SWNDTGE2S0k5bWNPTlRnS1R1L0tJajVUQmVLYW5Ja3plUDVEeWxFVVRhRT0_IjQ4OTYyODki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
