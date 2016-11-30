<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiDocumentContent</span>
</h1>
<h4 class="header-gray" id="ApiDocumentContent">new ApiDocumentContent(Document)</h4>
                
                <p class="dscr">Class representing a container for paragraphs and tables.</p>    
               
                <h2>Parameters:</h2>
                <table class="table table-classlist">
                    <thead>
                        <tr class="tablerow">
                            <td class="table-classlist-name">Name</td>
                            <td>Type</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tablerow">
                            <td><em>Document</em></td>
                            <td></td>
                            <td></td>
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
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/addelement") %>">AddElement</a></td>
                            <td>Add paragraph or table using its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getclasstype") %>">GetClassType</a></td>
                            <td>Get the type of the current class.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getelement") %>">GetElement</a></td>
                            <td>Get the element by its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getelementscount") %>">GetElementsCount</a></td>
                            <td>Get the number of elements in the current document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/push") %>">Push</a></td>
                            <td>Push a paragraph or a table to actually add it to the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/removeallelements") %>">RemoveAllElements</a></td>
                            <td>Remove all elements from the current document or from the current document element.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/removeelement") %>">RemoveElement</a></td>
                            <td>Remove element using the position specified.</td>
                        </tr>
                    </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph, oRun;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("This is paragraph #1.");
for (var nParaIncrease = 1; nParaIncrease < 5; ++nParaIncrease)
{
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is paragraph #" + (nParaIncrease + 1) + ".");
oDocContent.Push(oParagraph);
}
oDocContent.RemoveElement(2);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("We removed paragraph #3, check that out above.");
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "ApiDocumentContent.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006400&doc=VElUcmpmaGYvZ0tYN21KQnE1dHdYRi8vNzZ2d2V2ZEUwdEZ3UzR5YUQrST0_IjUwMDY0MDAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>