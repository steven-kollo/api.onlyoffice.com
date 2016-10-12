<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Button
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.button(id)</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">The buttons used with the plugin and the plugin behavior when these buttons are clicked. The method is called when any of the plugin buttons is clicked.</p>

    <div class="header-gray">Parameters</div>

    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>id</td>
                <td>The button index in the <em>"buttons"</em> array of the plugin configuration <a href="<%= Url.Action("config") %>">config.json</a> file. If <em>id == -1</em>, then the plugin considers that the plugin 'Close window' cross button has been clicked or the plugin work was somehow interrupted.</td>
                <td>number</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>

    <pre>
window.Asc.plugin.button = function (id) {
    this.executeCommand("close", '');
};
</pre>
</asp:Content>
