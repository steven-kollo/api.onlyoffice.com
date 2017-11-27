<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<List<string>>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Integrating ONLYOFFICE Document Builder into your own application
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Integrating ONLYOFFICE Document Builder into your own application</span>
    </h1>

    <p class="dscr">To start integrating <b>ONLYOFFICE Document Builder</b> into your own application you need to do the following:</p>
    <ol>
        <li>
            <p>Download <b>ONLYOFFICE Document Builder</b> application and install it to your computer</p>
            <a href="https://www.onlyoffice.com/document-builder.aspx" class="button" target="blank">Download</a>
        </li>

        <% if (Model != null && Model.Count > 0)
           { %>
        <li>
            <p>Select the programming language and download the code for the sample of <b>ONLYOFFICE Document Builder</b> integration into your application</p>
            <ul class="list-buttons">
                <% foreach (var example in Model)
                   { %>
                <li>
                    <a class="button" href="<%= Url.Content("~/app_data/docbuilder/" + example.Replace("#", "%23")) %>" target="_blank">
                        <%= example.TrimEnd(".zip".ToCharArray()) %>
                    </a>
                </li>
                <% } %>
            </ul>
        </li>
        <% } %>
        <li>
            <p>Run the example on your computer to get acquainted with the basic <b>ONLYOFFICE Document Builder</b> features before you start creating your own application. If everything is alright you will see the example website page with the form elements like the ones below.</p>
        </li>
    </ol>
    <p>Or you can try and write the application yourself using the <a href="<%= Url.Action("integrationapi/cdocbuilder") %>">integration API documentation</a>.</p>

    <%
        Html.RenderPartial("DocBuilderShared/DocBuilderAction");
    %>
</asp:Content>
