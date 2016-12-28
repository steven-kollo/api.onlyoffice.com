<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateStroke">CreateStroke(nWidth, oFill) &rarr; {<a href="<%= Url.Action(data + "/apistroke") %>">ApiStroke</a>}</h4>
<p class="dscr">
Create a stroke adding shadows to the element.
</p>
    
<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>nWidth</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td>The width of the shadow measured in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oFill</em></td>
            <td>
                <a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>
            </td>
            <td>The fill type used to create the shadow.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apistroke") %>">ApiStroke</a>
    </dd>
</dl>
