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
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/addelement") %>">AddElement</a></td>
                            <td>Add paragraph or table using its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getclasstype") %>">GetClassType</a></td>
                            <td>Get the type of the current class.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">GetElement</a></td>
                            <td>Get the element by its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelementscount") %>">GetElementsCount</a></td>
                            <td>Get the number of elements in the current document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/push") %>">Push</a></td>
                            <td>Push a paragraph or a table to actually add it to the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/removeallelements") %>">RemoveAllElements</a></td>
                            <td>Remove all elements from the current document or from the current document element.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/removeelement") %>">RemoveElement</a></td>
                            <td>Remove element using the position specified.</td>
                        </tr>
                    </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oStroke, oFill, oDocContent;
oParagraph = oDocument.GetElement(0);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 3212465, 963295, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
oDocContent = oDrawing.GetDocContent();
oDocContent.RemoveAllElements();
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Number of elements inside the shape: " + oDocContent.GetElementsCount());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "ApiDocumentContent.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4910968&doc=bVdNcDU2RjlaUWxOVE5aNWFTUU96K0FNUmZQSVlSYlNaV3VpRXlDV3lNMD0_IjQ5MTA5Njgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>