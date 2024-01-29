<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Scripts.Render("~/bundles/main-page") %>
    <%= Styles.Render("~/content/main-page") %>
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
        <div class="search-box-main">
            <% Html.RenderPartial("SearchForm"); %>
        </div>

        <div class="main-items">
            <%
                var products = Products.EnabledProducts();
                foreach (var product in products)
                {
                    if (product.Parent == null)
                    {
                        Html.RenderPartial("ProductBlock", product);
                    }
                } %>
        </div>
    </div>
</asp:Content>
