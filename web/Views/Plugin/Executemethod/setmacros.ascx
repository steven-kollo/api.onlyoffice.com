<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("SetMacros", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows setting macros to the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("SetMacros", [data]);
</pre>
<p>Where <em>data</em> is a <em>Macros</em> object containing the data about all the macros from the document in the following form (JSON):</p>
<pre>
{
    "macrosArray" : "string[]",
    "current" : number
}
</pre>
<p>The <em>Macros</em> object can have the following values:</p>
<ul>
    <li>"macrosArray" (e.g. <em>{"macrosArray": [{"name": "Macros1", "value": "{macrosCode}"}]}</em>) is an array of macros codes;</li>
    <li>"current" (e.g. <em>{"current": 1}</em>) is a current macros index.</li>
</ul>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("SetMacros", [{"macrosArray":[{"name":"Macros 1","value":"(function()\n{oDocument = Api.GetDocument();\noParagraph = Api.CreateParagraph();\noParagraph.AddText(\"This is a new paragraph\");\noDocument.Push(oParagraph);\n})();"},{"name":"Macros 2","value":"(function()\n{oDocument = Api.GetDocument();\noParagraph = oDocument.GetElement(0);\noParagraph.AddText(\"ONLYOFFICE Document Builder\");\noRange = oDocument.GetRange(0, 24);\noRange.SetBold(true);\n})();"}],"current":1}]);
</pre>
