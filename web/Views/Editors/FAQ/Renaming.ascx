<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ONLYOFFICE Docs FAQ: <br />
        Renaming questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="renaming_1">
    <dt>How to rename the created document?</dt>
    <dd>
        <p>Please see the <a href="<%= Url.Action("rename") %>">Renaming file</a> section to find out how file renaming works in ONLYOFFICE Docs and what is needed to rename the created document.</p>
    </dd>
</dl>
<dl class="faq_block" id="renaming_2">
    <dt>How to update the name of the document for all collaborative editors?</dt>
    <dd>
        <p>To do that the <a href="<%= Url.Action("command/meta") %>">meta</a> option is available. The request must be sent to the <a href="<%= Url.Action("command") %>">document command service</a>, using the <em>meta</em> value for the <em>c</em> parameter:</p>
        <pre>
{
    "c": "meta",
    "key": "Khirz6zTPdfd7",
    "meta": {
        "title": "Example Document Title.docx"
    }
}
</pre>
    </dd>
</dl>
