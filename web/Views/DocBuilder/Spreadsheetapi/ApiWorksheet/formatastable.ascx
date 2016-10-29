<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">FormatAsTable</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.FormatAsTable("A1:E10");
builder.SaveFile("xlsx", "FormatAsTable.xlsx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>