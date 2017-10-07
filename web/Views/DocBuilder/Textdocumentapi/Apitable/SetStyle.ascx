<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStyle</span>
</h1>

<h4 class="header-gray" id="SetStyle">SetStyle(oStyle)</h4>
<p class="dscr">Set the style for the current table.</p>

            <h2>Parameters:</h2>
            <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><em>oStyle</em></td>
                        <td>
                        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>
                        </td>
                        <td>The style which will be applied to the current table.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a table and apply one of the existing styles to it:");
oTableStyle = oDocument.GetStyle("Bordered - Accent 5");
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894981&doc=Umd6TFp0SVNaaXhGVWJSTXgzVDN6SnlxWDR0aERIQnZ4b3lTRVJlTHMxUT0_IjQ4OTQ5ODEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
