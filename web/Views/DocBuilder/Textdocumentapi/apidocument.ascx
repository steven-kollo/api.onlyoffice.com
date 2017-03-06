<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiDocument</span>
</h1>

                <h4 class="header-gray" id="ApiDocument">new ApiDocument()</h4>
                <p class="dscr">Class representing a document.</p>
                                    
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
           <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a></td>
           <td>Class representing a container for paragraphs and tables.</td>
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
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/addelement") %>">AddElement</a></td>
                        <td>Add paragraph or table using its position in the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/createnumbering") %>">CreateNumbering</a></td>
                        <td>Create an abstract multilevel numbering with a specified type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/createsection") %>">CreateSection</a></td>
                        <td>Create a new document section which ends at the specified paragraph. Allows to set local parameters for the current section - page size, footer, header, columns, etc.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/createstyle") %>">CreateStyle</a></td>
                        <td>Create a new style with the specified type and name. If there is a style with the same name it will be replaced with a new one.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getclasstype") %>">GetClassType</a></td>
                        <td>Get this class type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getcommentsreport") %>">GetCommentsReport</a></td>
                        <td>Get a report about all the comments added to the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getdefaultparapr") %>">GetDefaultParaPr</a></td>
                        <td>Get a set of default paragraph properties in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getdefaultstyle") %>">GetDefaultStyle</a></td>
                        <td>Get the default style parameters for the specified document element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getdefaulttextpr") %>">GetDefaultTextPr</a></td>
                        <td>Get a set of default properties for the text run in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getelement") %>">GetElement</a></td>
                        <td>Get the element by its position in the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getelementscount") %>">GetElementsCount</a></td>
                        <td>Get the number of elements in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getfinalsection") %>">GetFinalSection</a></td>
                        <td>Get the document final section.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getreviewreport") %>">GetReviewReport</a></td>
                        <td>Get a report about every change which was made to the document in the review mode.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getstyle") %>">GetStyle</a></td>
                        <td>Get a style by the style name.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/push") %>">Push</a></td>
                        <td>Push a paragraph or a table to actually add it to the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/removeallelements") %>">RemoveAllElements</a></td>
                        <td>Remove all elements from the current document or from the current document element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/removeelement") %>">RemoveElement</a></td>
                        <td>Remove element using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/setevenandoddhdrftr") %>">SetEvenAndOddHdrFtr</a></td>
                        <td>Specify whether sections in this document will have different headers and footers for even and odd pages (one header/footer for odd pages and another header/footer for even pages).</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr, oTextPr, oRun;
var oNoSpacingStyle = oDocument.GetStyle("No Spacing");
var oSection = oDocument.GetFinalSection();
var oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is the text in the default header");
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(22);
oTextPr.SetLanguage("en-US");
oTextPr.SetFontFamily("Calibri");
oParaPr = oDocument.GetDefaultParaPr();
oParaPr.SetSpacingLine(276, "auto");
oParaPr.SetSpacingAfter(200);
var oNormalStyle = oDocument.GetDefaultStyle("paragraph");
oParaPr = oNormalStyle.GetParaPr();
oParaPr.SetSpacingLine(240, "auto");
oParaPr.SetJc("both");
oTextPr = oNormalStyle.GetTextPr();
oTextPr.SetColor(0x26, 0x26, 0x26, false);
var oHeading1Style = oDocument.CreateStyle("Heading 1", "paragraph");
oParaPr = oHeading1Style.GetParaPr();
oParaPr.SetKeepNext(true);
oParaPr.SetKeepLines(true);
oParaPr.SetSpacingAfter(240);
oTextPr = oHeading1Style.GetTextPr();
oTextPr.SetColor(0xff, 0x68, 0x00, false);
oTextPr.SetFontSize(40);
oTextPr.SetFontFamily("Calibri Light");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oHeading1Style);
oParagraph.AddText("This is a heading");
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("Number of paragraph elements at this point: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
oRun.AddLineBreak();
oParagraph.AddElement(oRun);
oRun.AddText("Number of paragraph elements after we added a text run: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
oDocument.Push(oParagraph);
var oNumbering = oDocument.CreateNumbering("bullet");
var oNumLvl;
for (var nLvl = 0; nLvl < 8; ++nLvl)
{
  oNumLvl = oNumbering.GetLevel(nLvl);
  oParagraph = Api.CreateParagraph();
  oParagraph.AddText("Default bullet lvl " + (nLvl + 1));
  oParagraph.SetNumbering(oNumLvl);
  oParagraph.SetContextualSpacing(true);
  oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "ApiDocument.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887066&doc=S1ZKd2JGRmNIUWFDeU8reTBlVGJrTDNqKzJweW1BSEZWQkZ4Mi9hRnE5dz0_IjQ4ODcwNjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>