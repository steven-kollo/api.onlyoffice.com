<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveFooter</span>
</h1>

<h4 class="header-gray" id="RemoveFooter">RemoveFooter(sType)</h4>
<p class="dscr">Remove the footer of the specified type from the current section. After removal the footer will be inherited fromthe previous section or, if this is the first section in the document, no footer of the specifiedtype will be present.</p>

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
                        <td><em>sType</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#HdrFtrType">HdrFtrType</a>
                        </td>
                        <td>Type of footer to be removed.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oFooter;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This page first was with a footer. ");
oParagraph.AddText("Scroll down the page to see if it was removed.");
var oSection = oDocument.CreateSection(oParagraph);
oFooter = oSection.GetFooter("default", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is page footer #1. ");
oParagraph.AddText("You will not see it, as it will be removed.");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a page with a footer. ");
oParagraph.AddText("Scroll down the page to see it.");
oDocument.Push(oParagraph);
var oSection1 = oDocument.GetFinalSection();
oFooter = oSection1.GetFooter("default", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is page footer #2. ");
oParagraph.AddText("Only this footer can be seen, as the first one has been removed.");
oSection.RemoveFooter("default");
builder.SaveFile("docx", "RemoveFooter.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892302&doc=SEhOcWpGTXdhVENkcTRhUis5dFpFcTdwTHdSRlFic0JxejBBSXladm1Laz0_IjQ4OTIzMDIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>