<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("info/") %>"></a>
    <span class="hdr">window.Asc.plugin.info.recalculate</span>
    <span class="comment">write</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that makes the document to recalculate its content data.</p>

<p>Force the document to recalculate its content data. If the document content is changed and recalculation is needed, <em>isRecalculate</em> must be set to <em>true</em>. It is necessary because the recalculation process is asynchronous. Moreover, some other data might need to be uploaded (e.g. a font or something else).</p>

<div class="note">When using plugins with OLE objects <em>isRecalculate</em> is not necessary as the document recalculates its data itself.</div>

<div class="header-gray">Returns</div>

<p>Type boolean</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.init = function () {
    var sScript = 'var oDocument = Api.GetDocument();';
    sScript += 'oDocument.CreateNewHistoryPoint();';
    sScript += 'oParagraph = Api.CreateParagraph();';
    sScript += 'oParagraph.AddText(\'Hello word!\');';
    sScript += 'oDocument.InsertContent([oParagraph]);';
    window.Asc.plugin.info.recalculate = true;
    this.executeCommand("close", sScript);
};
</pre>
