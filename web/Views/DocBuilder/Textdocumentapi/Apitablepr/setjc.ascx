<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetJc</span>
</h1>
<h4 class="header-gray" id="SetJc">SetJc(sJcType)</h4>
                
<p class="dscr">Specify the alignment of the current table with respect to the text margins in the current section.</p>

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
                        <td><em>sJcType</em></td>
                        <td>                
<em>"left"</em>
|
<em>"right"</em>
|
<em>"center"</em>
                        </td>
                        <td>The alignment type used for the current table placement.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("The table is aligned at the center of the page horizontally:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTablePr.SetJc("center");
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 50);
oTable.SetTableLook(true, true, true, true, false, false);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetJc.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896608&doc=cGNoanArTnBEQ0tKSUZlVjQ5UlNFQWRmUzBwYzVzTnpaRUxpK285Q3ZCND0_IjQ4OTY2MDgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>