<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">FormatAsTable</span>
</h1>

<h4 class="header-gray" id="FormatAsTable">FormatAsTable(sRange)</h4>
<p class="dscr">Format the selected range of cells from the current sheet as a table (with the first row formatted as a header).</p>          
<div class="note">As the first row is always formatted as a table header, you need to select at least two rows for the table to be formed correctly.</div>

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
                        <td><em>sRange</em></td>
                        <td>
                            <em>string</em>
                        </td>
                        <td>The range of cells from the current sheet which will be formatted as a table.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.FormatAsTable("A1:E10");
builder.SaveFile("xlsx", "FormatAsTable.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882045&doc=UzJWYkJUT2NvUU5lYzlNV2g3SkxCVlJCMmk1ZjMrb09ka0Y3aDhTSHZBMD0_IjQ4ODIwNDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
