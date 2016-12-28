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
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/addelement") %>">AddElement</a></td>
                            <td>Add paragraph or table using its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/getclasstype") %>">GetClassType</a></td>
                            <td>Get the type of the current class.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/getelement") %>">GetElement</a></td>
                            <td>Get the element by its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/getelementscount") %>">GetElementsCount</a></td>
                            <td>Get the number of elements in the current document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/push") %>">Push</a></td>
                            <td>Push a paragraph or a table to actually add it to the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/removeallelements") %>">RemoveAllElements</a></td>
                            <td>Remove all elements from the current document or from the current document element.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/removeelement") %>">RemoveElement</a></td>
                            <td>Remove element using the position specified.</td>
                        </tr>
                    </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
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
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ApiDocumentContent.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007737&doc=N05pWjlrN0k5dG4ybzdBck1DNWZXV3BaMkR0czJNMXF6U2ZSdXRZeUF6VT0_IjUwMDc3Mzci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>