<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiTableRowPr</span>
</h1>

<h4 class="header-gray" id="ApiTableRowPr">new ApiTableRowPr()</h4>
<p class="dscr">Class representing table row properties.</p>

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
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerowpr/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerowpr/setheight") %>">SetHeight</a></td>
                        <td>Set the height of the current table row within the current table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerowpr/settableheader") %>">SetTableHeader</a></td>
                        <td>Specify that all the current table rows will be styled as its header row.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableRowPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set all table rows as the table headers:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetTableLook(true, true, true, true, false, false);
oTableRowPr = oTableStyle.GetTableRowPr();
oTableRowPr.SetTableHeader(true);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableHeader.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896868&doc=NlAwc0RHUDZScCt4MWd3dzMrNnhTV2FmK04wRzlxYzNjSCs0WFlYY3lVYz0_IjQ4OTY4Njgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
