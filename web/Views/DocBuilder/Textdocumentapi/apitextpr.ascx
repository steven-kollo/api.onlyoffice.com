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
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setbold") %>">SetBold</a></td>
            <td>Set the bold property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setcaps") %>">SetCaps</a></td>
            <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setcolor") %>">SetColor</a></td>
            <td>Set the text color for the current text run in the RGB format.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
            <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setfontfamily") %>">SetFontFamily</a></td>
            <td>Set all 4 font slots with the specified font family.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setfontsize") %>">SetFontSize</a></td>
            <td>Set the font size for the characters of the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/sethighlight") %>">SetHighlight</a></td>
            <td>Specify a highlighting color in the RGB format which is applied as a background for the contents of the current run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setitalic") %>">SetItalic</a></td>
            <td>Set the italic property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setlanguage") %>">SetLanguage</a></td>
            <td>Specify the languages which will be used to check spelling and grammar (if requested) when processing the contents of this text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setposition") %>">SetPosition</a></td>
            <td>Specify the amount by which text is raised or lowered for this run in relation to the default baseline of the surrounding non-positioned text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setshd") %>">SetShd</a></td>
            <td>Specify the shading applied to the contents of the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setsmallcaps") %>">SetSmallCaps</a></td>
            <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setspacing") %>">SetSpacing</a></td>
            <td>Set text spacing measured in twentieths of a point.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setstrikeout") %>">SetStrikeout</a></td>
            <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setstyle") %>">SetStyle</a></td>
            <td>The text style base method.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setunderline") %>">SetUnderline</a></td>
            <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setvertalign") %>">SetVertAlign</a></td>
            <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(30);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font size set to 15 points using the text properties.");
builder.SaveFile("docx", "SetFontSize.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898091&doc=YmtJMFJNbHpqZjV2eEdiRjl1c09DeVFBdzJnUTBEUit5NFNSK1ZtMEFzdz0_IjQ4OTgwOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>