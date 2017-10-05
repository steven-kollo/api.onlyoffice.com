<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetPosition</span>
</h1>

<h4 class="header-gray" id="SetPosition">SetPosition(nPosition)</h4>
<p class="dscr">Specify the amount by which text is raised or lowered for this run in relation to the default baseline of the surrounding non-positioned text.</p>

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
                        <td><em>nPosition</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#hps">hps</a>
                        </td>
                        <td>Specifies a positive (raised text) or negative (lowered text) measurement in half-points (1/144 of an inch).</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetPosition(10);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text raised 5 points (10 half-points) above the baseline using the text properties.");
builder.SaveFile("docx", "SetPosition.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898126&doc=UmNaem9NZ1ZYclVSS1ozMERZT1BYQlZZOFE4ZWZiVTBlaHVsNlk5K05RUT0_IjQ4OTgxMjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
