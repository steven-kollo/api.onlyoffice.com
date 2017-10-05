<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiStyle</span>
</h1>

<h4 class="header-gray" id="ApiStyle">new ApiStyle()</h4>
<p class="dscr">Class representing a style.</p>

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
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/getconditionaltablestyle") %>">GetConditionalTableStyle</a></td>
                        <td>Get a set of formatting properties which will be conditionally applied to the parts of a table that match the requirement specified in the <em>sType</em> parameter.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/getname") %>">GetName</a></td>
                        <td>Get the name of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/getparapr") %>">GetParaPr</a></td>
                        <td>Get the paragraph properties of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettablecellpr") %>">GetTableCellPr</a></td>
                        <td>Get the table cell properties for the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettablepr") %>">GetTablePr</a></td>
                        <td>Get the table properties of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettablerowpr") %>">GetTableRowPr</a></td>
                        <td>Get the table row properties of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettextpr") %>">GetTextPr</a></td>
                        <td>Get the text properties of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettype") %>">GetType</a></td>
                        <td>Get the type of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/setbasedon") %>">SetBasedOn</a></td>
                        <td>Specify the reference to the parent style which this style inherits from in the style hierarchy.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/setname") %>">SetName</a></td>
                        <td>Set the name of the current style.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable, oTableStyle;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetBasedOn.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892958&doc=Nmltek9EKzlybG9aanE1S2lKRktiQXpjWGowZHhjYlhLVFc3QXlNWnFwUT0_IjQ4OTI5NTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
