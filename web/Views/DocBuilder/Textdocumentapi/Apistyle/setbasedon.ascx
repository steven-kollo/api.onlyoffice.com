<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBasedOn</span>
</h1>

<h4 class="header-gray" id="SetBasedOn">SetBasedOn(oStyle)</h4>
<p class="dscr">Specify the reference to the parent style which this style inherits from in the style hierarchy.</p>

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
                        <td>The parent style which the style inherits properties from.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
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
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892958&doc=dEJyeDV2SSt2Q3IxZlViSmRYL1dITDAzNVdDQit4V1dqL0J0ZVhNbkpOND0_IjQ4OTI5NTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>