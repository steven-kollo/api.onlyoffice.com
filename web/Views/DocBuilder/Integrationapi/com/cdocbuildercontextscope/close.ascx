<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Close</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT Close();</h4>
<p class="dscr">Closes the current scope. This method will be called automatically when the descructor is executed.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderContextScope.Close</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderContextScope* oScope = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;GetContext(&oContext);
oContext-&gt;CreateScope(&oScope);
&oScope-&gt;Close();
oBuilder-&gt;Dispose();
</pre>
