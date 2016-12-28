<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetRange</span>
</h1>

<h4 class="header-gray" id="GetRange">GetRange(sRange) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a>}</h4>
<p class="dscr">Returns an object that represents the selected range of the current sheet. Can be a single cell - <b>A1</b>, or cells from a single row - <b>A1:E1</b>, or cells from a single column - <b>A1:A10</b>, or cells from several rows and columns - <b>A1:E10</b>.</p>

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
                        <td><em>sRange</em></td>
                        <td>
                            <em>string</em>
                        </td>
                        <td>The range of cells from the current sheet.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("2"); 
var sRange = oWorksheet.GetRange("A1:D5");
sRange.SetAlignHorizontal("center");
builder.SaveFile("xlsx", "SetAlignHorizontal.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882017&doc=R0tSdlhPN0JhUElxcDMydnl3VHhYeTI4NXNSQjF4bUpJQUlrTTJUbkJKND0_IjQ4ODIwMTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>