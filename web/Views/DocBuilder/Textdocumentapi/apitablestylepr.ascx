<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiTableStylePr</span>
</h1>

<h4 class="header-gray" id="ApiTableStylePr">new ApiTableStylePr()</h4>
<p class="dscr">Class representing a set of formatting properties which will be conditionally applied to the parts of a table matching the requirements specified with the <em>Type</em> parameter.</p>

<h2>Methods</h2>
<table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/getparapr") %>">GetParaPr</a></td>
                        <td>Get the set of the paragraph properties which will be applied to all the paragraphs within a table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettablecellpr") %>">GetTableCellPr</a></td>
                        <td>Get the set of the table cell properties which will be applied to all the cells within a table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettablepr") %>">GetTablePr</a></td>
                        <td>Get the set of the table properties which will be applied to all the regions within a table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettablerowpr") %>">GetTableRowPr</a></td>
                        <td>Get the set of the table row properties which will be applied to all the rows within a table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettextpr") %>">GetTextPr</a></td>
                        <td>Get the set of the text run properties which will be applied to all the text runs within the table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettype") %>">GetType</a></td>
                        <td>Get the type of the current table conditional style.</td>
                    </tr>
                </tbody>
            </table>

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
