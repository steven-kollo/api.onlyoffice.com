<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetBullet">SetBullet(oBullet)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action(data + "/apiparapr/setbullet") %>">ApiParaPr.SetBullet</a>
                </li>
            </ul>
        </dd>
    </dl>
    
<p class="dscr">
Set the bullet or numbering to the current paragraph.
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
            <td><em>oBullet</em></td>
            <td>
                <a href="<%= Url.Action(data + "/apibullet") %>">ApiBullet</a>
            </td>
            <td>The bullet object created using either the <a href="<%= Url.Action(data + "/api/createbullet") %>">Api.CreateBullet</a> or <a href="<%= Url.Action(data + "/api/createnumbering") %>">Api.CreateNumbering</a> method.</td>
        </tr>
    </tbody>
</table>
