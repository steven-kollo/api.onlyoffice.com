<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetNotEqualColumns</span>
</h1>

<h4 class="header-gray" id="SetNotEqualColumns">SetNotEqualColumns(aWidths, aSpaces)</h4>
<p class="dscr">Specify that all columns in the current section are of a different width. Number of columns is equal to the length of the <em>aWidth</em> array.The length of the <em>aSpaces</em> array <b>MUST BE</b> equal to (<em>aWidth.length - 1</em>).</p>

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
                        <td><em>aWidths</em></td>
                        <td>
                        <em>Array.&lt;<a href="<%= Url.Action("global") %>#twips">twips</a>></em>
                        </td>
                        <td>An array of column width values measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>aSpaces</em></td>
                        <td>
                        <em>Array.&lt;<a href="<%= Url.Action("global") %>#twips">twips</a>></em>
                        </td>
                        <td>An array of distances values between the columns measured in twentieths of a point (1/1440 of an inch).</td>
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
var oSection = oDocument.GetFinalSection();
oSection.SetNotEqualColumns([1440, 2880, 4320], [720, 480]);
oParagraph.AddText("This is a text split into 3 non-equal columns. ");
oParagraph.AddText("The first column is 1 inch wide (1440 twentieths of a point).");
oParagraph.AddColumnBreak();
oParagraph.AddText("This text starts from column #2. ");
oParagraph.AddText("This column is 2 inches wide (2880 twentieths of a point). ");
oParagraph.AddText("The distance between this column and column #1 is half an inch (720 twentieths of a point).");
oParagraph.AddColumnBreak();
oParagraph.AddText("This text starts from column #3. ");
oParagraph.AddText("This column is 3 inches wide (4320 twentieths of a point). ");
oParagraph.AddText("The distance between this column and column #2 is 1/3 of an inch (480 twentieths of a point).");
builder.SaveFile("docx", "SetNotEqualColumns.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892373&doc=cEY2WlZsSWlZM2xkWXRkbU5vYWpJN2tYY3g1T0RxSDZlUjBlcWY4TUxTcz0_IjQ4OTIzNzMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>