<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Api</span>
</h1>
<h4 class="header-gray">new Api()</h4>
<p class="dscr">Base class.</p>
<h2>Methods</h2>
<table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createblipfill") %>">CreateBlipFill</a></td>
                        <td>Create a blip fill which allows to fill the object using a selected image as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createchart") %>">CreateChart</a></td>
                        <td>Create a chart with the parameters specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/creategradientstop") %>">CreateGradientStop</a></td>
                        <td>Create a gradient stop used for different types of gradients.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createimage") %>">CreateImage</a></td>
                        <td>Create an image with the parameters specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createlineargradientfill") %>">CreateLinearGradientFill</a></td>
                        <td>Create a linear gradient fill which allows to fill the object using a selected linear gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createnofill") %>">CreateNoFill</a></td>
                        <td>Create no fill and remove the fill from the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createparagraph") %>">CreateParagraph</a></td>
                        <td>Create a new paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createpatternfill") %>">CreatePatternFill</a></td>
                        <td>Create a pattern fill which allows to fill the object using a selected pattern as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createpresetcolor") %>">CreatePresetColor</a></td>
                        <td>Create a color selecting it from one of the available color presets.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createradialgradientfill") %>">CreateRadialGradientFill</a></td>
                        <td>Create a radial gradient fill which allows to fill the object using a selected radial gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/creatergbcolor") %>">CreateRGBColor</a></td>
                        <td>Create an RGB color setting the appropriate values for the red, green and blue color components.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createrun") %>">CreateRun</a></td>
                        <td>Create a new smaller text block to be inserted to the current paragraph or table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createschemecolor") %>">CreateSchemeColor</a></td>
                        <td>Create a complex color scheme selecting from one of the available schemes.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createshape") %>">CreateShape</a></td>
                        <td>Create a shape with the parameters specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createsolidfill") %>">CreateSolidFill</a></td>
                        <td>Create a solid fill which allows to fill the object using a selected solid color as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createstroke") %>">CreateStroke</a></td>
                        <td>Create a stroke adding shadows to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createtable") %>">CreateTable</a></td>
                        <td>Create a new table with a specified number of rows and columns.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/getdocument") %>">GetDocument</a></td>
                        <td>Get the main document.</td>
                    </tr>
                </tbody>
            </table>

