<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetPageMargins</span>
</h1>

<h4 class="header-gray" id="SetPageMargins">SetPageMargins(nLeft, nTop, nRight, nBottom)</h4>
<p class="dscr">Specify the page margins for all pages in this section.</p>

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
                        <td><em>nLeft</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td>The left margin width measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nTop</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td>The top margin height measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nRight</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td>The right margin width measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nBottom</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td>The bottom margin height measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a page with margins set. ");
oParagraph.AddText("The left margin is 5 inches wide (7200 twentieths of a point). ");
oParagraph.AddText("The top margin is 2 inches high (2880 twentieths of a point). ");
oParagraph.AddText("The right margin is 1 inch wide (1440 twentieths of a point). ");
oParagraph.AddText("The bottom margin is 4 inches high (5760 twentieths of a point). ");
var oSection = oDocument.GetFinalSection();
oSection.SetPageMargins(7200, 2880, 1440, 5760);
builder.SaveFile("docx", "SetPageMargins.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892397&doc=UndEMERmRGV4eGhDY1VKZ1lXaFFXamJ5Ny9jUmZML2FnZHkyOWhGYXRaVT0_IjQ4OTIzOTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>