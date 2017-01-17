<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetFooter</span>
</h1>

<h4 class="header-gray" id="GetFooter">GetFooter(sType, isCreate<sub>opt</sub>) &rarr; (nullable) {<a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>}</h4>
<p class="dscr">Get the content for the specified footer type.</p>

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
                        <td>Type of footer to get the content from.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>isCreate</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td> &lt;optional></td>
                        <td>false</td>
                        <td>Whether to create a new footer or not with the specified footer type in case no footer with such a type could be found in the current section.</td>
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
var oParagraph, oFooter;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a page with a footer. ");
oParagraph.AddText("Scroll down the page to see it.");
var oSection = oDocument.GetFinalSection();
oFooter = oSection.GetFooter("default", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is a page footer");
builder.SaveFile("docx", "GetFooter.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892247&doc=blJyT1lka29sSGhUUnlqSlpZZ1dlK3JOZWVrNjIrMWtpbFYyWi95K2J1WT0_IjQ4OTIyNDci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>