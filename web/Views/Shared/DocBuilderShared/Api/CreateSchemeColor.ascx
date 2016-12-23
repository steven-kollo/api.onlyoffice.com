<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateSchemeColor">CreateSchemeColor(sSchemeColorId) &rarr; {<a href="<%= Url.Action(data + "/apischemecolor") %>">ApiSchemeColor</a>}</h4>
<p class="dscr">
Create a complex color scheme selecting from one of the available schemes.
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
            <td><em>sSchemeColorId</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#SchemeColorId">SchemeColorId</a>
            </td>
            <td>The solor scheme identifier.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apischemecolor") %>">ApiSchemeColor</a>
    </dd>
</dl>