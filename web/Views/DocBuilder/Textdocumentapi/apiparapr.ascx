<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiParaPr</span>
</h1>

<h4 class="header-gray" id="ApiParaPr">new ApiParaPr()</h4>
<p class="dscr">Class representing a paragraph properties.</p>
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
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setbetweenborder") %>">SetBetweenBorder</a></td>
            <td>Specify the border which will be displayed between each paragraph in a set of paragraphs which have the same set of paragraph border settings.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setbottomborder") %>">SetBottomBorder</a></td>
            <td>Specify the border which will be displayed below a set of paragraphs which have the same paragraph border settings.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setcontextualspacing") %>">SetContextualSpacing</a></td>
            <td>Specify that any space before or after this paragraph set using the spacing element <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingbefore") %>">ApiParaPr.SetSpacingBefore</a> or <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingafter") %>">ApiParaPr.SetSpacingAfter</a>, should not be applied when the preceding and following paragraphs are of the same paragraph style, affecting the top and bottom spacing respectively.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setindfirstline") %>">SetIndFirstLine</a></td>
            <td>Set the paragraph first line indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setindleft") %>">SetIndLeft</a></td>
            <td>Set the paragraph left side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setindright") %>">SetIndRight</a></td>
            <td>Set the paragraph right side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setjc") %>">SetJc</a></td>
            <td>Set paragraph contents justification.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setkeeplines") %>">SetKeepLines</a></td>
            <td>Specify that when rendering this document using a page view, all lines of this paragraph are maintained on a single page whenever possible.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setkeepnext") %>">SetKeepNext</a></td>
            <td>Specify that when rendering this document using a paginated view, the contents of this paragraph are at least partly rendered on the same page as the following paragraph whenever possible.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setleftborder") %>">SetLeftBorder</a></td>
            <td>Specify the border which will be displayed at the left side of the page around the specified paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setnumpr") %>">SetNumPr</a></td>
            <td>Specify that the current paragraph references a numbering definition instance in the current document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setpagebreakbefore") %>">SetPageBreakBefore</a></td>
            <td>Specify that when rendering this document using a paginated view, the contents of this paragraph are rendered at the beginning of a new page in the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setrightborder") %>">SetRightBorder</a></td>
            <td>Specify the border which will be displayed at the right side of the page around the specified paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setshd") %>">SetShd</a></td>
            <td>Specify the shading applied to the contents of the paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingafter") %>">SetSpacingAfter</a></td>
            <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingbefore") %>">SetSpacingBefore</a></td>
            <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingline") %>">SetSpacingLine</a></td>
            <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setstyle") %>">SetStyle</a></td>
            <td>The paragraph style base method.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/settabs") %>">SetTabs</a></td>
            <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/settopborder") %>">SetTopBorder</a></td>
            <td>Specify the border which will be displayed above a set of paragraphs which have the same set of paragraph border settings.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setwidowcontrol") %>">SetWidowControl</a></td>
            <td>Specify whether a single line of this paragraph will be prevented from being displayed on a separate page from the remaining content at display time by moving the line onto the following page.</td>
        </tr>
    </tbody>
</table>
            
<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oHeading6Style = oDocument.GetStyle("Heading 6");
oParaPr = oHeading6Style.GetParaPr();
oParaPr.SetStyle(oHeading6Style);
oParaPr.SetJc("center");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oHeading6Style);
oParagraph.AddText("This is a text in a paragraph styled with the 'Heading 6' style.");
builder.SaveFile("docx", "SetStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891401&doc=Zy9sZVlybEdRVDhwSjY0RFhqVzlSY3dPSVVTdlBDWHc3Nm1DYTJTd1ArTT0_IjQ4OTE0MDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>