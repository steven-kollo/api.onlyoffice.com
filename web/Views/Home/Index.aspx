<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html" %>

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
                    <div class="qa-block-question selected"><a class="qa-question-link">Where to start?</a></div>
                    <div class="qa-block-question"><a class="qa-question-link">How to find out the current version number of Document Server?</a></div>
                    <div class="qa-block-question"><a class="qa-question-link">How to limit access to my DocumentServer (JWT signature)?</a></div>
                    <div class="qa-block-question"><a class="qa-question-link">What's the difference between sending the token in header and in body?</a></div>
                    <div class="qa-block-question"><a class="qa-question-link">How to open a document with "track changes" mode enabled?</a></div>
                    <div class="qa-more-questions"><a class="qa-more-questions-link">More questions...</a></div>
                </div>
                <div class="qa-block qa-answers">
                    <div class="qa-block-answer active">ONLYOFFICE Document Server API is used to let the developers integrate the ONLYOFFICE Document/Spreadsheet/Presentation Editors into their own web sites and setup and manage the editors. The API JavaScript file can normally be found in the following editors folder... <a class="qa-read-more" href="">Read more</a></div>
                    <div class="qa-block-answer" style="display: none;">Use the 'c' command to receive the current version number of Document Server... <a class="qa-read-more" href="">Read more</a></div>
                    <div class="qa-block-answer" style="display: none;">ONLYOFFICE Document Server uses tokens generated using the JSON Web Tokens standard. For the validation setup it is necessary to edit the configuration file which can be found at the following path... <a class="qa-read-more" href="">Read more</a></div>
                    <div class="qa-block-answer" style="display: none;">When performing the HTTP requests from ONLYOFFICE Document Server an authorization header with the token is added to validate the request. When performing the HTTP requests to ONLYOFFICE Document Server an authorization header with the token must be added to validate the request... <a class="qa-read-more" href="">Read more</a></div>
                    <div class="qa-block-answer" style="display: none;">In case the reviewing permission is set to "true" the document status bar will contain the Review menu option; the document review will only be available for the document editor if the mode parameter is set to edit. The default value coincides with the value of the edit parameter... <a class="qa-read-more" href="">Read more</a></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
