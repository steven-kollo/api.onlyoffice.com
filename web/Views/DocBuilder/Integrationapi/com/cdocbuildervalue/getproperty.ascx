<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetProperty</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT GetProperty([in] BSTR name, [out, retval] I_DOCBUILDER_VALUE** result);</h4>
<p class="dscr">Returns a property of the <b>CDocBuilderValue</b> object.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.GetProperty</em> method is not used.</div>

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
            <td><em>name</em></td>
            <td>BSTR</td>
            <td>The name of the <b>CDocBuilderValue</b> object property.</td>
        </tr>
        <tr class="tablerow">
            <td><em>result</em></td>
            <td>I_DOCBUILDER_VALUE**</td>
            <td>The returned object property.</td>
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
IONLYOFFICEDocBuilderValue* oGlobal = NULL;
IONLYOFFICEDocBuilderValue* oApi = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;GetContext(&oContext);
oContext-&gt;GetGlobal(&oGlobal);
oGlobal-&gt;GetProperty(_bstr_t("Api"), &oApi);
oBuilder-&gt;Dispose();
</pre>
