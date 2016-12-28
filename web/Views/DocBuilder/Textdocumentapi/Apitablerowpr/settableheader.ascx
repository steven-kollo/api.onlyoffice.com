<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableHeader</span>
</h1>
<h4 class="header-gray" id="SetTableHeader">SetTableHeader(isHeader)</h4>
                
<p class="dscr">Specify that all the current table rows will be styled as its header row.</p>

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
                        <td><em>isHeader</em></td>
                        <td>                
                        <em>boolean</em>
                        </td>
                        <td>The <em>true</em> value will enable the <em>SetTableHeader</em> method use.</td>
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
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896868&doc=b0hEMHFnWjN0VmZJbjhXRkp1Q3BlZ2JseVlmcytOaHBQc2IvWEp5bXdaND0_IjQ4OTY4Njgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>