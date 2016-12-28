<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="AddLineBreak">AddLineBreak()</h4>
    
<p class="dscr">
Add a line break to the current run position and start the next element from a new line.
</p>
