<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">WriteData</span>
</h1>

<h4 class="header-gray" id="CreateFile">HRESULT WriteData([in] BSTR path, [in] BSTR value, [in] VARIANT_BOOL append);</h4>
<p class="dscr">Writes data to the log file. It is used for logs in JS code.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.WriteData</em> method is not used.</div>

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
            <td>The path to the file where all the logs will be written.</td>
        </tr>
        <tr class="tablerow">
            <td><em>value</em></td>
            <td>BSTR</td>
            <td>The data which will be written to the log file.</td>
        </tr>
        <tr class="tablerow">
            <td><em>append</em></td>
            <td>VARIANT_BOOL</td>
            <td>Specifies if the new data will be appended to the already existing log file or a new file will be created.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;WriteData("result.log", "Alert!", false);
oBuilder-&gt;Dispose();
</pre>
 