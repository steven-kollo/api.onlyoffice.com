<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetShd</span>
</h1>

<h4 class="header-gray" id="SetShd">SetShd(sType, r, g, b, isAuto<sub>opt</sub>)</h4>
<p class="dscr">Specify the shading applied to the contents of the paragraph.</p>

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
                        <td><br>
                        </td>
                        <td></td>
                        <td>The shading type which will be applied to the contents of the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>r</em></td>
                        <td>                
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td><br>
                        </td>
                        <td></td>
                        <td>Red color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>g</em></td>
                        <td>                
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td><br>
                        </td>
                        <td></td>
                        <td>Green color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>b</em></td>
                        <td>                
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td><br>
                        </td>
                        <td></td>
                        <td>Blue color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>isAuto</em></td>
                        <td>                
                        <em>boolean</em>
                        </td>
                        <td> &lt;optional><br>
                        </td>
                        <td>false</td>
                        <td>The <em>true</em> value will disable paragraph contents shading.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oParaPr.SetShd("clear", 0, 255, 0, false);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is an example of setting a shading to a paragraph. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.SetStyle(oMyStyle);
builder.SaveFile("docx", "SetShd.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891390&doc=VW8yeWNKcFNDdUxvM0lhVnZGOEZwTGdDUHZ6LzZ2dHZPVHg4NXQ4S0Jsaz0_IjQ4OTEzOTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
