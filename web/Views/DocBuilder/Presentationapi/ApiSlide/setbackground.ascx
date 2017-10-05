<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBackground</span>
</h1>

<h4 class="header-gray" id="SetBackground">SetBackground(oFill)</h4>
<p class="dscr">Set the background to the current presentation slide.</p>

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
                            <td><em>oFill</em></td>
                            <td><a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a></td>
                            <td>The color or pattern used to fill the presentation slide background.</td>
                        </tr>
                    </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
oPresentation.SetSizes(254 * 36000, 190 * 36000);
var oSlide = oPresentation.GetCurrentSlide();
oSlide.RemoveAllObjects();
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "SetBackground.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011291&doc=VE5qbGpRMjZabHlaMnZUMGdndnZDN1oxUW51TTZJelJCbU93ZTVDL1V2dz0_IjUwMTEyOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
