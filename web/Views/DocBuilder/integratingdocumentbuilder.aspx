<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
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
            <a href="http://www.onlyoffice.com/document-builder.aspx" class="button" target="blank">Download</a>
        </li>
        <li>
            <p>Select the programming language and download the code for the sample of <b>ONLYOFFICE Document Builder</b> integration into your application</p>

            <div class="docbuilder_examples_list">
                <ul class="docbuilder_examples_blocks">
                    <li>
                        <a class="button" href="<%= Url.Content("~/app_data/rails-docbuilder-example-master.zip") %>">Ruby example</a>
                        <a class="db_examples" target="_blank" href="<%= Url.Action("rubyexample") %>">Read instructions</a>
                    </li>
                    <li>
                        <a class="button" href="<%= Url.Content("~/app_data/docbuilder-net-mvc-example.zip") %>">.Net (C# MVC) example</a>
                        <a class="db_examples" target="_blank" href="<%= Url.Action("csharpexample") %>">Read instructions</a>
                    </li>
                    <li>
                        <a class="button" href="<%= Url.Content("~/app_data/docbuilder-net-asp-example.zip") %>">.Net (C#) example</a>
                        <a class="db_examples" target="_blank" href="<%= Url.Action("csharpexample") %>">Read instructions</a>
                    </li>
                </ul>
            </div>
        </li>
        <li>
            <p>Run the example on your computer to get acquainted with the basic <b>ONLYOFFICE Document Builder</b> features before you start creating your own application. If everything is alright you will see the example website page with the form elements like the ones below.</p>
        </li>
    </ol>
    <p>Or you can try and write the application yourself using the <a href="<%= Url.Action("integrationapi/cdocbuilder") %>">integration API documentation</a>.</p>

    <%
        if (!string.IsNullOrEmpty(DocBuilderHelper.BuilderPath))
        {
            Html.RenderPartial("DocBuilderShared/DocBuilderAction");
        }
    %>
</asp:Content>
