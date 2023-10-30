<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Dispose</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT Dispose();</h4>
<p class="dscr">Unloads the <b>ONLYOFFICE Document Builder</b> from the application memory when it is no longer needed.
Generally, there is no need to dispose JS before exiting the process, it should happen automatically. It should only be used if the process needs the resources taken up by JS.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.Dispose</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;Dispose();
</pre>
