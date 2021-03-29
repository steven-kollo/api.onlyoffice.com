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

    <ol>
        <li>
            <p><b>Visual/non-visual</b> (marked with the <em>isVisual</em> flag in the <em>config.json</em>):</p>
            <ul>
                <li>
                    <p><em>Visual plugins</em> (<em>"isVisual": true</em>) open a window or a panel for some action, like 
                        <a href="https://github.com/ONLYOFFICE/plugin-highlightcode" target="_blank">Highlight code</a>, 
                        <a href="https://github.com/ONLYOFFICE/plugin-photoeditor" target="_blank">Photo editor</a>, 
                        <a href="https://github.com/ONLYOFFICE/plugin-ocr" target="_blank">OCR</a>.</p>
                </li>
                <li>
                    <p><em>Non-visual plugins</em> (<em>"isVisual": false</em>) provide a button (or buttons) to apply some transformations or manipulations to the document, 
                        like <a href="https://github.com/ONLYOFFICE/plugin-speech" target="_blank">Speech</a>, 
                        <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld" target="_blank">Hello world</a>, 
                        <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/num2word" target="_blank">Num2Word</a>.</p>
                </li>
                <li>
                    <p><em>An input helper</em> (<em>"events": ["onInputHelperClear", "onInputHelperInput"]</em>) plugin is a combo of both visual and non-visual plugins, 
                        like <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_autocomplete" target="_blank">Autocomplete</a>. 
                        It has its own window that appears and disappears when you type text. Its location is tied to the cursor.</p>
                </li>
            </ul>
        </li>

        <li>
            <p><b>System/non-system</b> (marked with the <em>isSystem</em> flag in the <em>config.json</em>):</p>
            <ul>
                <li>
                    <p><em>Non-system plugins</em> (not marked in the <em>config.json</em>) start upon clicking the corresponding button, 
                        like <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/clippy" target="_blank">Clippy</a>, 
                        <a href="https://github.com/ONLYOFFICE/plugin-thesaurus" target="_blank">Thesaurus</a>, 
                        <a href="https://github.com/ONLYOFFICE/plugin-translator" target="_blank">Translator</a>.</p>
                </li>
                <li>
                    <p><em>System plugins</em> (<em>"isSystem": true</em>) plugins work in the background as long as the editors are launched, 
                        like <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/settings" target="_blank">Settings</a>, 
                        <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/searchAndReplaceOnStart" target="_blank">Search and replace on start</a>. 
                        You don&#8217;t need to start them.</p>
                </li>
            </ul>
        </li>
        <li>
            <p><b>Editor enhancement/UI enhancement/third-party service plugins</b>:</p>
            <ul>
                <li>
                    <p><em>Editor enhancement plugins</em> extend the editor functionality and enhance the existing user experience, 
                        like <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_search_replace" target="_blank">Search and replace</a>, 
                        <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_add_comment_in_cell" target="_blank">Add comment in cell</a>, 
                        <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_move_cursor" target="_blank">Move cursor</a>.</p>
                </li>
                <li>
                    <p><em>UI enhancement plugins</em> add custom components and controls to the UI, 
                        like <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/develop/trackchanges" target="_blank">Trackchanges</a>, 
                        <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/develop/trackchanges_off" target="_blank">Trackchanges off</a>.</p>
                </li>
                <li>
                    <p><em>Third-party service plugins</em> connect third-party services to the editors, 
                        like <a href="https://github.com/ONLYOFFICE/plugin-typograf" target="_blank">Typograf</a>, 
                        <a href="https://github.com/ONLYOFFICE/plugin-zotero" target="_blank">Zotero</a>, 
                        <a href="https://github.com/ONLYOFFICE/plugin-telegram" target="_blank">Telegram</a>.</p>
                </li>
            </ul>
        </li>

        <li>
            <p><b>OLE object</b> (marked as <em>"initDataType": "ole"</em> flag in the <em>config.json</em>):</p>
            <ul>
                <li>
                    <p>In addition to simple document manipulation or editing, the plugin can embed an <em>OLE object</em> which allows a third-party developer to access the document format, 
                        i.e. save information from external resources to the resulting file.</p>
                    <p>For example, the <a href="https://github.com/ONLYOFFICE/plugin-youtube" target="_blank">YouTube</a> plugin embeds YouTube videos into your document 
                        and the <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/chess" target="_blank">Chess</a> plugin embeds a chess board.</p>
                </li>
            </ul>
        </li>   
    </ol>

</asp:Content>
