<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiParagraph</span>
</h1>

<h4 class="header-gray" id="ApiParagraph">new ApiParagraph()</h4>
<p class="dscr">Class representing a paragraph.</p>

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
                        <td><a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a></td>
                        <td>Class representing a paragraph properties.</td>
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
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addcolumnbreak") %>">AddColumnBreak</a></td>
                        <td>Add column break to the current position and start the next element from a new column.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/adddrawing") %>">AddDrawing</a></td>
                        <td>Add an object (image, shape or chart) to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addelement") %>">AddElement</a></td>
                        <td>Add an element to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add line break to the current position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addpagebreak") %>">AddPageBreak</a></td>
                        <td>Add page break and start the next element from the next page.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addpagenumber") %>">AddPageNumber</a></td>
                        <td>Insert the number of the current document page into the paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addpagescount") %>">AddPagesCount</a></td>
                        <td>Insert the number of pages in the current document into the paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext") %>">AddText</a></td>
                        <td>Add some text to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getelement") %>">GetElement</a></td>
                        <td>Get the element of the paragraph using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getelementscount") %>">GetElementsCount</a></td>
                        <td>Get the number of elements in the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getnumbering") %>">GetNumbering</a></td>
                        <td>Get a numbering definition and numbering level for the numbered list.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getparagraphmarktextpr") %>">GetParagraphMarkTextPr</a></td>
                        <td>Get the text properties of the paragraph mark which is used to mark the paragraph end. The mark can also acquire common text properties like <em>bold</em>, <em>italic</em>, <em>underline</em>, etc.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getparapr") %>">GetParaPr</a></td>
                        <td>Get paragraph properties.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/removeallelements") %>">RemoveAllElements</a></td>
                        <td>Remove all elements from the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/removeelement") %>">RemoveElement</a></td>
                        <td>Remove the element using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setbetweenborder") %>">SetBetweenBorder</a></td>
                        <td>Specify the border which will be displayed between each paragraph in a set of paragraphs which have the same set of paragraph border settings.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setbottomborder") %>">SetBottomBorder</a></td>
                        <td>Specify the border which will be displayed below a set of paragraphs which have the same paragraph border settings.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setcontextualspacing") %>">SetContextualSpacing</a></td>
                        <td>Specify that any space before or after this paragraph set using the spacing element <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingbefore") %>">ApiParaPr.SetSpacingBefore</a> or <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingafter") %>">ApiParaPr.SetSpacingAfter</a>, should not be applied when the preceding and following paragraphs are of the same paragraph style, affecting the top and bottom spacing respectively.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setindfirstline") %>">SetIndFirstLine</a></td>
                        <td>Set the paragraph first line indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setindleft") %>">SetIndLeft</a></td>
                        <td>Set the paragraph left side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setindright") %>">SetIndRight</a></td>
                        <td>Set the paragraph right side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setjc") %>">SetJc</a></td>
                        <td>Set paragraph contents justification.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setkeeplines") %>">SetKeepLines</a></td>
                        <td>Specify that when rendering this document using a page view, all lines of this paragraph are maintained on a single page whenever possible.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setkeepnext") %>">SetKeepNext</a></td>
                        <td>Specify that when rendering this document using a paginated view, the contents of this paragraph are at least partly rendered on the same page as the following paragraph whenever possible.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setleftborder") %>">SetLeftBorder</a></td>
                        <td>Specify the border which will be displayed at the left side of the page around the specified paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setnumbering") %>">SetNumbering</a></td>
                        <td>Specify that the current paragraph references a numbering definition instance in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setnumpr") %>">SetNumPr</a></td>
                        <td>Specify that the current paragraph references a numbering definition instance in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setpagebreakbefore") %>">SetPageBreakBefore</a></td>
                        <td>Specify that when rendering this document using a paginated view, the contents of this paragraph are rendered at the beginning of a new page in the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setrightborder") %>">SetRightBorder</a></td>
                        <td>Specify the border which will be displayed at the right side of the page around the specified paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setshd") %>">SetShd</a></td>
                        <td>Specify the shading applied to the contents of the paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a></td>
                        <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingbefore") %>">SetSpacingBefore</a></td>
                        <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingline") %>">SetSpacingLine</a></td>
                        <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setstyle") %>">SetStyle</a></td>
                        <td>Set paragraph style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/settabs") %>">SetTabs</a></td>
                        <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/settopborder") %>">SetTopBorder</a></td>
                        <td>Specify the border which will be displayed above a set of paragraphs which have the same set of paragraph border settings.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setwidowcontrol") %>">SetWidowControl</a></td>
                        <td>Specify whether a single line of this paragraph will be prevented from being displayed on a separate page from the remaining content at display time by moving the line onto the following page.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with the text in it aligned by the left side. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("left");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the right side. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("right");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("center");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by both sides (justified). ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("both");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetJc.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889108&doc=YzhrS1VPYU5qd09rS081S3BjV2Qvems3emhkOHkwSGVGN2pMM3hSSWlaTT0_IjQ4ODkxMDgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>