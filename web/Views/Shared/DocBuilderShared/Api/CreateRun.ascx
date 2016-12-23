<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateRun">CreateRun() &rarr; {<a href="<%= Url.Action(data + "/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">
Create a new smaller text block to be inserted to the current paragraph or table.
</p>
    
<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apirun") %>">ApiRun</a>
    </dd>
</dl>