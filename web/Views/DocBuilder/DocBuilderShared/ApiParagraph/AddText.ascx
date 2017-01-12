<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="AddText">AddText(sText<sub>opt</sub>) &rarr; {<a href="<%= Url.Action(data + "/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">
Add some text to the element.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Default</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sText</em></td>
            <td>
                <em>string</em>
            </td>
            <td>&lt;optional><br>
            </td>
            <td>""
            </td>
            <td>The text that we want to insert into the current document element.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apirun") %>">ApiRun</a>
    </dd>
</dl>
