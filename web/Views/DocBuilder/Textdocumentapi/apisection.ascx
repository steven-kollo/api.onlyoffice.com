<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiSection</span>
</h1>

<h4 class="header-gray" id="ApiSection">new ApiSection()</h4>
<p class="dscr">Class representing a document section.</p>

<h2>Methods</h2>
<table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/getfooter") %>">GetFooter</a></td>
                        <td>Get the content for the specified footer type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/getheader") %>">GetHeader</a></td>
                        <td>Get the content for the specified header type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/removefooter") %>">RemoveFooter</a></td>
                        <td>Remove the footer of the specified type from the current section. After removal the footer will be inherited from the previous section or, if this is the first section in the document, no footer of the specified type will be present.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/removeheader") %>">RemoveHeader</a></td>
                        <td>Remove the header of the specified type from the current section. After removal the header will be inherited from the previous section or, if this is the first section in the document, no header of the specified type will be present.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setequalcolumns") %>">SetEqualColumns</a></td>
                        <td>Specify that all text columns in the current section are of equal width.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setfooterdistance") %>">SetFooterDistance</a></td>
                        <td>Specify the distance from the bottom edge of the page to the bottom edge of the footer.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setheaderdistance") %>">SetHeaderDistance</a></td>
                        <td>Specify the distance from the top edge of the page to the top edge of the header.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setnotequalcolumns") %>">SetNotEqualColumns</a></td>
                        <td>Specify that all columns in the current section are of a different width. Number of columns is equal to the length of the <em>aWidth</em> array. The length of the <em>aSpaces</em> array <b>MUST BE</b> equal to (<em>aWidth.length - 1</em>).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setpagemargins") %>">SetPageMargins</a></td>
                        <td>Specify the page margins for all pages in this section.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setpagesize") %>">SetPageSize</a></td>
                        <td>Specify the properties (size and orientation) for all pages in the current section.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/settitlepage") %>">SetTitlePage</a></td>
                        <td>Specify whether the current section in this document have different header and footer for the section first page.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/settype") %>">SetType</a></td>
                        <td>Specify the type of the current section. The section type defines how the contents of the current section are placed relative to the previous section.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oHeader;
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
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892336&doc=enErSFV3TU9tZENjSVM3NjlJeC9FclRaUlhOVnA0cFNoOUpyY2hjV20zMD0_IjQ4OTIzMzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>