<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetUnderline</span>
</h1>

<h4 class="header-gray" id="SetUnderline">SetUnderline(sUnderline)</h4>
<p class="dscr">
    Specify that the contents of this cell/cell range are displayed along with a line appearing directly below the character.
</p>

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
            <td><em>sUnderline</em></td>
            <td>
                <em>string</em>
            </td>
            <td>Specifies the type of the line displayed under the characters. The following values are available:
                <ul>
                    <li><b>"none"</b> - for no underlining;</li>
                    <li><b>"single"</b> - for the single line underlining the cell contents;</li>
                    <li><b>"singleAccounting"</b> - for the single line underlining the cell contents but not protruding beyond the cell borders;</li>
                    <li><b>"double"</b> - for the double line underlining the cell contents;</li>
                    <li><b>"doubleAccounting"</b> - for the double line underlining the cell contents but not protruding beyond the cell borders.</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("The text underlined with a single line");
oWorksheet.GetRange("A2").SetUnderline("single");
oWorksheet.GetRange("A4").SetValue("Normal text");
builder.SaveFile("xlsx", "SetUnderline.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5115542&doc=ZndPTGt1UkNkOVRFcHpCVGZrUUhvR0xOc2ZibE91ajBKZkZRMFg5QzRPOD0_IjUxMTU1NDIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>