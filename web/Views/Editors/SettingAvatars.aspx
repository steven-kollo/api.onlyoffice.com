<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Setting avatars
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Setting avatars</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of setting the avatars for the users in ONLYOFFICE Docs.</p>
    <img alt="Avatars" src="<%= Url.Content("~/content/img/editor/avatars.png") %>" />
    <ol>
        <li>The user sends a request to get a list of users and set their avatars in the <b>document editor</b>.</li>
        <li>The <b>document editor</b> informs the <b>document manager</b> about the request.</li>
        <li>The <b>document manager</b> sends the list of users to the <b>document editor</b> where their avatars will be displayed.</li>
        <li>The user opens the comments or a list of the co-editors in the <b>document editor</b> where the users' avatars are displayed near their names.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an empty <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>
            <p>To set the current user avatar, use the <a href="<%= Url.Action("config/editor") %>#user">editorConfig.user.image</a> field of the initialization config:</p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "user": {
            "group": "Group1",
            "id": "78e1e841",
            "image": "https://example.com/url-to-user-avatar.png",
            "name": "John Smith"
        }
    },
});
</pre>
        </li>
        <li>
            <p>
                In the configuration script for Document Editor initialization, specify the event handler for setting the users' avatars.
                When the user opens the comments or a list of the co-editors, the <a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a> event is called
                with the <em>data.id</em> parameter. The <em>data.c</em> parameter with the <em>info</em> operation type is also passed in this event.
            </p>
            <div class="img-block-2">
                <div>
                    <img class="screenshot" alt="iOS error" src="<%= Url.Content("~/content/img/editor/avatars-comments.png") %>" />
                </div>
                <div>
                    <img class="screenshot" alt="iOS managing" src="<%= Url.Content("~/content/img/editor/avatars-coediting.png") %>" />
                </div>
            </div>
            <pre>
var onRequestUsers = function (event) {
    var c = event.data.c;
    var id = event.data.id;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestUsers": onRequestUsers,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                In order to set the users' avatars, the <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method must be called:
            </p>
            <pre>
docEditor.setUsers({
    "c": "info",
    "users": [
        {
            "email": "john@example.com",
            "id": "78e1e841",
            "image": "https://example.com/url-to-user-avatar1.png",
            "name": "John Smith"
        },
        {
            "email": "kate@example.com",
            "id": "F89d8069ba2b",
            "image": "https://example.com/url-to-user-avatar2.png",
            "name": "Kate Cage"
        },
        ...
    ]
});
</pre>
            <p>
                Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
            </p>
        </li>
    </ol>

</asp:Content>
