<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Developing plugins
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Developing plugins</span>
    </h1>

    <p>To develop a plugin for ONLYOFFICE editors, follow the instructions below.</p>
    <div class="container">
        <ul class="browser">
            <li class="browser tab active">Web editors</li>
            <li class="browser tab">Desktop editors</li>
        </ul>
        <div class="content active">
            <h2>For ONLYOFFICE web editors</h2>
            <ol>
                <li>Create a folder on your machine and put there the <a href="<%= Url.Action("indexhtml") %>">index.html</a> and <a href="<%= Url.Action("config") %>">config.json</a> files.</li>
                <li>
                    <p>Start distributing a folder. To do this, open the created folder and run the following commands:</p>
                    <pre>
npm install http-server -g
http-server -p &lt;port&gt; --cors
</pre>
                    <p>where <b>port</b> is the port number with ONLYOFFICE Docs installed.</p>
                    <note>CORS requests are needed so that plugin files can be loaded from any server.</note>
                </li>
                <li>
                    <p>Open the developer console in any ONLYOFFICE web editor, go to the <b>Console</b> tab, choose the <b>frameEditor</b> from the drop-down list,
                        and run the following command:</p>
                        <pre>
Asc.editor.installDeveloperPlugin("https://&lt;documentserver&gt;:&lt;port&gt;/config.json");
</pre>
                    <p>where <b>documentserver</b> is the name of the server, and <b>port</b> is the port number with the ONLYOFFICE Docs installed.</p>
                    <p>The plugin will be displayed within the <b>Plugins</b> tab. You can edit the plugin and reload it to see the changes.</p>
                </li>
            </ol>
        </div>
        <div class="content">
            <h2>For ONLYOFFICE desktop editors</h2>
            <ol>
                <li>Create a folder on your machine and put there the <a href="<%= Url.Action("indexhtml") %>">index.html</a> and <a href="<%= Url.Action("config") %>">config.json</a> files.</li>
                <li>Pack all the plugin files within the plugin folder into a <b>zip</b> archive
                    and change its extension to <em>.plugin</em> (all the plugin files and subfolders must be at the archive root).</li>
                <li>
                    <p>Install a plugin <a href="<%= Url.Action("installation/onpremises") %>#plugin-manager">through the Plugin Manager</a>.</p>
                    <p>The plugin will appear in the <em>sdkjs-plugins</em> directory. The path to the folder depends on the operating system you use:</p>
                    <ul>
                        <li>For Linux - <em>/opt/onlyoffice/desktopeditors/editors/sdkjs-plugins/</em></li>
                        <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DesktopEditors\sdkjs-plugins\</em></li>
                        <li>For Mac OS - <em>/Applications/ONLYOFFICE.app/Contents/Resources/editors/sdkjs-plugins/</em></li>
                    </ul>
                    <p>A plugin <b>GUID</b> will be used as the folder name. For example, <em>{91EAC419-EF8B-440C-A960-B451C7DF3A37}</em>.</p>
                    <p>You can edit the plugin and reload it to see the changes.</p>
                </li>
            </ol>
        </div>
    </div>

    <script type="text/javascript">
        $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
            $(this)
              .addClass('active').siblings().removeClass('active')
              .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
        });
    </script>

</asp:Content>