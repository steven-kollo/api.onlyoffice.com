<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Hosted Solution API Methods
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
                <td><a href="<%= Url.Action("portalget") %>">Get portals</a></td>
                <td><a href="<%= Url.Action("portalget") %>">GET /api/portal/get</a></td>
                <td>Get the list of registered portals.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("portalregister") %>">Register portal</a></td>
                <td><a href="<%= Url.Action("portalregister") %>">POST /api/portal/register</a></td>
                <td>Checks if the name is available to create a portal.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("portalremove") %>">Portal deletion</a></td>
                <td><a href="<%= Url.Action("portalremove") %>">DELETE /api/portal/remove</a></td>
                <td>Portal deletion.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("portalstatus") %>">Portal status</a></td>
                <td><a href="<%= Url.Action("portalstatus") %>">PUT /api/portal/status</a></td>
                <td>Portal activation status change.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("validateportalname") %>">Validate portal name</a></td>
                <td><a href="<%= Url.Action("validateportalname") %>">POST /api/portal/validateportalname</a></td>
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
                <td><a href="<%= Url.Action("tariffget") %>">Get tariff</a></td>
                <td><a href="<%= Url.Action("tariffget") %>">GET /api/tariff/get</a></td>
                <td>Portal pricing plan change.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("tariffset") %>">Set tariff</a></td>
                <td><a href="<%= Url.Action("tariffset") %>">PUT /api/tariff/set</a></td>
                <td>Portal pricing plan change.</td>
            </tr>
        </tbody>
    </table>
    <% } %>
</asp:Content>
