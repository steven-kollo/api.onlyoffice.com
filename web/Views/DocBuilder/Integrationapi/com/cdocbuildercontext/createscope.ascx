<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateScope</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT CreateScope([out, retval] I_DOCBUILDER_CONTEXT_SCOPE** result);</h4>
<p class="dscr">Creates a <a href="<%= Url.Action("integrationapi/com/cdocbuildercontextscope") %>">context scope</a> which sets the execution context for all operations executed within a local scope.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderContext.CreateScope</em> method is not used.</div>

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
            <td>I_DOCBUILDER_CONTEXT_SCOPE**</td>
            <td>The returned context scope.</td>
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
IONLYOFFICEDocBuilderContextScope* oScope = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;GetContext(&oContext);
oContext-&gt;CreateScope(&oScope);
oBuilder-&gt;Dispose();
</pre>
