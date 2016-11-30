<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiShape</span>
</h1>
<h4 class="header-gray" id="ApiShape">new ApiShape()</h4>
<p class="dscr">Class representing a shape.</p>

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
                        <td><a href="<%= Url.Action("spreadsheetapi/apishape/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apishape/getdoccontent") %>">GetDocContent</a></td>
                        <td>Get the shape inner contents where a paragraph or text runs can be inserted.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apishape/setverticaltextalign") %>">SetVerticalTextAlign</a></td>
                        <td>Set the vertical alignment for the shape content where a paragraph or text runs can be inserted.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oParagraph, oStroke, oFill, oDocContent;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 50 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oDocContent.RemoveAllElements();
oShape.SetVerticalTextAlign("bottom");
oParagraph = Api.CreateParagraph();
oParagraph.SetJc("left");
oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it ");
oParagraph.AddText("aligning it vertically by the bottom.");
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "SetVerticalTextAlign.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004838&doc=QjA3MitaZlZxU0k5cVB3TzE5V25MVEtRQmYrMzRDVFZveG52VG0wMDJnRT0_IjUwMDQ4Mzgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>