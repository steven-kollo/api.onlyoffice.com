<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStrikeout</span>
</h1>

<h4 class="header-gray" id="SetStrikeout">SetStrikeout(isStrikeout)</h4>
<p class="dscr">
    Specify that the contents of the cell/cell range are displayed with a single horizontal line through the center of the line. 
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
            <td><em>isStrikeout</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current cell/cell range are displayed struck through.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("Struckout text");
oWorksheet.GetRange("A2").SetStrikeout(true);
oWorksheet.GetRange("A3").SetValue("Normal text");
builder.SaveFile("xlsx", "SetStrikeout.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5114907&doc=a2FqQWxEZCsycTAxcjlXTnN4UW1FSlJNVUFQbHRaaVRxVjdML3pOb2pJOD0_IjUxMTQ5MDci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>