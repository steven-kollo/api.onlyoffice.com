<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateObject</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT CreateObject([out, retval] I_DOCBUILDER_VALUE** result);</h4>
<p class="dscr">Creates an empty object, an analogue of <em>{}</em> in JS.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderContext.CreateObject</em> method is not used.</div>

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
            <td><em>result</em></td>
            <td>I_DOCBUILDER_VALUE**</td>
            <td>The returned empty object.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderValue* oContent = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;GetContext(&oContext);
oContext-&gt;CreateObject(&oContent);
oBuilder-&gt;Dispose();
</pre>
