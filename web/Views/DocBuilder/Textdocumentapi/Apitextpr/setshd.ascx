<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetShd</span>
</h1>

<h4 class="header-gray" id="SetShd">SetShd(sType, r, g, b)</h4>
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
                        <td><em>sType</em></td>
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
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetShd("clear", 0, 255, 0);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the shading set to green.");
builder.SaveFile("docx", "SetShd.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898150&doc=OTZIWWVjZ1owWXdKR3F0SG9wM0lvYTk2b2N1NDA1VjFwcmJLODdMWFo5bz0_IjQ4OTgxNTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>