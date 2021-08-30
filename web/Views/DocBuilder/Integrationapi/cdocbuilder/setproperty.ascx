<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetProperty</span>
</h1>



                <h4 class="header-gray" id="SetProperty">bool SetProperty(sParam, sValue);</h4>
                
                    <p class="dscr">The argument which can be trasferred to the program outside the <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method, i.e. either as an additional property when running <b>ONLYOFFICE Document Builder</b> executive file or as a part of program code, but not included into the document file script.</p>
                    <div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.SetProperty</em> method is not used explicitly, the argument itself is used instead as an additional property for the executive, see the example below.</div>
                
            <h2>Parameters:</h2>
            <div id="mobile-content"></div>
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
                        <td><em>sParam</em></td>
                        <td>const&nbsp;char*</td>
                        <td>The parameter name in UTF8 format, the value is always <em>--argument</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sValue</em></td>
                        <td>const&nbsp;char*</td>
                        <td>The parameter value in UTF8 format, which will be used in the document.</td>
                    </tr>
                </tbody>
            </table>
<p>Once added, the argument will be available as <b>Argument</b> variable with its parameter values set:</p>
<pre>
Argument.name === "ONLYOFFICE" // true
</pre>
            <h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
oBuilder.SetProperty("--argument", L"{\"name\":\"ONLYOFFICE\"}");
NSDoctRenderer::CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
docbuilder.exe "--argument={\"name\":\"ONLYOFFICE\"}" test.docbuilder
</pre>
<h2>Adding or removing fonts</h2>
<p>It is also possible to update the font list, when you either add new fonts or remove older ones. To do that the <b>check-fonts</b> variable is used:</p>
<h2>Example</h2>
<h4 class="header-gray">C++</h4>
<pre>
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
oBuilder.SetProperty("--check-fonts", L"true");
NSDoctRenderer::CDocBuilder::Dispose();
</pre>
<h4 class="header-gray">.docbuilder</h4>
<pre>
docbuilder.exe --check-fonts=true test.docbuilder
</pre>
