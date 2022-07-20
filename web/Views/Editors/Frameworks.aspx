<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ready-to-use connectors
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Ready-to-use frameworks</span>
    </h1>

    <p class="dscr">
        ONLYOFFICE Docs can be integrated ...
    </p>

    <p>Currently, the following frameworks are available:</p>
    <ul>
        <li><a href="<%= Url.Action("react") %>">React</a></li>
    </ul>

    <br />
    <p>
        If you have any further questions, please contact us at
        <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
    </p>

</asp:Content>
