<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Anonymous users
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Anonymous users</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of setting a name to an anonymous user in ONLYOFFICE Document Server.</p>
    <img alt="Anonymous" src="<%= Url.Content("~/content/img/editor/anonymous.jpg") %>" />
    <ol>
        <li>The anonymous user uses the <b>document manager</b> to open a document for viewing or editing.</li>
        <li>The <b>document storage service</b> sends the initialization config to the <b>document editor</b> using the <a href="<%= Url.Action("basic") %>">JavaScript API</a> but the user name is not specified there.</li>
        <li>The <b>document editor</b> requests the user name.</li>
        <li>The <b>document editor</b> sends the received name to the <b>document editing service</b>.</li>
        <li>The <b>document editing service</b> sends the user name to the <b>document editors</b> of all the users in the co-editing mode.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>If the anonymous user&#8217;s name is specified, it is displayed on the top toolbar.</li>
        <li>
            <p>If the user name is not specified, it will be requested. The request can be turned off with 
            the <em>"request"=false</em> value of the <a href="<%= Url.Action("config/editor/customization") %>#anonymous">editorConfig.customization.anonymous</a> parameter.</p>
            <img alt="Name request" src="<%= Url.Content("~/content/img/editor/name-request.jpg") %>" />
        </li>
        <li>
            <p>After the anonymous user&#8217;s name is set, the postfix is added to it via the <em>label</em> field of 
                the <em>editorConfig.customization.anonymous</em> parameter to distinguish guests during the coediting session. By default this postfix is <em>"Guest"</em>.</p>
            <img alt="Label" src="<%= Url.Content("~/content/img/editor/label.jpg") %>" />
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "anonymous": {
                "request": true,
                "label": "Guest"
            },
            ...
        },
        ...
    },
    ...
});
</pre>
        </li>
        <li>As soon as you set the name for the first time, it will be stored in the browser local storage. You can set it by clicking the <b>F5</b> button.</li>
        <li>To change this name, click it on the top toolbar and enter a new one in the opened window.</li>
        <li>All the users in the co-editing mode will see the new name.</li>
    </ol>

</asp:Content>
