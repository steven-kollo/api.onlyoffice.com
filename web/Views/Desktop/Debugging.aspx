<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Debugging
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Debugging</span>
    </h1>

    <p>To run ONLYOFFICE Desktop Editors in debug mode, follow the instructions depending on the operating system you use.</p>

    <h2 id="windows" class="copy-link">For Windows</h2>
    <p>There are two ways to launch the application: through the shortcut or the terminal.</p>

    <p><b>Option 1</b>. Run the app through the shortcut:</p>
    <ol>
        <li>Right-click the application shortcut on the desktop screen.</li>
        <li>Choose <b>Properties</b>.</li>
        <li>Open the <b>Shortcut</b> tab.</li>
        <li>In the <b>Target</b> field, after the path to the application, enter a space and then type the <em>--ascdesktop-support-debug-info</em> flag.</li>
        <li>Click the <b>Apply</b> button.</li>
    </ol>
    <p><img alt="Windows shortcut" src="<%= Url.Content("~/content/img/desktop/windows-shortcut.png") %>" /></p>

    <br />
    <p><b>Option 2</b>. Run the app through the terminal:</p>
    <ol>
        <li>Press <b>Win+R</b>.</li>
        <li>
            <p>In the appeared <b>Run</b> window, type <em>cmd</em> in the <b>Open</b> field.</p>
            <p><img alt="Windows terminal" src="<%= Url.Content("~/content/img/desktop/windows-terminal.png") %>" /></p>
        </li>
        <li>Click the <b>OK</b> button. The terminal will be opened.</li>
        <li>
            <p>In the command line, enter the path to the application, add a space and then type the <em>--ascdesktop-support-debug-info</em> flag:</p>
            <p><em>"%ProgramFiles%\ONLYOFFICE\DesktopEditors\DesktopEditors" --ascdesktop-support-debug-info</em></p>
        </li>
    </ol>

    <h2 id="linux" class="copy-link">For Linux</h2>
    <p>Use the terminal to run ONLYOFFICE Desktop Editors in debug mode:</p>
    <ol>
        <li>Press <b>CTRL+ALT+T</b>. The terminal will be opened.</li>
        <li>
            <p>In the command line, enter the path to the application, add a space and then type the <em>--ascdesktop-support-debug-info</em> flag:</p>
            <p><em>"/opt/onlyoffice/desktopeditors/DesktopEditors" --ascdesktop-support-debug-info</em></p>
        </li>
    </ol>

    <h2 id="macos" class="copy-link">For Mac OS</h2>
    <p>Use the terminal to run ONLYOFFICE Desktop Editors in debug mode:</p>
    <ol>
        <li>Press <b>Command+Space</b>.</li>
        <li>
            <p>In the appeared <b>Spotlight</b> window, type <em>Terminal</em> in the search line:</p>
            <p><img alt="MacOS terminal" src="<%= Url.Content("~/content/img/desktop/macos-terminal.png") %>" /></p>
        </li>
        <li>Choose the <b>Terminal</b> option. The terminal will be opened.</li>
        <li>
            <p>In the command line, enter the path to the application, add a space and then type the <em>--ascdesktop-support-debug-info</em> flag:</p>
            <p><em>"/Applications/ONLYOFFICE.app/Contents/MacOS/ONLYOFFICE" --ascdesktop-support-debug-info</em></p>
        </li>
    </ol>

    <h2 id="debugging" class="copy-link">Working in debug mode</h2>
    <p>To start working in dubug mode, right-click any editable field on the top toolbar (for example, font list combo) and click <b>Inspect Element</b>.</p>

    <p>Here is the result:</p>
    <p><img alt="Debug" src="<%= Url.Content("~/content/img/desktop/debugging.png") %>" /></p>

</asp:Content>
