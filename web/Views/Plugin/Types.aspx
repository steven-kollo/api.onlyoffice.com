<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin types
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Plugin types</span>
    </h1>

    <p class="dscr">The following plugin types can be distinguished:</p>

    <ul>
        <li>
            <p><b>Visual/non-visual</b> (marked with the <em>isVisual</em> flag in the <em>config.json</em>):</p>
            <p><b>Visual plugins</b> open a window for some action, or introduce some additions to the editor panel interface.</p>
            <p><b>Highlight code</b> plugin provides a separate window where you can select the necessary language, style, background color:</p>
            <p><img alt="Highlight code" src="<%= Url.Content("~/content/img/plugins/highlight.png") %>" /></p>

            <p><b>Non-visual plugins</b> provide a button (or buttons) which applies some transformations or manipulations to the document.</p>
            <p><b>Speech</b> plugin allows converting the selected text into speech:</p>
            <p><img alt="Speech" src="<%= Url.Content("~/content/img/plugins/speech.png") %>" /></p>

            <p>One more plugin type is <b>input helper</b>, which combines both visual and non-visual plugin characteristics. 
                It has its own window that appears and disappears when you type the text. Its location is tied to the cursor.</p>
            <p><b>Autocomplete</b> plugin provides an input assistant/non-standard keyboard which allows users typing faster:</p>
            <p><img alt="Autocomplete" src="<%= Url.Content("~/content/img/plugins/autocomplete.png") %>" /></p>
        </li>

        <li>
            <p><b>System/non-system</b> (marked with the <em>isSystem</em> flag in the <em>config.json</em>):</p>
            <p>The majority of the plugins are <b>non-system</b>, i.e. they start with the click the corresponding button.</p>
            <p><b>System plugins</b> work in the background all the time the editors are launched. You don&#8217;t need to start them.</p>
            <p><b>Encryption</b> plugin in the desktop app provides AES-256 encryption algorithm that allows encrypting your files 
                and data transfer while collaborating and your private database to store and transfer the passwords:</p>
            <p><img alt="Encryption" src="<%= Url.Content("~/content/img/plugins/encryption-plugin.png") %>" /></p>
        </li>

        <li>
            <p><b>Editor enhancement/UI enhancement/third-party service plugins</b>:</p>
            <p><b>Editor enhancement plugins</b> extend the editor functionality and existing user experience.</p>
            <p><b>Count words and characters</b> plugin calculates total characters, characters without spaces, words and lines counts:</p>
            <p><img alt="Count words and characters" src="<%= Url.Content("~/content/img/plugins/count-words-and-characters.png") %>" /></p>

            <p><b>UI enhancement plugins</b> add custom components and controls in the UI.</p>

            <p><b>Third-party service plugins</b> allow connecting third-party services to the editors.</p>
            <p><b>Telegram</b> plugin connects Telegram app for instant messaging within ONLYOFFICE editors:</p>
            <p><img alt="Telegram" src="<%= Url.Content("~/content/img/plugins/telegram.png") %>" /></p>
        </li>

        <li>
            <p><b>OLE object</b> (marked as <em>"initDataType": "ole"</em> flag in the <em>config.json</em>):</p>
            <p>In addition to a simple document manipulation or editing of document contents the plugin can embed an OLE object 
                which allows a third-party developer to access the document format, i.e. save information from external resources to the resulting file.</p>
            <p><b>YouTube</b> plugin embeds YouTube videos into your document:</p>
            <p><img alt="YouTube" src="<%= Url.Content("~/content/img/plugins/YouTube.png") %>" /></p>
        </li>

</asp:Content>
