<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Dispose</span>
</h1>


                <h4 class="header-gray" id="CloseFile">static void Dispose();</h4>
                <p class="dscr">Unloading the <b>ONLYOFFICE Document Builder</b> from the application memory when it is no longer needed.</p>
                <div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.Dispose</em> method is not used.</div>
                
            <h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
NSDoctRenderer::CDocBuilder::Dispose();
</pre>
            