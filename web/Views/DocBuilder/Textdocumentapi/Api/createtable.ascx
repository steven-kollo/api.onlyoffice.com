<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateTable</span>
</h1>

<h4 class="header-gray" id="CreateTable">CreateTable(nCols, nRows) &rarr; {<a href="<%= Url.Action("textdocumentapi/apitable") %>">ApiTable</a>}</h4>
<p class="dscr">Create a new table with a specified number of rows and columns.</p>                    
                
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
                        <td><em>nCols</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>Number of columns.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nRows</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>Number of rows.</td>
                    </tr>
                </tbody>
            </table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apitable") %>">ApiTable</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable;
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetTableBorderTop("single", 32, 0, 0, 0, 255);
oTable.SetTableBorderBottom("single", 32, 0, 0, 0, 255);
oTable.SetTableBorderLeft("single", 32, 0, 0, 0, 255);
oTable.SetTableBorderRight("single", 32, 0, 0, 0, 255);
oTable.SetTableBorderInsideV("single", 32, 0, 255, 0, 0);
oTable.SetTableBorderInsideH("single", 32, 0, 255, 0, 0);
oTable.SetWidth("percent", 100);
builder.SaveFile("docx", "CreateTable.docx");
builder.CloseFile();</pre>
            
<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4883401&doc=Z3lqWC84dUNtRHppMUFIU2tIS0h1NjM0K1RqZlJFU1prNzFndU5ZK1ZFcz0_IjQ4ODM0MDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
