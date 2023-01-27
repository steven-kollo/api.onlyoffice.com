<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetMacros", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the document macros.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetMacros");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the <em>Macros</em> object containing the data about all the macros from the document in the following form (JSON):</p>
<pre>
{
    "macrosArray" : array,
    "current" : number
}
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>macrosArray</td>
            <td>An array of macros codes (<em>[{"name": "Macros1", "value": "{macrosCode}"}]</em>).</td>
            <td>array of objects</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td>current</td>
            <td>A current macros index.</td>
            <td>number</td>
            <td>1</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>

<pre>
{"macrosArray": [{"name": "Macros 1","value": "(function()\n{oDocument = Api.GetDocument();\noParagraph = Api.CreateParagraph();\noParagraph.AddText(\"This is a new paragraph\");\noDocument.Push(oParagraph);\n})();"},{"name": "Macros 2","value": "(function()\n{oDocument = Api.GetDocument();\noParagraph = oDocument.GetElement(0);\noParagraph.AddText(\"ONLYOFFICE Document Builder\");\noRange = oDocument.GetRange(0, 24);\noRange.SetBold(true);\n})();"}],"current": 1};
</pre>