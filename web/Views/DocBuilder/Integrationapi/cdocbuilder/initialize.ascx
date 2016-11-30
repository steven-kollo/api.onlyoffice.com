<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Initialize</span>
</h1>


                <h4 class="header-gray" id="CloseFile">static void Initialize();</h4>                
                    <p class="dscr">Initializing the <b>ONLYOFFICE Document Builder</b> as a library for the application to be able to work with it.</p>
                    <div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.Initialize</em> method is not used.</div>
                

            <h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
NSDoctRenderer::CDocBuilder::Dispose();
</pre>