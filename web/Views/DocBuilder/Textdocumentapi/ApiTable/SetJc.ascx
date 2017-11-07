<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetJc</span>
</h1>

<h4 class="header-gray" id="SetJc">SetJc(sJcType)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablepr/setjc") %>">ApiTablePr.SetJc</a>
                </li></ul></dd>
                </dl>

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
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("The table is aligned at the center of the page horizontally.");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 50);
oTable.SetStyle(oTableStyle);
oTable.SetJc("center");
oDocument.Push(oTable);
builder.SaveFile("docx", "SetJc.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894969&doc=aXo0bkR4cGVhZk8vSTdENDRKREF4bXR4WUZ1eVhoT0FqMmZzdk1nN0duMD0_IjQ4OTQ5Njki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
