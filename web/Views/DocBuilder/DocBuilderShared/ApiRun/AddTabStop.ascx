<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="AddTabStop">AddTabStop()</h4>
<p class="dscr">
Add a tab stop to the current run.
</p>
