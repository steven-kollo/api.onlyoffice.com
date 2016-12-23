<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetDisplayGridlines</span>
</h1>

<h4 class="header-gray" id="SetDisplayGridlines">SetDisplayGridlines(isDisplayGridlines)</h4>
<p class="dscr">
    Specifies whether the current sheet gridlines must be displayed or not.
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
            <td><em>isDisplayGridlines</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies whether the current sheet gridlines must be displayed or not. The default value is <b>true</b>.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("The sheet settings make it display no gridlines");
oWorksheet.SetDisplayGridlines(false);
builder.SaveFile("xlsx", "SetDisplayGridlines.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5115612&doc=RCs1dmFzazNiUlJZQUFLZ3hEYzFjUEtEWVIxN2ZkbDdOOG1pQVpwU05QQT0_IjUxMTU2MTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>