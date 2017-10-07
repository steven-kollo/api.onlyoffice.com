<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSection</span>
</h1>

<h4 class="header-gray" id="CreateSection">CreateSection(oParagraph) &rarr; {<a href="<%= Url.Action("textdocumentapi/apisection") %>">ApiSection</a>}</h4>
<p class="dscr">Create a new document section which ends at the specified paragraph. Allows to set local parameters for the current section - page size, footer, header, columns, etc.</p>
                
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
                        <td><em>oParagraph</em></td>
                        <td>
                            <a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
                </table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apisection") %>">ApiSection</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a new paragraph.");
oParagraph.AddLineBreak();
oParagraph.AddText("Scroll down to see the new section.");
var oSection1 = oDocument.CreateSection(oParagraph);
oSection1.SetEqualColumns(1, 720);
oSection1.SetPageSize(12240, 15840);
oSection1.SetPageMargins(1440, 1440, 1440, 1440);
oSection1.SetHeaderDistance(720);
oSection1.SetFooterDistance(576);
oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingBefore(100, true);
oParagraph.SetSpacingAfter(360);
oParagraph.AddText("This is a paragraph in a new section");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "CreateSection.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887121&doc=dS9rRWJWME5ETlM4SXNsOTdEMHJzUTVDeWtiRWIvTzV2OC9kRmJldlJJcz0_IjQ4ODcxMjEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
