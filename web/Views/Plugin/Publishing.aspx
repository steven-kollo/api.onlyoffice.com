<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Publishing plugins
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Publishing plugins</span>
    </h1>

    <p>If you want your plugin to be available to other users in the <b>ONLYOFFICE Plugin Marketplace</b>, suggest it for publishing:</p>
    <ol>
        <li>Create a fork of the <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io</a> repository.</li>
        <li>Add your plugin to this fork.</li>
        <li>Create a <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/pulls" target="_blank">pull request</a> from your fork to <em>https://github.com/ONLYOFFICE/onlyoffice.github.io</em>.
            You can use the <b>Submit your own plugin</b> button in the Plugin Manager window.</li>
        <li>If your plugin works properly, your pull request will be approved and the plugin will appear in the marketplace.</li>
    </ol>

</asp:Content>