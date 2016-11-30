<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetPageSize</span>
</h1>

<h4 class="header-gray" id="SetPageSize">SetPageSize(nWidth, nHeight, isPortrait<sub>opt</sub>)</h4>
<p class="dscr">Specify the properties (size and orientation) for all pages in the current section.</p>

            <h2>Parameters:</h2>
                <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Attributes</td>
                            <td>Default</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><em>nWidth</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The page width measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nHeight</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The page height measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>isPortrait</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td> &lt;optional></td>
                        <td>false</td>
                        <td>Specifies the orientation of all pages in this section (if set to <code>true</code> then the portrait orientation is chosen).</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oHeader;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a page with a page size set. ");
oParagraph.AddText("The page width is 5 inches (7200 twentieths of a point). ");
oParagraph.AddText("The page height is 3 inches (4320 twentieths of a point). ");
oParagraph.AddText("The font size is default (11 points).");
var oSection = oDocument.GetFinalSection();
oSection.SetPageMargins(720, 720, 720, 720);
oSection.SetPageSize(7200, 4320);
builder.SaveFile("docx", "SetPageSize.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892400&doc=akFINE5ZMGtIL05FSHVOdmJEKzIxaXMxdWlrL3FFb3h5QkJORWVobHBYcz0_IjQ4OTI0MDAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>