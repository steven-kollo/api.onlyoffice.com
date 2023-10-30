<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">IsSaveWithDoctrendererMode</span>
</h1>

<h4 class="header-gray" id="CreateFile">HRESULT IsSaveWithDoctrendererMode([out, retval] VARIANT_BOOL* result);</h4>
<p class="dscr">Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.IsSaveWithDoctrendererMode</em> method is not used.</div>

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
            <td>VARIANT_BOOL*</td>
            <td>Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder-&gt;Initialize();
oBuilder-&gt;IsSaveWithDoctrendererMode(&b);
oBuilder-&gt;Dispose();
</pre>
