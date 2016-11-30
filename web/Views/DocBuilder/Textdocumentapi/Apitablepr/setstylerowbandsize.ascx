<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStyleRowBandSize</span>
</h1>
<h4 class="header-gray" id="SetStyleRowBandSize">SetStyleRowBandSize(nCount)</h4>
                
<p class="dscr">Specify the number of rows which will comprise each table row band for this table style.</p>

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
                        <td><em>nCount</em></td>
                        <td>
                        <em>number</em>
                        </td>
                        <td>The number of rows measured in positive integers.</td>
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
oDocument.RemoveAllElements();
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTable = Api.CreateTable(2, 4);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oTablePr = oTableStyle.GetTablePr();
oTable.SetTableLook(true, true, true, true, true, true);
oTablePr.SetStyleRowBandSize(2);
oTableStyle.GetConditionalTableStyle("bandedRow").GetTextPr().SetBold(true);
oTable.GetRow(0).GetCell(0).GetContent().GetElement(0).AddText("Bold");
oTable.GetRow(0).GetCell(1).GetContent().GetElement(0).AddText("Bold");
oTable.GetRow(1).GetCell(0).GetContent().GetElement(0).AddText("Bold");
oTable.GetRow(1).GetCell(1).GetContent().GetElement(0).AddText("Bold");
oTable.GetRow(2).GetCell(0).GetContent().GetElement(0).AddText("Normal");
oTable.GetRow(2).GetCell(1).GetContent().GetElement(0).AddText("Normal");
oTable.GetRow(3).GetCell(0).GetContent().GetElement(0).AddText("Normal");
oTable.GetRow(3).GetCell(1).GetContent().GetElement(0).AddText("Normal");
oDocument.Push(oTable);
builder.SaveFile("docx", "SetStyleRowBandSize.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4912885&doc=WlZRWlhvN2l6NmQ4aEF1dlJiYzZuZTZSdkUxQzhzV3hrUTZMQ0VWbmdXTT0_IjQ5MTI4ODUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>