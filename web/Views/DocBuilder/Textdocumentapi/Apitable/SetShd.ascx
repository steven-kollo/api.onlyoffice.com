<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetShd</span>
</h1>

<h4 class="header-gray" id="SetShd">SetShd(sType, r, g, b, isAuto<sub>opt</sub>)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablepr/setshd") %>">ApiTablePr.SetShd</a>
                </li></ul></dd>
                </dl>

<p class="dscr">Specify the shading which is applied to the extents of the current table.</p>

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
                        <a href="<%= Url.Action("global") %>#ShdType">ShdType</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>The shading type applied to the extents of the current table.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>r</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>Red color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>g</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>Green color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>b</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>Blue color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>isAuto</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>  &lt;optional></td>
                        <td>false</td>
                        <td>The <em>true</em> value will disable the <em>SetShd</em> method use.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We added a gray shading to the table:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oTable.SetShd("clear", 0xEE, 0xEE, 0xEE, false);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetShd.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894978&doc=WFNFOHpHeDlYNW15d3pabW5yRks2STZ0L0JDUTJXc2NXUnBwZlRrb2hUUT0_IjQ4OTQ5Nzgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>