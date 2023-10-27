<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ToDouble</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT ToDouble([out, retval] double* result);</h4>
<p class="dscr">Converts the <b>CDocBuilderValue</b> object to a double value.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.ToDouble</em> method is not used.</div>

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
            <td>double*</td>
            <td>The returned double value.</td>
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
double dbl;
oBuilder-&gt;Initialize();
oBuilder-&gt;GetContext(&oContext);
oContext-&gt;GetGlobal(&oGlobal);
oGlobal-&gt;ToDouble(&dbl);
oBuilder-&gt;Dispose();
</pre>
