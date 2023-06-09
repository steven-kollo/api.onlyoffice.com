﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<List<string>>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Language-specific examples
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Language-specific examples</span>
    </h1>

    <p>With ONLYOFFICE Docs, any of collaborative solutions can be enhanced with document editing and co-editing. 
        In this section, you will learn how to integrate ONLYOFFICE Docs into your own website.</p>


    <p>Each ONLYOFFICE Docs instance includes online editors for text documents, spreadsheets, presentations, and fillable forms, plus a test example.</p>
    <p>Test example is simple document management system that can be built into your application for testing. 
        The test example included by default is written on Node.js. It is disabled by default. To enable it, follow the instructions on your start screen.</p>

    <div class="note">
        The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application.
        <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!
        If you enabled any of the test examples, disable it before going for production.
    </div>

    <h2 id="security" class="copy-link">Important security info</h2>
    <p>Please keep in mind the following security aspects when you are using test examples:</p>
    <ul>
        <li>There is no protection of the storage from unauthorized access since there is no need for authorization.</li>
        <li>There are no checks against parameter substitution in links, since the parameters are generated by the code according to the pre-arranged scripts.</li>
        <li>There are no data checks in requests of saving the file after editing, since each test example is intended for requests only from ONLYOFFICE Document Server.</li>
        <li>There are no prohibitions on using test examples from other sites, since they are intended to interact with ONLYOFFICE Document Server from another domain.</li>
    </ul>

    <h2>To start integrating document editors into your own website you need to do the following:</h2>

    <ol>
        <li>
            <p>Download Document Server installation and set it up on your local server:</p>
            <div class="list-buttons">
                <a class="button" href="https://www.onlyoffice.com/developer-edition-request.aspx?from=api.onlyoffice.com" target="_blank">Get ONLYOFFICE editors
                </a>
            </div>
        </li>

        <li>
            <p>Select the programming language and download the code for the sample of online editors integration into your website:
        <% if (Model != null && Model.Count > 0)
           { %>
            </p>
            <ul class="list-buttons">
                <% foreach (var example in Model)
                   { %>
                <li>
                    <a class="button" href="<%= Url.Content("~/app_data/editor/" + example.Replace("#", "%23")) %>" target="_blank">
                        <%= example.TrimEnd(".zip".ToCharArray()) %>
                    </a>
                </li>
                <% } %>
            </ul>
            <p>
                or find source code:
        <% } %>
                <a href="https://github.com/ONLYOFFICE/document-server-integration" target="_blank">integration example</a>.
            </p>
        </li>

        <li><a href="<%= Url.Action("advanced") %>">Edit the configuration files</a> in the sample changing the default path for the one to the editors installed at step 1 and other advanced parameters available for editor configuration.</li>

        <li>In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
            And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
        </li>
    </ol>

    <p>The result should look like the demo preview below.</p>

    <h2 id="DemoPreview" class="copy-link">Demo Preview</h2>
    <table class="demo-tab-panel">
        <tr>
            <td>
                <a class="doc-editor-link active" data-documentType="word">Demo Document editor</a>
            </td>
            <td>
                <a class="doc-editor-link" data-documentType="cell">Demo Spreadsheet editor</a>
            </td>
            <td>
                <a class="doc-editor-link" data-documentType="slide">Demo Presentation editor</a>
            </td>
        </tr>
    </table>

    <div class="demo-block">
        <div id="placeholder"></div>
    </div>

    <p>
        If you have any further questions, please contact us at
        <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceholder" runat="server">

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <script type="text/javascript">
        const initDocEditor = function (documentType) {
            $.ajax({
                type: "POST",
                url: "<%= Url.Action("configcreate", null, null, Request.Url.Scheme) %>",
                data: JSON.stringify({ documentType: documentType }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (window.docEditor) {
                        window.docEditor.destroyEditor();
                    }
                    window.docEditor = new DocsAPI.DocEditor("placeholder", JSON.parse(data));
                }
            });
        }

        $(".doc-editor-link").on("click", function (event) {
            $(".demo-tab-panel").find("a").removeClass("active");
            event.target.classList.add("active");
            initDocEditor(event.target.dataset.documenttype);
        })

        initDocEditor("word");
    </script>

</asp:Content>
