<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>" %>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetHorAxisOrientation">SetHorAxisOrientation(bIsMinMax)</h4>
<p class="dscr">
    Specifies the direction of the data displayed on the horizontal axis.
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
            <td><em>bIsMinMax</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>The <b>true</b> value will set the normal data direction for the horizontal axis (from minimum to maximum). The <b>false</b> value will set the inverted data direction for the horizontal axis (from maximum to minimum).</td>
        </tr>
    </tbody>
</table>