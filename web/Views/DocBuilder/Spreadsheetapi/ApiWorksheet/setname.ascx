<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetName</span>
</h1>

<h4 class="header-gray" id="SetName">SetName(name)</h4>
<p class="dscr">Set a name to the current active sheet.</p>

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
                        <td><em>name</em></td>
                        <td>
                            <em>string</em>
                        </td>
                        <td>The name which will be displayed for the current sheet at the sheet tab.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetName("sheet 1");
builder.SaveFile("xlsx", "SetName.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882061&doc=MHJYZTUycjZranRPTUpBdFBRc1R0U1cwdTBGVHlUeG5JUStlbW4wamRScz0_IjQ4ODIwNjEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>