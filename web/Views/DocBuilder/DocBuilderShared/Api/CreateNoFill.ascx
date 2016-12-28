<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateNoFill">CreateNoFill() &rarr; {<a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>}</h4>
<p class="dscr">
Create no fill and remove the fill from the element.
</p>
    
<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>
    </dd>
</dl>