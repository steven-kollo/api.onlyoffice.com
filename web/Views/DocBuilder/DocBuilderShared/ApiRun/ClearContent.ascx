<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="ClearContent">ClearContent()</h4>
<p class="dscr">
Remove all content from the current run.
</p>
