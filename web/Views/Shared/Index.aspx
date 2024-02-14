<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Styles.Render("~/content/category-page") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var product = Products.Get(Html.GetCurrentController().ToString().ToLower()); %>
    <div class="category-section">
    <div class="category-heading">
        <h2 class="category-title"><%= product.Title %></h2>
        <p class="category-description"><%= product.Description %></p>
    </div>

    <div class="category-items">
        <% 
            var sections = product.Sections;
            foreach (var section in sections) {
                var productSection = Products.Get(section); %>
            <div class="category-item">
               <%
                  var productUrl = Url.Action(productSection.Id, product.Id, null);
                  if (product.Id == "docs")
                  {
                     productUrl = Url.Action("basic", productSection.Id, null);
                  }
                  %>
                <h4 class="category-item-title <%= product.Id %> <%: productSection.Id %>"><a href="<%= productUrl %>"><%: productSection.Title %></a></h4>
                <div class="category-item-description"><%: Html.Raw(productSection.Description) %></div>
            </div>
        <% } %>
    </div>

    <div class="help">
        <div class="help-wrapper">
            <h3 class="help-title">Get help</h3>

            <ul class="help-list">
                <li>If you have any questions about ONLYOFFICE DocSpace, try the <a href="">FAQ</a> section first.</li>
                <li>You can request a feature or report a bug by posting an issue on <a href="">GitHub</a>.</li>
                <li>You can also ask our developers on <a href="">ONLYOFFICE forum</a> (registration required).</li>
            </ul>
        </div>
        <div class="help-img"></div>
    </div>
</div>
</asp:Content>
