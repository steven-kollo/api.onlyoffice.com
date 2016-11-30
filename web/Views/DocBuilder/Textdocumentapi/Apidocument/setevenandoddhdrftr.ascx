<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetEvenAndOddHdrFtr</span>
</h1>

<h4 class="header-gray" id="SetEvenAndOddHdrFtr">SetEvenAndOddHdrFtr(isEvenAndOdd)</h4>             
<p class="dscr">Specify whether sections in this document will have different headers and footers for even and odd pages (one header/footer for odd pages and another header/footer for even pages).</p>                    
                
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
                            <td><em>isEvenAndOdd</em></td>
                            <td>
                            <em>boolean</em>
                            </td>
                            <td>If <em>true</em> the header/footer will be different for odd and even pages, if <em>false</em> they will be the same.</td>
                       </tr>
                    </tbody>
                    </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oFooter;
oParagraph = oDocument.GetElement(0);
var oSection = oDocument.CreateSection(oParagraph);
oParagraph.AddText("This is section #1 of the document. ");
oParagraph.AddText("It has a header and a footer for odd pages. ");
oParagraph.AddText("Scroll down to see the other pages.");
oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is an odd page header");
oFooter = oSection.GetFooter("default", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is an odd page footer");
oDocument.SetEvenAndOddHdrFtr(true);
oParagraph = Api.CreateParagraph();
var oSection = oDocument.CreateSection(oParagraph);
oSection.SetType("evenPage");
oParagraph.AddText("This is section #2 of the document. ");
oParagraph.AddText("It has a header and a footer for even pages. ");
oParagraph.AddText("Scroll down to see the other pages.");
oDocument.Push(oParagraph);
oHeader = oSection.GetHeader("even", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is an even page header");
oFooter = oSection.GetFooter("even", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is an even page footer");
oParagraph = Api.CreateParagraph();
var oSection = oDocument.CreateSection(oParagraph);
oSection.SetType("oddPage");
oParagraph.AddText("This is section #3 of the document. ");
oParagraph.AddText("It has a header and a footer for odd pages. ");
oParagraph.AddText("Scroll down to see the other pages.");
oDocument.Push(oParagraph);
var oSection = oDocument.GetFinalSection();
oSection.SetType("evenPage");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is section #4 of the document. ");
oParagraph.AddText("It has a header and a footer for even pages.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetEvenAndOddHdrFtr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892499&doc=SXFBaDlrbUpNRkFvRzFqc3g4elVQY1A5eFdNVy9LRkkrRDJzVlo3TWhsVT0_IjQ4OTI0OTki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>