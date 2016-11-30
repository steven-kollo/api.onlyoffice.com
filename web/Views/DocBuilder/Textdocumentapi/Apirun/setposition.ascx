<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetPosition</span>
</h1>

<h4 class="header-gray" id="SetPosition">SetPosition(nPosition)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitextpr/setposition") %>">ApiTextPr.SetPosition</a>
                </li></ul></dd>
                </dl>

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
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetPosition(10);
oRun.AddText("This is a text run with the text raised 5 points (10 half-points).");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetPosition(-16);
oRun.AddText("This is a text run with the text lowered 8 points (16 half-points).");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetPosition.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892207&doc=amx3MmxyWTB5MWNIWEh5TzlQMXdPUHBlMXJDY3VSaE00UDhIY08zZHM4OD0_IjQ4OTIyMDci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>