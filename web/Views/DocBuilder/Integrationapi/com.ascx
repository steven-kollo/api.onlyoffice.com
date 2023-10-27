<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">COM</span>
</h1>

<p class="dscr">For the integration of <b>ONLYOFFICE Document Builder</b> into any application, the COM <b>doctrenderer</b> library is used. The current application version contains five main classes:</p>
<ul>
    <li>
        <em>CDoctrenderer</em> class - used by <b>ONLYOFFICE Document Builder</b> in the file conversion process.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/com/cdocbuilder") %>">CDocBuilder</a> class - used by <b>ONLYOFFICE Document Builder</b> for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext") %>">CDocBuilderContext</a> class -  used by <b>ONLYOFFICE Document Builder</b> for getting JS context for working.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/com/cdocbuildercontextscope") %>">CDocBuilderContextScope</a> class - the stack-allocated class which sets the execution context for all operations executed within a local scope.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue") %>">CDocBuilderValue</a> class - used by <b>ONLYOFFICE Document Builder</b> for getting the results of called JS commands.
        It represents a wrapper for a JS object.
    </li>
</ul>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>

<pre >#include &lt;iostream&gt;
#include &lt;comutil.h&gt;
#include &lt;atlcomcli.h&gt;
#include &lt;atlsafe.h&gt;

#include "../../src/docbuilder_midl.h"

#ifdef _UNICODE
# pragma comment(lib, "comsuppw.lib")
#else
# pragma comment(lib, "comsupp.lib")
#endif

#define RELEASEINTERFACE(pinterface)  \
{                                     \
    if (NULL != pinterface)           \
    {                                 \
        pinterface-&gt;Release();        \
        pinterface = NULL;            \
    }                                 \
}

int main(int argc, char *argv[])
{
	CoInitialize(NULL);

	IONLYOFFICEDocBuilder* oBuilder = NULL;
	IONLYOFFICEDocBuilderContext* oContext = NULL;
	IONLYOFFICEDocBuilderContextScope* oScope = NULL;

	IONLYOFFICEDocBuilderValue* oGlobal = NULL;
	IONLYOFFICEDocBuilderValue* oApi = NULL;
	IONLYOFFICEDocBuilderValue* oDocument = NULL;
	IONLYOFFICEDocBuilderValue* oParagraph = NULL;
	IONLYOFFICEDocBuilderValue* oContent = NULL;

	HRESULT hr = CoCreateInstance(__uuidof(CONLYOFFICEDocBuilder), NULL, CLSCTX_ALL, __uuidof(IONLYOFFICEDocBuilder), (void**)&oBuilder);

	if (FAILED(hr))
	{
		CoUninitialize();                                             \
		return 1;
	}

	VARIANT_BOOL b;

	oBuilder-&gt;Initialize();
	oBuilder-&gt;CreateFile(_bstr_t("docx"), &b);
	oBuilder-&gt;GetContext(&oContext);

	oContext-&gt;CreateScope(&oScope);
	oContext-&gt;GetGlobal(&oGlobal);

	oGlobal-&gt;GetProperty(_bstr_t("Api"), &oApi);
	oContext-&gt;CreateArray(1, &oContent);

	oApi-&gt;Call(_bstr_t("GetDocument"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &oDocument);
	oApi-&gt;Call(_bstr_t("CreateParagraph"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &oParagraph);
	oContext-&gt;CreateArray(1, &oContent);
	
	oParagraph-&gt;Call(_bstr_t("SetSpacingAfter"), ATL::CComVariant(1000), ATL::CComVariant(VARIANT_FALSE), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), NULL);
	oParagraph-&gt;Call(_bstr_t("AddText"), ATL::CComVariant("Hello from COM!"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), NULL);
	oContent-&gt;Set(0, oParagraph);

	oDocument-&gt;Call(_bstr_t("InsertContent"), ATL::CComVariant(oContent), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), NULL);

	oBuilder-&gt;SaveFile(_bstr_t("docx"), _bstr_t("result.docx"), &b);

	RELEASEINTERFACE(oContent);

	IONLYOFFICEDocBuilderValue* oArr = NULL;
	CComSafeArray&lt;BYTE&gt; arr;
	arr.Add(1);
	oContext-&gt;CreateTypedArray(ATL::CComVariant(arr), 1, &oArr);

	oBuilder-&gt;CloseFile();
	oBuilder-&gt;Dispose();

	RELEASEINTERFACE(oBuilder);
	RELEASEINTERFACE(oContext);
	RELEASEINTERFACE(oScope);

	RELEASEINTERFACE(oGlobal);
	RELEASEINTERFACE(oApi);
	RELEASEINTERFACE(oDocument);
	RELEASEINTERFACE(oParagraph);
	RELEASEINTERFACE(oContent);

	CoUninitialize();
	return 0;
}</pre>

<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.SetTmpFolder("DocBuilderTemp");
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingAfter(1000, false);
oParagraph.AddText("Hello from COM!");
oDocument.InsertContent([oParagraph]);
builder.SaveFile("docx", "result.docx");
builder.CloseFile();</pre>
