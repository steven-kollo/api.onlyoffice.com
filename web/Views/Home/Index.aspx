<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Scripts.Render("~/bundles/main-page") %>
    <%= Styles.Render("~/content/styles/main-page") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Welcome
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="background-body mainBody">
        <div class="products-info">
            <h1>
                <span class="hdr title-main">Welcome to ONLYOFFICE API</span>
            </h1>
        </div>

        <div class="product-list clearfix">
        </div>

        <div class="icon-program-block">
            <% var products = Products.EnabledProducts();
               foreach (var product in products)
               { %>
            <div class="img-title-<%= product.Id %>">
                <p class="name-icon-program"><a href="<%= Url.Action("basic", product.Id) %>"><%= product.Title %></a></p>
            </div>
            <% } %>
        </div>

        <% foreach (var product in products)
           {
        %>
            <% Html.RenderPartial("ProductBlock", product); %>
        <% } %>

        <div id="body-block" class="body-block">
            <div class="ip_main_part col_1">
            </div>
            <div class="ip_main_part col_2">
            </div>
        </div>
    </div>

</asp:Content>
