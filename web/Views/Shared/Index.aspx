<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Scripts.Render("~/bundles/main-page") %>
    <%= Styles.Render("~/content/main-page") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var product = Products.Get(Html.GetCurrentController().ToString().ToLower()); %>
    <div class="background-body mainBody">
        <div class="products-info">
            <h1>
                <span class="hdr title-main"><%= product.Title %></span>
            </h1>
            <div>
                <%= product.Description %>
            </div>

            <div class="product-list clearfix">
            </div>

            <div class="icon-program-block">
                <% var sections = product.Sections;
                   foreach (var section in sections)
                   {
                       var productSection = Products.Get(section); %>
                <div class="img-title-<%= productSection.Id %>">
                    <p class="name-icon-program"><a href="<%= Url.Action("basic", productSection.Id) %>"><%= productSection.Title %></a></p>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</asp:Content>
