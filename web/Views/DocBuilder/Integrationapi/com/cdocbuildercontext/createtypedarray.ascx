<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateTypedArray</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT CreateTypedArray([in] VARIANT buffer, [in] long length, [out, retval] I_DOCBUILDER_VALUE** result);</h4>
<p class="dscr">Creates a Uint8Array value, an analogue of <em>Uint8Array</em> in JS.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderContext.CreateTypedArray</em> method is not used.</div>

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
            <td><em>buffer</em></td>
            <td>VARIANT</td>
            <td>The array buffer.</td>
        </tr>
        <tr class="tablerow">
            <td><em>length</em></td>
            <td>long</td>
            <td>The array length.</td>
        </tr>
        <tr class="tablerow">
            <td><em>result</em></td>
            <td>I_DOCBUILDER_VALUE**</td>
            <td>The returned typed array.</td>
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
IONLYOFFICEDocBuilderValue* oArr = NULL;
CComSafeArray&lt;BYTE&gt; arr;
arr.Add(1);
oBuilder-&gt;Initialize();
oBuilder-&gt;GetContext(&oContext);
oContext-&gt;CreateTypedArray(ATL::CComVariant(arr), 1, &oArr);
oBuilder-&gt;Dispose();
</pre>
