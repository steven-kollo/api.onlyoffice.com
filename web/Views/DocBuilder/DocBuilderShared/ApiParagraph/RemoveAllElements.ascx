<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="RemoveAllElements">RemoveAllElements()</h4>
<p class="dscr">
Remove all elements from the current paragraph.
</p>
