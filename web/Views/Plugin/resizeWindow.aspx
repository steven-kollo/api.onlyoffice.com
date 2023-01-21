<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    resizeWindow
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.resizeWindow (width, height, minW, minH, maxW, maxH)</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Defines the method used to change the window size updating the minimum/maximum sizes.</p>

    <div class="note">This method is used for visual modal plugins only.</div>

    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
			<col />
			<col class="table-type" />
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
                <td>width</td>
                <td>The window width.</td>
                <td>number</td>
            </tr>
            <tr class="tablerow">
                <td>height</td>
                <td>The window height.</td>
                <td>number</td>
            </tr>
            <tr class="tablerow">
                <td>minW</td>
                <td>The window minimum width.</td>
                <td>number</td>
            </tr>
            <tr class="tablerow">
                <td>minH</td>
                <td>The window minimum height.</td>
                <td>number</td>
            </tr>
            <tr class="tablerow">
                <td>maxW</td>
                <td>The window maximum width.</td>
                <td>number</td>
            </tr>
            <tr class="tablerow">
                <td>maxH</td>
                <td>The window maximum height.</td>
                <td>number</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Example</div>

    <pre>
window.Asc.plugin.init = function() {
    this.resizeWindow(392, 147, 392, 147, 392, 147);
};
</pre>

</asp:Content>
