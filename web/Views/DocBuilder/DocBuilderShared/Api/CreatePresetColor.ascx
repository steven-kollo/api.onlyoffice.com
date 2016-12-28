<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreatePresetColor">CreatePresetColor(sPresetColor) &rarr; {<a href="<%= Url.Action(data + "/apipresetcolor") %>">ApiPresetColor</a>}</h4>
<p class="dscr">
Create a color selecting it from one of the available color presets.
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
            <td><em>sPresetColor</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#PresetColor">PresetColor</a>
            </td>
            <td>A preset selected from the list of the available color preset names.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apipresetcolor") %>">ApiPresetColor</a>
    </dd>
</dl>