<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Welcome
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="products">
        <div class="products-info">
            <h1>
                <span class="hdr">Welcome to onlyoffice api</span>
            </h1>
            <p>
                ONLYOFFICE™ API describes the main methods that allow you to interact with different ONLYOFFICE™ components.
                <br />
                Please select the necessary section below to learn more about which API methods are available for it.
            </p>
        </div>

        <div class="product-list clearfix">
            <% var products = Products.EnabledProducts();
               foreach (var product in products)
               { %>
            <div class="product">
                <a href="<%= Url.Action("basic", product.Id) %>">
                    <img src="<%= Url.Content("~/content/img/" + product.Id + ".png") %>" alt="<%= product.Title %>">
                    <%= product.Title %>
                </a>
            </div>
            <% } %>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>
