<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTextPr</span>
</h1>

<h4 class="header-gray" id="GetTextPr">GetTextPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>}</h4>
<p class="dscr">Get the set of the text run properties which will be applied to all the text runs within the table which match the conditional formatting type.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTableStylePr, oParaPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set the bold font weight to the text in cell #1:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableStylePr = oTableStyle.GetConditionalTableStyle("topLeftCell");
oTable.SetTableLook(true, true, true, true, true, true);
oTableStylePr.GetTextPr().SetBold(true);
oParagraph = oTable.GetRow(0).GetCell(0).GetContent().GetElement(0);
oParagraph.AddText("Bold text");
oParagraph = oTable.GetRow(0).GetCell(1).GetContent().GetElement(0);
oParagraph.AddText("Normal text");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "GetTextPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898081&doc=UUI0THdpQkFjRG8rdEdhcmFIT0VLNjhoZHVKalltYURBMVA4YU1KM0tNRT0_IjQ4OTgwODEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
