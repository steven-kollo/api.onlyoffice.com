<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetAlignVertical</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var sRange = oWorksheet.GetRange("A1:D5");
oWorksheet.GetRange('A2').SetValue('2'); 
sRange.SetAlignVertical("top");
builder.SaveFile("xlsx", "SetAlignVertical.xlsx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>