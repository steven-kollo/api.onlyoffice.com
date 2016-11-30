<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetAlignHorizontal</span>
</h1>

<h4 class="header-gray" id="SetAlignHorizontal">SetAlignHorizontal(value)</h4>
<p class="dscr">Set the horizontal alignment of the text in the current cell range.</p>

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
                            <em>"left"</em>
                            |
                            <em>"right"</em>
                            |
                            <em>"center"</em>
                            |
                            <em>"justify"</em>
                        </td>
                        <td>The parameters will define the justification type that will be applied to the cell contents.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();oWorksheet.GetRange('A2').SetValue('2'); 
var sRange = oWorksheet.GetRange("A1:D5");sRange.SetAlignHorizontal("center");
builder.SaveFile("xlsx", "SetAlignHorizontal.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882017&doc=R0tSdlhPN0JhUElxcDMydnl3VHhYeTI4NXNSQjF4bUpJQUlrTTJUbkJKND0_IjQ4ODIwMTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>