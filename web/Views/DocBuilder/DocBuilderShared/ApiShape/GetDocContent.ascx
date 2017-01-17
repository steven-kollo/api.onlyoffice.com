<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="GetDocContent">GetDocContent() &rarr; {<a href="<%= Url.Action(data + "/apidocumentcontent") %>">ApiDocumentContent</a>}</h4>
<p class="dscr">
Get the shape inner contents where a paragraph or text runs can be inserted.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apidocumentcontent") %>">ApiDocumentContent</a>
    </dd>
</dl>
