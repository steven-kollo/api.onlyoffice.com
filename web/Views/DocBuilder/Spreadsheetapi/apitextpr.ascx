<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiTextPr</span>
</h1>
<h4 class="header-gray" id="ApiTextPr">new ApiTextPr()</h4>
<p class="dscr">Class representing text properties.</p>                    

<h2>Methods</h2>
<table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setbold") %>">SetBold</a></td>
            <td>Set the bold property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setcaps") %>">SetCaps</a></td>
            <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
            <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setfill") %>">SetFill</a></td>
            <td>Set the text color for the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setfontfamily") %>">SetFontFamily</a></td>
            <td>Set all 4 font slots with the specified font family.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setfontsize") %>">SetFontSize</a></td>
            <td>Set the font size for the characters of the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setitalic") %>">SetItalic</a></td>
            <td>Set the italic property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setsmallcaps") %>">SetSmallCaps</a></td>
            <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setspacing") %>">SetSpacing</a></td>
            <td>Set text spacing measured in twentieths of a point.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setstrikeout") %>">SetStrikeout</a></td>
            <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setunderline") %>">SetUnderline</a></td>
            <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setvertalign") %>">SetVertAlign</a></td>
            <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
var oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(30);
oParagraph.SetJc("left");
oRun.AddText("This is a sample text inside the shape with the font size set to 15 points using the text properties.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "ApiTextPr.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006256&doc=d1pFeUtjODY3dkYveGJKWXVuSi8xS2ZOOGh4UnI1SGpSbHk2eC9YNE9rRT0_IjUwMDYyNTYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
