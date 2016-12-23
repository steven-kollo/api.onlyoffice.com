<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBold</span>
</h1>

<h4 class="header-gray" id="SetBold">SetBold(isBold)</h4>
<p class="dscr">
    Set the bold property to the text characters in the current cell or cell range.
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
            <td><em>isBold</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of this cell/cell range are displayed bold.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("Bold text");
oWorksheet.GetRange("A2").SetBold(true);
oWorksheet.GetRange("A3").SetValue("Normal text");
builder.SaveFile("xlsx", "SetBold.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5114801&doc=LzVuN2VzN1l0c3Z3QmI5SHZ3SkljeFZSU1pRSGt3QnJBRTFCNm4rMUI0UT0_IjUxMTQ4MDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>