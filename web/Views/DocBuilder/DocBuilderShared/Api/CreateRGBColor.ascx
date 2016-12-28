<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateRGBColor">CreateRGBColor(r, g, b) &rarr; {<a href="<%= Url.Action(data + "/apirgbcolor") %>">ApiRGBColor</a>}</h4>
<p class="dscr">
Create an RGB color setting the appropriate values for the red, green and blue color components.
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
            <td><em>r</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Red color component value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>g</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Green color component value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>b</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Blue color component value.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apirgbcolor") %>">ApiRGBColor</a>
    </dd>
</dl>