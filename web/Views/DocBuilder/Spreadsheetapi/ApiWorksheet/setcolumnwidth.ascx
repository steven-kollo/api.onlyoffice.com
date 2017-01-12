<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetColumnWidth</span>
</h1>

<h4 class="header-gray" id="SetColumnWidth">SetColumnWidth(column, width)</h4>
<p class="dscr">Set the width to the selected column of the current active sheet. The width is equal to the set number multiplied by 7 pixels - so if you set the width to 10 it will be equal to 70 pixels.</p>

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
                        <td><em>column</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The number of the column to set the width to.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>width</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The width of the column divided by 7 pixels.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetColumnWidth(0, 10);
oWorksheet.SetColumnWidth(1, 20);
builder.SaveFile("xlsx", "SetColumnWidth.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882048&doc=NU9IbTc0SVBGTS9CTnUzdHpZRDc2aVJTUmNkUCs1UmdnL3FWdG0zMFc5ND0_IjQ4ODIwNDgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>