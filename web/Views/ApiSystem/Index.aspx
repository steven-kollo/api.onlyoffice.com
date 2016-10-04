<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Partners Program API Methods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var section = Model as string; %>

    <% if (string.IsNullOrEmpty(section) || string.Equals(section, "portal"))
       { %>
    <h1>
        <span class="hdr">Portals</span>
    </h1>
    <table class="table hover">
        <colgroup>
            <col style="width: 25%" />
            <col style="width: 40%" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Method</td>
                <td>Resource</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Get portals", "portalget", null, new {@class = "underline"}) %></td>
                <td><%= Html.ActionLink("GET /api/portal/get", "portalget", null, new {@class = "underline"}) %></td>
                <td>Get the list of registered portals.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Register portal", "portalregister", null, new {@class = "underline"}) %></td>
                <td><%= Html.ActionLink("POST /api/portal/register", "portalregister", null, new {@class = "underline"}) %></td>
                <td>Checks if the name is available to create a portal.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Portal deletion", "portalremove", null, new {@class = "underline"}) %></td>
                <td><%= Html.ActionLink("DELETE /api/portal/remove", "portalremove", null, new {@class = "underline"}) %></td>
                <td>Portal deletion.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Status portal", "portalstatus", null, new {@class = "underline"}) %></td>
                <td><%= Html.ActionLink("PUT /api/portal/status", "portalstatus", null, new {@class = "underline"}) %></td>
                <td>Portal activation status change.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Validate portal name", "validateportalname", null, new {@class = "underline"}) %></td>
                <td><%= Html.ActionLink("POST /api/portal/validateportalname", "validateportalname", null, new {@class = "underline"}) %></td>
                <td>Checks if the name is available to create a portal.</td>
            </tr>
        </tbody>
    </table>
    <% }
       else if (string.IsNullOrEmpty(section) || string.Equals(section, "tariff"))
       { %>
    <h1>
        <span class="hdr">Billing</span>
    </h1>
    <table class="table hover">
        <colgroup>
            <col style="width: 25%" />
            <col style="width: 40%" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Method</td>
                <td>Resource</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Get tariff", "tariffget", null, new {@class = "underline"}) %></td>
                <td><%= Html.ActionLink("GET /api/tariff/get", "tariffget", null, new {@class = "underline"}) %></td>
                <td>Portal pricing plan change.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Set tariff", "tariffset", null, new {@class = "underline"}) %></td>
                <td><%= Html.ActionLink("PUT /api/tariff/set", "tariffset", null, new {@class = "underline"}) %></td>
                <td>Portal pricing plan change.</td>
            </tr>
        </tbody>
    </table>
    <% } %>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>
