<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTitlePage</span>
</h1>
<h4 class="header-gray" id="SetTitlePage">SetTitlePage(isTitlePage)</h4>
<p class="dscr">Specify whether the current section in this document have different header and footer for the section first page.</p>

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
                        <td><em>isTitlePage</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>If <em>true</em> the first page of the section will have header and footer that will differ from the other pages of the same section.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oFooter;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This page does not have a footer, as it is a title page. ");
oParagraph.AddText("Scroll down the page to see if the footer was removed.");
var oSection = oDocument.CreateSection(oParagraph);
oSection.SetTitlePage(true);
oFooter = oSection.GetFooter("default", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is page footer. ");
oParagraph.AddText("You will only see it for page #2.");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is page #2 and it has a footer. ");
oParagraph.AddText("Scroll down the page to see it.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetTitlePage.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892417&doc=VWhxM1EwM0d5TC9ZVU81RS9KQzVQQmNIOWxFcHQ5bzR0MG1VV1lMV1U5dz0_IjQ4OTI0MTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>