<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetAlignVertical</span>
</h1>

<h4 class="header-gray" id="SetAlignVertical">SetAlignVertical(value)</h4>
<p class="dscr">Set the vertical alignment of the text in the current cell range.</p>

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
                        <td><em>value</em></td>
                        <td>
                            <em>"center"</em>
                            |
                            <em>"bottom"</em>
                            |
                            <em>"top"</em>
                        </td>
                        <td>The parameters will define the vertical alignment that will be applied to the cell contents.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var sRange = oWorksheet.GetRange("A1:D5");
oWorksheet.GetRange('A2').SetValue('2'); 
sRange.SetAlignVertical("top");
builder.SaveFile("xlsx", "SetAlignVertical.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882005&doc=TlA5VkZ1L0NsY0VHcjUza2hRN1lmdXlvaDcrUWpWdDFMWmNjUjdzUFVIdz0_IjQ4ODIwMDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>