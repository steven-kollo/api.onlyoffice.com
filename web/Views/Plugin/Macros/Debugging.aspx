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

    <p class="dscr">To debug ONLYOFFICE macros, follow the instructions below. There are two ways to run a macro in the debug mode.</p>

    <p><b>Option 1</b>. Using the breakpoints</p>
    <ol>
        <li>Open the <b>Plugins</b> tab and click <b>Macros</b>.</li>
        <li>
            <p>Use the <b>log</b> method of the <b>console</b> object in your script to display the logging information in the browser debug console:</p>
            <pre>
console.log(123);
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Hello world!");
</pre>
            <img alt="Console log" src="<%= Url.Content("~/content/img/plugins/console-log.png") %>" />
        </li>
        <li>Press the <b>Run</b> button to run your script.</li>
        <li>Open the debug console by pressing the <b>F12</b> button.</li>
        <li>
            <p>Click the <em>debugger:///VM(XXX)</em> link on the right of the line with the logging message. The <em>VMXXX</em> file with your script will be opened.</p>
            <img alt="Debug console" src="<%= Url.Content("~/content/img/plugins/debug-console.png") %>" />
        </li>
        <li>
            <p>Set a breakpoint by clicking the line number and run your script again.</p>
            <img alt="Breakpoint" src="<%= Url.Content("~/content/img/plugins/breakpoint.png") %>" />
        </li>
    </ol>
    <p>Script execution is paused, and now you can see the current values of variables, execute commands in the console, etc.</p>

    <p><b>Option 2</b>. Using the <b>debugger</b> command</p>
    <ol>
        <li>Open the <b>Plugins</b> tab and click <b>Macros</b>.</li>
        <li>
            <p>Use the <b>debugger</b> command in your script:</p>
            <pre>
debugger;
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Hello world!");
</pre>
        </li>
        <li>Open the debug console by pressing the <b>F12</b> button.</li>
        <li>
            <p>Press the <b>Run</b> button to run your script.</p>
            <note>Please note that the <b>debugger</b> command will only work if the development tools are open. Otherwise, the browser will ignore it.</note>
            <img alt="Debugger" src="<%= Url.Content("~/content/img/plugins/debugger.png") %>" />
        </li>
    </ol>
    <p>The <b>debugger</b> command works as a breakpoint and pauses the execution at the script point where this command is inserted.</p>

</asp:Content>
