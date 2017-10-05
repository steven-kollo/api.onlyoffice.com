<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetEqualColumns</span>
</h1>

<h4 class="header-gray" id="SetEqualColumns">SetEqualColumns(nCount, nSpace)</h4>
<p class="dscr">Specify that all text columns in the current section are of equal width.</p>

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
                        <td><em>nCount</em></td>
                        <td>
                        <em>number</em>
                        </td>
                        <td>Number of columns.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSpace</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td>Distance between columns measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
var oSection = oDocument.GetFinalSection();
oSection.SetEqualColumns(3, 720);
oParagraph.AddText("This is a text split into 3 equal columns. ");
oParagraph.AddText("The columns are separated by the distance of half an inch.");
oParagraph.AddColumnBreak();
oParagraph.AddText("This text starts from column #2. ");
oParagraph.AddText("This sentence is used to add lines for demonstrative purposes.");
oParagraph.AddColumnBreak();
oParagraph.AddText("This text starts from column #3. ");
oParagraph.AddText("This sentence is used to add lines for demonstrative purposes.");
builder.SaveFile("docx", "SetEqualColumns.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892336&doc=TXM5SWdHdkdLOGlObjB2QTduTFJ5UmRXS0xmR3NzTWFpdWI4NklEZmdLcz0_IjQ4OTIzMzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
