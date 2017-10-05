<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiRun</span>
</h1>
<h4 class="header-gray" id="ApiRun">new ApiRun()</h4>
<p class="dscr">Class representing a small text block called 'run'.</p>

<h2>Extends</h2>
<table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apitextpr") %>">ApiTextPr</a></td>
                        <td>Class representing text properties.</td>
                    </tr>
                </tbody>
            </table>

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
                        <td><a href="<%= Url.Action("presentationapi/apirun/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add a line break to the current run position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/addtext") %>">AddText</a></td>
                        <td>Add some text to this run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/clearcontent") %>">ClearContent</a></td>
                        <td>Remove all content from the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/gettextpr") %>">GetTextPr</a></td>
                        <td>Get the text properties of the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setbold") %>">SetBold</a></td>
                        <td>Set the bold property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setcaps") %>">SetCaps</a></td>
                        <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
                        <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setfill") %>">SetFill</a></td>
                        <td>Set the text color for the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setfontfamily") %>">SetFontFamily</a></td>
                        <td>Set all 4 font slots with the specified font family.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setfontsize") %>">SetFontSize</a></td>
                        <td>Set the font size for the characters of the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setitalic") %>">SetItalic</a></td>
                        <td>Set the italic property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setsmallcaps") %>">SetSmallCaps</a></td>
                        <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setspacing") %>">SetSpacing</a></td>
                        <td>Set text spacing measured in twentieths of a point.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setstrikeout") %>">SetStrikeout</a></td>
                        <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setunderline") %>">SetUnderline</a></td>
                        <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setvertalign") %>">SetVertAlign</a></td>
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
oRun.SetFontSize(30);
oRun.AddText("This is just a sample text. Nothing special.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ApiRun.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011296&doc=V3N0RTdITjh2UFRtUXFSc0xoZ3JobU00b25UTDd4ZE5rRi9iTHQ2MTdqST0_IjUwMTEyOTYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
