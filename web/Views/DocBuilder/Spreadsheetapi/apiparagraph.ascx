<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiParagraph</span>
</h1>
<h4 class="header-gray" id="ApiParagraph">new ApiParagraph()</h4>
<p class="dscr">Class representing a paragraph.</p>

<h2>Extends</h2>
            <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparapr") %>">ApiParaPr</a></td>
                        <td>Class representing a paragraph properties.</td>
                    </tr>
                </tbody>
            </table>

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
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/addelement") %>">AddElement</a></td>
                        <td>Add an element to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add line break to the current position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/addtext") %>">AddText</a></td>
                        <td>Add some text to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/getelement") %>">GetElement</a></td>
                        <td>Get the element of the paragraph using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/getelementscount") %>">GetElementsCount</a></td>
                        <td>Get the number of elements in the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/getparapr") %>">GetParaPr</a></td>
                        <td>Get paragraph properties.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/removeallelements") %>">RemoveAllElements</a></td>
                        <td>Remove all elements from the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/removeelement") %>">RemoveElement</a></td>
                        <td>Remove the element using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setbullet") %>">SetBullet</a></td>
                        <td>Set the bullet or numbering to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setindfirstline") %>">SetIndFirstLine</a></td>
                        <td>Set the paragraph first line indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setindleft") %>">SetIndLeft</a></td>
                        <td>Set the paragraph left side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setindright") %>">SetIndRight</a></td>
                        <td>Set the paragraph right side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setjc") %>">SetJc</a></td>
                        <td>Set paragraph contents justification.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a></td>
                        <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingbefore") %>">SetSpacingBefore</a></td>
                        <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingline") %>">SetSpacingLine</a></td>
                        <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/settabs") %>">SetTabs</a></td>
                        <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("center");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the right side. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("right");
oDocContent.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the left side. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("left");
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "ApiParagraph.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006331&doc=VlErZ2RCTVl0blY1d3FVWHVPV1RHNTZteTJZUjhrOTcxeWdtZE1aZ3BCOD0_IjUwMDYzMzEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>