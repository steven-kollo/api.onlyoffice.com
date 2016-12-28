<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="RemoveAllElements">RemoveAllElements()</h4>
<p class="dscr">
Remove all elements from the current document or from the current document element.
</p>
<div class="note">When all elements are removed, a new empty paragraph is automatically created. If you want to add content to this paragraph, use the <a href="<%= Url.Action(data + "/apidocumentcontent/getelement") %>">ApiDocumentContent.GetElement</a> method.</div>
