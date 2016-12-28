<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetDisplayHeadings</span>
</h1>

<h4 class="header-gray" id="SetDisplayHeadings">SetDisplayHeadings(isDisplayHeadings)</h4>
<p class="dscr">
    Specifies whether the current sheet row/column headers must be displayed or not.
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
            <td><em>isDisplayHeadings</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies whether the current sheet row/column headers must be displayed or not. The default value is <b>true</b>.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("The sheet settings make it display no row/column headers");
oWorksheet.SetDisplayHeadings(false);
builder.SaveFile("xlsx", "SetDisplayHeadings.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5115613&doc=aVowc3luQW1OUFBXTEp6b1NpZzZtOGZzU3hVaHRGeS9ORFllVjZYZzVRTT0_IjUxMTU2MTMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>