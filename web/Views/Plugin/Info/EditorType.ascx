<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("info/") %>"></a>
    <span class="hdr">window.Asc.plugin.info.editorType</span>
    <span class="comment">read-only</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Returns the type of the editor where the plugin is currently running.</p>

<p>The values are the following:</p>

<ul>
    <li><b>"word"</b> - the text document editor;</li>
    <li><b>"cell"</b> - the spreadsheet document editor;</li>
    <li><b>"slide"</b> - the presentation document editor.</li>
</ul>

<div class="header-gray">Returns</div>

<p>Type string</p>

<div class="header-gray">Example</div>

<pre>
function createScriptFromArray (aSelected) {
    var sScript = '';
    if (aSelected.length > 0) {
        switch (window.Asc.plugin.info.editorType) {
            case 'word': {
                sScript += 'var oDocument = Api.GetDocument();';
                sScript += '\noDocument.CreateNewHistoryPoint();';
                sScript += '\nvar oParagraph, oRun, arrInsertResult = [], oImage;';
                sScript += '\noDocument.InsertContent(arrInsertResult);';
                break;
            }
        }
    }
    return sScript;
}
</pre>
