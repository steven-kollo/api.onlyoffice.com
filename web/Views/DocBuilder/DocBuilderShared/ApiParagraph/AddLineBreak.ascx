<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="AddLineBreak">AddLineBreak() &rarr; {<a href="<%= Url.Action(data + "/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">
Add line break to the current position and start the next element from a new line.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apirun") %>">ApiRun</a>
    </dd>
</dl>
