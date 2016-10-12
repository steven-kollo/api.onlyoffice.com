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
                <td><%= Html.ActionLink("Get portals", "portalget") %></td>
                <td><%= Html.ActionLink("GET /api/portal/get", "portalget") %></td>
                <td>Get the list of registered portals.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Register portal", "portalregister") %></td>
                <td><%= Html.ActionLink("POST /api/portal/register", "portalregister") %></td>
                <td>Checks if the name is available to create a portal.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Portal deletion", "portalremove") %></td>
                <td><%= Html.ActionLink("DELETE /api/portal/remove", "portalremove") %></td>
                <td>Portal deletion.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Status portal", "portalstatus") %></td>
                <td><%= Html.ActionLink("PUT /api/portal/status", "portalstatus") %></td>
                <td>Portal activation status change.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Validate portal name", "validateportalname") %></td>
                <td><%= Html.ActionLink("POST /api/portal/validateportalname", "validateportalname") %></td>
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
                <td><%= Html.ActionLink("Get tariff", "tariffget") %></td>
                <td><%= Html.ActionLink("GET /api/tariff/get", "tariffget") %></td>
                <td>Portal pricing plan change.</td>
            </tr>
            <tr class="tablerow">
                <td><%= Html.ActionLink("Set tariff", "tariffset") %></td>
                <td><%= Html.ActionLink("PUT /api/tariff/set", "tariffset") %></td>
                <td>Portal pricing plan change.</td>
            </tr>
        </tbody>
    </table>
    <% } %>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>
