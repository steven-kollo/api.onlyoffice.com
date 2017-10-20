<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetHeader</span>
</h1>

<h4 class="header-gray" id="GetHeader">GetHeader(sType, isCreate<sub>opt</sub>) &rarr; (nullable) {<a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>}</h4>
<p class="dscr">Get the content for the specified header type.</p>

            <h2>Parameters:</h2>
                <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Attributes</td>
                            <td>Default</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><em>sType</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#HdrFtrType">HdrFtrType</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>Type of header to get the content from.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>isCreate</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td> &lt;optional></td>
                        <td>false</td>
                        <td>Whether to create a new header or not with the specified 
header type in case no header with such a type could be found in the current section.</td>
                    </tr>
                </tbody>
                </table>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oHeader;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a page with a header. ");
oParagraph.AddText("See it above.");
var oSection = oDocument.GetFinalSection();
oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is a page header");
builder.SaveFile("docx", "GetHeader.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892250&doc=R1o0UDVKUU1CeHVjL0tlazJ1eWxrSzUyWVZzVDZCRE1ITTg4VkZaRUlYVT0_IjQ4OTIyNTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
