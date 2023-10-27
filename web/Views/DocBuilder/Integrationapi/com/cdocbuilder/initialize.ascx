<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Initialize</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT Initialize();</h4>
<p class="dscr">Initializes the <b>ONLYOFFICE Document Builder</b> as a library for the application to be able to work with it. 
This method just sets the directory to the main Document Builder resources (icu files, etc). If this method is not called, the Document Builder will find resources from the current process directory.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.Initialize</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;Dispose();
</pre>
