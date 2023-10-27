<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateInstance</span>
</h1>

<h4 class="header-gray" id="CreateInstance">HRESULT CreateInstance();</h4>
<p class="dscr">Creates an instance of the <em>CDocBuilder</em> class.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.CreateInstance</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;CreateInstance();
oBuilder-&gt;Dispose();
</pre>
