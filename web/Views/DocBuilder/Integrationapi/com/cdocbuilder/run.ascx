<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Run</span>
</h1>

<h4 class="header-gray" id="Run">HRESULT Run([in] BSTR path, [out, retval] VARIANT_BOOL* result);</h4>
<p class="dscr">Runs the <b>ONLYOFFICE Document Builder</b> executable. If you do not want to write an application, you can simply use the <b>docbuilder.exe</b> executable file
and run it with the <b>.docbuilder</b> file as an argument, where all the code for the document file creation will be written.
For COM, create the <em>CDocBuilder</em> object and call the <em>Run</em> method with the path to the executable file from the <em>path</em> parameter.</p>

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
            <td><em>path</em></td>
            <td>BSTR</td>
            <td>The path to the <b>ONLYOFFICE Document Builder</b> executable.</td>
        </tr>
        <tr class="tablerow">
            <td><em>result</em></td>
            <td>VARIANT_BOOL*</td>
            <td>Specifies if the operation of running the executable is successful or not.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder-&gt;Initialize();
oBuilder-&gt;Run("path-to-script.docbuilder", &b);
oBuilder-&gt;Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
docbuilder.exe mydocument.docbuilder
</pre>
