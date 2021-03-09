<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Getting started
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Getting started</span>
    </h1>

    <p>
        Once your DMS is <a href="<%= Url.Action("addingdms") %>">added</a> to the connection list, configure the DMS/Desktop Editors interaction:
    </p>

    <ul>
        <li><a href="<%= Url.Action("loginlogout") %>">log in</a> to your DMS so that it will be displayed in the <b>Connected clouds</b> list,</li>
        <li>enable <a href="<%= Url.Action("notifications") %>">notifications</a> from the desktop application,</li>
        <li>enable end-to-end <a href="<%= Url.Action("encryption") %>">encryption</a>.</li>
    </ul>

    <p>Before proceeding further, it&#8217;s highly recommended to adjust the DMS elements to be displayed when the document is opened in the desktop application.</p>
    <p>Exclude the functionality which is not related to the document manager. Hide such sections like navigation, site header and footer, etc. 
        Remove links to the third-party resources. Other pages will open in the default browser without interacting with the desktop editors.</p>
    <p>There are three ways for the desktop application to be recognized:</p>

    <ul>
        <li><em>?desktop = true</em> is added to the parameters of the server request address.</li>
        <li>Starting from version 6.1, the application adds the <em>AscDesktopEditor $version$</em> line to the <em>navigator.userAgent</em> parameter. For example, <em>AscDesktopEditor 5.6.0</em>.</li>
        <li>In JavaScript code there is also a <em>window.AscDesktopEditor</em> object whose methods can send commands and information to the app.</li>
    </ul>

</asp:Content>
