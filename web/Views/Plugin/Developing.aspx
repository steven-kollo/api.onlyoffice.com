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
            <li class="browser tab active" id="web">Web editors</li>
            <li class="browser tab" id="desktop">Desktop editors</li>
        </ul>
        <div id="web" class="content active">
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
                    <img alt="Developer console" class="screenshot" src="<%= Url.Content("~/content/img/plugins/developer-console.png") %>" />
                    <p>The plugin will be displayed within the <b>Plugins</b> tab. You can edit the plugin and reload it to see the changes.</p>
                </li>
            </ol>
            <h2>Debugging</h2>
            <p>To debug ONLYOFFICE plugins in the web editors, follow the instructions below.</p>
            <ol>
                <li>
                    <p>Add the <b>debugger</b> command to your script:</p>
                    <pre>
(function(window, undefined){

    var text = "Hello world!";

    window.Asc.plugin.init = function()
    {
        debugger;
        var variant = 2;

        switch (variant)
        {
            ...
        }
    };

    window.Asc.plugin.button = function(id)
    {
    };

})(window, undefined);
        </pre>
                </li>
                <li>Open the developer console by pressing the <b>F12</b> button.</li>
                <li>
                    <p>Open the <b>Plugins</b> tab and run the plugin.</p>
                    <note>Please note that the <b>debugger</b> command will only work if the development tools are open. Otherwise, the browser will ignore it.</note>
                    <img alt="Builder debugger" class="screenshot" src="<%= Url.Content("~/content/img/plugins/plugin-debugging.png") %>" />
                </li>
            </ol>
        </div>
        <div id="desktop" class="content">
            <h2>For ONLYOFFICE desktop editors</h2>
            <ol>
                <li>Create a folder on your machine and put there the <a href="<%= Url.Action("indexhtml") %>">index.html</a> and <a href="<%= Url.Action("config") %>">config.json</a> files.</li>
                <li>Pack all the plugin files within the plugin folder into a <b>zip</b> archive
                    and change its extension to <em>.plugin</em> (all the plugin files and subfolders must be at the archive root).</li>
                <li>
                    <p>Install a plugin <a href="<%= Url.Action("installation/desktop") %>#plugin-manager">through the Plugin Manager</a>.</p>
                    <p>The plugin will appear in the <em>sdkjs-plugins</em> directory. The path to the folder depends on the operating system you use:</p>
                    <ul>
                        <li>For Linux - <em>/opt/onlyoffice/desktopeditors/editors/sdkjs-plugins/</em></li>
                        <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DesktopEditors\editors\sdkjs-plugins\</em></li>
                        <li>For Mac OS - <em>/Applications/ONLYOFFICE.app/Contents/Resources/editors/sdkjs-plugins/</em></li>
                    </ul>
                    <p>A plugin <b>GUID</b> will be used as the folder name. For example, <em>{07FD8DFA-DFE0-4089-AL24-0730933CC80A}</em>.</p>
                    <img alt="Sdkjs-plugins folder" class="screenshot" src="<%= Url.Content("~/content/img/plugins/sdkjs-plugins-folder.png") %>" />
                    <p>You can edit the plugin and reload it to see the changes.</p>
                </li>
            </ol>
            <h2>Debugging</h2>
            <p>To debug ONLYOFFICE plugins in the desktop editors, use the <em>--ascdesktop-support-debug-info</em> flag.
                To do this, follow the instructions <a href="<%= Url.Action("debugging", "desktop") %>">here</a> depending on the operating system you use.</p>
            <img alt="Debug" src="<%= Url.Content("~/content/img/desktop/debugging.png") %>" />
        </div>
    </div>

    <script type="text/javascript">
        $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
            $(this)
            .addClass('active').siblings().removeClass('active')
            .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
        });
        var loc = window.location.hash;
        if (loc != "") {
            var id = loc.substring(1);;
            $('.browser .tab').removeClass('active');
            $('.browser .tab[id="'+id  +'"]').addClass('active');
            $('.content').removeClass('active');
            $('.content[id="'+id  +'"]').addClass('active');
        }
    </script>

</asp:Content>