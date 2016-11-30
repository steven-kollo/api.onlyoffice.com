<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetShd</span>
</h1>

<h4 class="header-gray" id="SetShd">SetShd(sType, r, g, b)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitextpr/setshd") %>">ApiTextPr.SetShd</a>
                </li></ul></dd>
                </dl>

<p class="dscr">Specify the shading applied to the contents of the current text run.</p>

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
                        <td><code>sType</code></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#ShdType">ShdType</a>
                        </td>
                        <td>The shading type applied to the contents of the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>r</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Red color component value.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>g</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Green color component value.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>b</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Blue color component value.</td>
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
oRun.SetShd("clear", 0, 255, 0);
oRun.AddText("This is a text run with the text shading set to green.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetShd.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892213&doc=ZE1VMkw4ckVSQjVLdEtiTVQ0Z3J6NVBKN2ZxOUJzRXUxN0J0M1dxS0VTQT0_IjQ4OTIyMTMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>