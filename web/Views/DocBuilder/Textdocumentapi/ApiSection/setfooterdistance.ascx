<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFooterDistance</span>
</h1>

<h4 class="header-gray" id="SetFooterDistance">SetFooterDistance(nDistance)</h4>
<p class="dscr">Specify the distance from the bottom edge of the page to the bottom edge of the footer.</p>

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
                        <td>The distance from the bottom edge of the page to the bottom edge 
of the footer measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oFooter;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a page with a footer. ");
oParagraph.AddText("Scroll down the page to see it.");
var oSection = oDocument.GetFinalSection();
oFooter = oSection.GetFooter("default", true);
oSection.SetFooterDistance(1440);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is a page footer. ");
oParagraph.AddText("The distance from the page bottom to the footer is 1 inch (1440 twentieths of a point).");
builder.SaveFile("docx", "SetFooterDistance.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892387&doc=VTV3R2FvaGltM0lseTE1d3ZIN056VDBzbUZ2M1BCUjBraDl3UURtR0NTbz0_IjQ4OTIzODci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
