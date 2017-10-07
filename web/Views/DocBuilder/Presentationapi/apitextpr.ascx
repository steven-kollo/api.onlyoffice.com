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
            <td><a href="<%= Url.Action("presentationapi/apitextpr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setbold") %>">SetBold</a></td>
            <td>Set the bold property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setcaps") %>">SetCaps</a></td>
            <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
            <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setfill") %>">SetFill</a></td>
            <td>Set the text color for the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setfontfamily") %>">SetFontFamily</a></td>
            <td>Set all 4 font slots with the specified font family.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setfontsize") %>">SetFontSize</a></td>
            <td>Set the font size for the characters of the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setitalic") %>">SetItalic</a></td>
            <td>Set the italic property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setsmallcaps") %>">SetSmallCaps</a></td>
            <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setspacing") %>">SetSpacing</a></td>
            <td>Set text spacing measured in twentieths of a point.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setstrikeout") %>">SetStrikeout</a></td>
            <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setunderline") %>">SetUnderline</a></td>
            <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setvertalign") %>">SetVertAlign</a></td>
            <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(30);
oParagraph.SetJc("left");
oRun.AddText("This is a sample text inside the shape with the font size set to 15 points using the text properties.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ApiTextPr.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011301&doc=UW15VDZzYjVBWXFqa1pOdERNK0w3SzVWd0Z6bkNmbS9lMnNEODJ4OHFaVT0_IjUwMTEzMDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
