<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Get</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT Get([in] long index, [out, retval] I_DOCBUILDER_VALUE** result);</h4>
<p class="dscr">Returns an array value by its index.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.Get</em> method is not used.</div>

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
            <td><em>index</em></td>
            <td>long</td>
            <td>The index of the array value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>result</em></td>
            <td>I_DOCBUILDER_VALUE**</td>
            <td>The returned array value.</td>
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
IONLYOFFICEDocBuilderValue* oDocument = NULL;
IONLYOFFICEDocBuilderValue* aCharts = NULL;
IONLYOFFICEDocBuilderValue* oChart = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;GetContext(&oContext);
oContext-&gt;GetGlobal(&oGlobal);
oGlobal-&gt;GetProperty(_bstr_t("Api"), &oApi);
oApi-&gt;Call(_bstr_t("GetDocument"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &oDocument);
oDocument-&gt;Call(_bstr_t("GetAllCharts"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &aCharts);
aCharts-&gt;Get(1, &oChart);
oBuilder-&gt;Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
var oDocument = Api.GetDocument();
var aCharts = oDocument.GetAllCharts();
var oChart = aCharts[1];
</pre>
