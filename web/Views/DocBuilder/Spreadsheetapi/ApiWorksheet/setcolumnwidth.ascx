<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetColumnWidth</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetColumnWidth(0, 10);
oWorksheet.SetColumnWidth(1, 20);
builder.SaveFile("xlsx", "SetColumnWidth.xlsx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>