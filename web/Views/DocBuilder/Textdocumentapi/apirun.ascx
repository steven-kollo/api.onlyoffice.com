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
                        <td><a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a></td>
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
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addcolumnbreak") %>">AddColumnBreak</a></td>
                        <td>Add a column break to the current run position and start the next element from a new column.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/adddrawing") %>">AddDrawing</a></td>
                        <td>Add an object (image, shape or chart) to the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add a line break to the current run position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addpagebreak") %>">AddPageBreak</a></td>
                        <td>Add a page break and start the next element from a new page.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addtext") %>">AddText</a></td>
                        <td>Add some text to this run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/clearcontent") %>">ClearContent</a></td>
                        <td>Remove all content from the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/gettextpr") %>">GetTextPr</a></td>
                        <td>Get the text properties of the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setbold") %>">SetBold</a></td>
                        <td>Set the bold property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setcaps") %>">SetCaps</a></td>
                        <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setcolor") %>">SetColor</a></td>
                        <td>Set the text color for the current text run in the RGB format.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
                        <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setfontfamily") %>">SetFontFamily</a></td>
                        <td>Set all 4 font slots with the specified font family.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setfontsize") %>">SetFontSize</a></td>
                        <td>Set the font size for the characters of the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/sethighlight") %>">SetHighlight</a></td>
                        <td>Specify a highlighting color in the RGB format which is applied as a background for the contents of the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setitalic") %>">SetItalic</a></td>
                        <td>Set the italic property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setlanguage") %>">SetLanguage</a></td>
                        <td>Specify the languages which will be used to check spelling and grammar (if requested) when processing the contents of this text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setposition") %>">SetPosition</a></td>
                        <td>Specify the amount by which text is raised or lowered for this run in relation to the default baseline of the surrounding non-positioned text.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setshd") %>">SetShd</a></td>
                        <td>Specify the shading applied to the contents of the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setsmallcaps") %>">SetSmallCaps</a></td>
                        <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setspacing") %>">SetSpacing</a></td>
                        <td>Set text spacing measured in twentieths of a point.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setstrikeout") %>">SetStrikeout</a></td>
                        <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setstyle") %>">SetStyle</a></td>
                        <td>Specify the style of the text character display.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setunderline") %>">SetUnderline</a></td>
                        <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setvertalign") %>">SetVertAlign</a></td>
                        <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. Nothing special.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddText.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891439&doc=MEY4YlNZK2ZQcUtuSm1WbmhROHY3ZXJWWVBlajc0L1AwaWVUN0F1UHVEMD0_IjQ4OTE0Mzki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>