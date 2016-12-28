<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetHeaderDistance</span>
</h1>

<h4 class="header-gray" id="SetHeaderDistance">SetHeaderDistance(nDistance)</h4>
<p class="dscr">Specify the distance from the top edge of the page to the top edge of the header.</p>

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
                        <td><em>nDistance</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td>The distance from the top edge of the page to the top edge of the header measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oHeader;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a page with a header. ");
oParagraph.AddText("Scroll down the page to see it.");
var oSection = oDocument.GetFinalSection();
oHeader = oSection.GetHeader("default", true);
oSection.SetHeaderDistance(1440);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is a page header. ");
oParagraph.AddText("The distance from the page top to the header is 1 inch (1440 twentieths of a point).");
builder.SaveFile("docx", "SetHeaderDistance.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892391&doc=RW5ENmlDKzl1ODNCQklENCtWamNramFna29CNHFKak1Lelh0ZVhPenBsVT0_IjQ4OTIzOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>