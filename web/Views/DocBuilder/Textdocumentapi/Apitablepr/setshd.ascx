<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetShd</span>
</h1>
<h4 class="header-gray" id="SetShd">SetShd(sType, r, g, b, isAuto<sub>opt</sub>)</h4>
                
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
var oParagraph, oTable, oTableStyle, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We added a gray shading to the table:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTable = Api.CreateTable(3, 3);
oTablePr.SetShd("clear", 0xEE, 0xEE, 0xEE, false);
oTable.SetTableLook(true, true, true, true, false, false);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetShd.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896612&doc=NEdJd0l0UmRGelozYXI1UkM2azFiV0JvS1VkM3dWTVcwN2theEU4dldTZz0_IjQ4OTY2MTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>