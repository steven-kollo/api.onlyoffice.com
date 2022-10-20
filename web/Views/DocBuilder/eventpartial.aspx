<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= ((DBEvent)Model).Name %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var ev = (DBEvent)Model; %>

    <h1>
        <a href="<%= Request.Path.Substring(0, Request.Path.LastIndexOf('/')) %>" class="up"></a>
       <span class="hdr"><%= ev.Name %></span>
    </h1>            

    <h4 class="header-gray" id="<%= ev.Name %>">
        <%= ev.Name %>
    </h4>

    <% if (ev.See != null) { %>
        <div class="details">
            <span><%= ev.See %></span>
        </div>
    <% } %>

    <span id="dscr" class="dscr">
        <%= ev.Description %>
    </span>

    <h2>Properties:</h2>
    <% if (ev.Properties != null && ev.Properties.Any()) { %>
    <div id="eventProps">
        <table class="table">
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Type</td>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <% foreach(var p in ev.Properties) { %>
                    <tr class="tablerow">
                        <td><em><%= p.Name %></em></td>
                        <td><%= p.Type %></td>
                        <td><%= p.Description %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </div>
    <% } %>

</asp:Content>
