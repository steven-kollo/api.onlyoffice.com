<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddElement</span>
</h1>

<h4 class="header-gray" id="AddElement">AddElement(nPos, oElement)</h4>
                                   
<dl class="details">
                    <dt>Inherited From:</dt>
                    <dd>
                        <ul>
                            <li>
                                <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/addelement") %>">ApiDocumentContent.AddElement</a>
                            </li>
                        </ul>
                    </dd>
</dl>
                
<p class="dscr">Add paragraph or table using its position in the document.</p>    
                
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
                            <td><em>nPos</em></td>
                            <td>
                                <em>number</em>
                            </td>
                            <td>The position where the current element will be added.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><em>oElement</em></td>
                            <td>
                                <a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>
                            </td>
                            <td>The document element which will be added at the current position.</td>
                        </tr>
                    </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("Number of paragraph elements at this point: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
oRun.AddLineBreak();
oParagraph.AddElement(oRun);
oRun.AddText("Number of paragraph elements after we added a text run: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
oDocument.AddElement(oParagraph);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "AddElement.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887084&doc=QUJUZXVXbkIyc0tUQ3Y1YnpSVWhxTzhWQ0p1MHdKck93azhtcGVhaGp5WT0_IjQ4ODcwODQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
