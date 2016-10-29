<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiRange</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('B1').SetValue('2');
oWorksheet.GetRange('B2').SetValue('2');
oWorksheet.GetRange('A3').SetValue('2x2=');
oWorksheet.GetRange('B3').SetValue('=B1*B2');
builder.SaveFile("xlsx", "ApiRange.xlsx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>