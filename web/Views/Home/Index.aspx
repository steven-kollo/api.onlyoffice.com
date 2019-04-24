<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html" %>
<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Scripts.Render("~/bundles/faq") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Welcome
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="products-info">
        <h1>
            <span class="hdr">Welcome to ONLYOFFICE API</span>
        </h1>
        <p>
            ONLYOFFICE API describes the main methods that allow you to interact with different ONLYOFFICE components.
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
    <div class="main-page main-faq-section">
        <h2>Frequently Asked Questions</h2>
        <div class="qa-blocks-wrapper">
            <div class="qa-blocks">
                <div class="qa-block qa-questions">
                    <div class="qa-block-question selected"><a class="qa-question-link">I am new to Document Server API. Where should I start?</a></div>
                    <div class="qa-block-question"><a class="qa-question-link">How to find out the current version number of Document Server?</a></div>
                    <div class="qa-block-question"><a class="qa-question-link">How can I change some Document Server parameters?</a></div>
                    <div class="qa-block-question"><a class="qa-question-link">How to limit access to my Document Server?</a></div>
                    <div class="qa-block-question"><a class="qa-question-link">What's the difference between sending the token in header and in body?</a></div>
                    <div class="qa-more-questions"><a class="qa-more-questions-link" href="<%= Url.Action("faq", "editors") %>">More questions...</a></div>
                </div>
                <div class="qa-block qa-answers">
                    <div class="qa-block-answer active">If you do not know where to start with Document Server API, we suggest that you first read the Basic concepts and How it works sections to have better understanding of how Document Server API is built. Once you are familiar with the main concepts, you can visit the Try now section to see the live examples of the main Document Server features in action... <a class="qa-read-more" href="<%= Url.Action("faq/general", "editors") %>#general_1">Read more</a></div>
                    <div class="qa-block-answer" style="display: none;">The current Document Server version number can be found at the About page of the Document, Presentation or Spreadsheet Editor, right below the logo and the editor name. You can use the API to send a POST request to the document command service. Use the c parameter for that with the version value, which is sent as a JSON object in the request body... <a class="qa-read-more" href="<%= Url.Action("faq/general", "editors") %>#general_2">Read more</a></div>
                    <div class="qa-block-answer" style="display: none;">All the main settings for Document Sever are stored in the default.json configuration file which is available in the /etc/onlyoffice/documentserver/ folder (for Linux) or %ProgramFiles%\ONLYOFFICE\DocumentServer\config\ (for Windows). There is also the platform-specific production.json file in the same folder... <a class="qa-read-more" href="<%= Url.Action("faq/general", "editors") %>#general_3">Read more</a></div>
                    <div class="qa-block-answer" style="display: none;">To prevent an unauthorized access to your documents and the substitution of important parameters in ONLYOFFICE Document Server requests, it uses a JSON Web Token (JWT) compatible tokens to ensure security. The tokens are signed by the server key, so the client is able to verify that the token is legitimate... <a class="qa-read-more" href="<%= Url.Action("faq/security", "editors") %>#security_1">Read more</a></div>
                    <div class="qa-block-answer" style="display: none;">Starting with version 5.2 of Document Server it is possible to send token both in the request header and body. The main difference between these two methods is in the length limitation: a HTTP header has length limitation and some servers (such as some NGINX versions) do not accept the requests with the header longer than 4 kilobytes... <a class="qa-read-more" href="<%= Url.Action("faq/security", "editors") %>#security_2">Read more</a></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
