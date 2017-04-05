<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Introduction
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Introduction</span>
    </h1>

    <div class="video-link" title="Show video">
        <img src="<%= Url.Content("~/content/img/video/plugin.png") %>" alt="Show video" />

        <div class="popap-dialog">
            <div class="popap-container">
                <div class="popap-header">Document Server Plugins</div>
                <iframe src="https://www.youtube.com/embed/n_s5Tg6_ov0?wmode=transparent" class="video-frame" frameborder="0" allowfullscreen></iframe>
                <a class="button-close button">Close</a>
            </div>
            <div class="button-close popap-close" title="Close">&times;</div>
        </div>
    </div>

    <p class="dscr">The new version of Document Server and desktop document editors introduced support for plugins: both visual and non-visual. These plugins can be used for the developers to add specific functions to the editors which are not directly related to the OOXML format. This is a first version which provides the developers with some API for the interaction with the document editors.</p>

    <p>The plugins can be both visual and non-visual. The visual plugins will open a window for some action, or introduce some additions to the editor panel interface. The non-visual plugins will provide a button (or buttons) which is going to apply some transformations or manipulations to the document.</p>

    <p>In addition to a simple document manipulation or editing of document contents the plugin can embed an OLE object. This is the only way which allows a third-party developer to access the document format, i.e. write own information not only while working with the editor, but to save it to the resulting file.</p>

    <p>The plugins can be added to any document editor (text document, spreadsheet or presentation). Please see the sections below to find out what the plugin contents must be and how it is added to the editors:</p>

    <ul>
        <li><a href="<%= Url.Action("structure") %>">Plugin structure</a></li>
        <li><a href="<%= Url.Action("installation") %>">Plugin installation</a></li>
    </ul>

    <p>All the currently existing open source plugin examples are available here: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins</a>. Feel free to fork them, use them with your editors and create your own plugins.</p>

    <h2>Support</h2>
    <p>
        You can ask our developers at <a href="http://dev.onlyoffice.org/viewforum.php?f=9" target="_blank">dev.onlyoffice.org</a> (registration required).
    </p>
</asp:Content>
