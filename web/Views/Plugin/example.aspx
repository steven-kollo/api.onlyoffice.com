<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin example
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Plugin example</span>
    </h1>

    <p class="dscr">To understand how the plugins work and how they can be written and added to document editors, please see the example of the <em>helloworld.js</em> plugin below:</p>

    <pre>
(function (window, undefined) {
    window.Asc.plugin.init = function () {
        var sScript = 'var oDocument = Api.GetDocument();';
        sScript += 'oDocument.CreateNewHistoryPoint();';
        sScript += 'oParagraph = Api.CreateParagraph();';
        sScript += 'oParagraph.AddText(\'Hello world!\');';
        sScript += 'oDocument.InsertContent([oParagraph]);';
        window.Asc.plugin.info.recalculate = true;
        this.executeCommand("close", sScript);
    };
    window.Asc.plugin.button = function (id) {
    };
})(window, undefined);
</pre>

    <p>It is the easiest plugin that will insert the 'Hello world!' phrase into your document whenever you press the plugin button.</p>

    <p>This plugin and all the other currently existing open source plugin examples are available here: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins</a>. Feel free to fork them, use them with your editors and create your own plugins.</p>

    <h2>Support</h2>
    <p>
        If you have any questions, you can ask our developers at <a href="http://dev.onlyoffice.org/viewforum.php?f=9" target="_blank">dev.onlyoffice.org</a> (registration required).
    </p>
</asp:Content>
