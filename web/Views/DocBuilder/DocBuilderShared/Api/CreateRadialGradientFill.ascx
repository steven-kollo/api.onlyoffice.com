<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateRadialGradientFill">CreateRadialGradientFill(aGradientStop) &rarr; {<a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>}</h4>
<p class="dscr">
Create a radial gradient fill which allows to fill the object using a selected radial gradient as the object background.
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
            <td><em>aGradientStop</em></td>
            <td>
                <em>Array</em>
            </td>
            <td>The array of gradient color stops measured in 1000th of percent.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>
    </dd>
</dl>