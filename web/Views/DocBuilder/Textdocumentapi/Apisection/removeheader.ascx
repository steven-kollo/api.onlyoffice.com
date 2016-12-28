<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveHeader</span>
</h1>

<h4 class="header-gray" id="RemoveHeader">RemoveHeader(sType)</h4>
<p class="dscr">Remove the header of the specified type from the current section. After removal the header will be inherited fromthe previous section or, if this is the first section in the document, no header of the specifiedtype will be present.</p>

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
                        <td>Type of header to be removed.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oHeader;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This page first was with a header. ");
oParagraph.AddText("The header has been removed, you cannot see it. ");
oParagraph.AddText("Scroll down to the next page to see the header there.");
var oSection = oDocument.CreateSection(oParagraph);
oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is page header #1. ");
oParagraph.AddText("You will not see it, as it will be removed.");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a page with a header. ");
oDocument.Push(oParagraph);
var oSection1 = oDocument.GetFinalSection();
oHeader = oSection1.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is page header #2. ");
oParagraph.AddText("Only this header can be seen, as the first one has been removed.");
oSection.RemoveHeader("default");
builder.SaveFile("docx", "RemoveHeader.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892308&doc=bmZGZ3ZBc3dyWWE4c2FEUUNNU3FKaTJzbVVVOGR1REQwa3FpNnlLNEJWWT0_IjQ4OTIzMDgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>