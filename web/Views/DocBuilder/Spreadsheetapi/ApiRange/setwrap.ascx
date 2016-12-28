<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetWrap</span>
</h1>

<h4 class="header-gray" id="SetWrap">SetWrap(isWrap)</h4>
<p class="dscr">
    Specifies whether the words in the cell must be wrapped to fit the cell size or not.
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
            <td><em>isWrap</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>When set to <b>true</b> the words in the cell will be wrapped to fit the cell size.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("This is the text to show SetWrap");
oWorksheet.GetRange("A2").SetWrap(true);
oWorksheet.GetRange("C2").SetValue("This is the text to show no wrap");
oWorksheet.GetRange("C2").SetWrap(false);
builder.SaveFile("xlsx", "SetWrap.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5115557&doc=M2V2dHh4ZWh2dnRoODlINi9udDNvcU16ZXlJTDQ5Wjh0Vys3eE1MSnJ0MD0_IjUxMTU1NTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>