<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetContext</span>
</h1>

<h4 class="header-gray" id="CreateFile">HRESULT GetContext([out, retval] I_DOCBUILDER_CONTEXT** result);</h4>
<p class="dscr">Returns the current JS <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext") %>">context</a>.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.GetContext</em> method is not used.</div>

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
            <td>I_DOCBUILDER_CONTEXT**</td>
            <td>The returned JS context.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
oBuilder-&gt;GetContext(&oContext);
oBuilder-&gt;Dispose();
</pre>
