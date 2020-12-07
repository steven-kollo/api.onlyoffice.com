<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin styles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Plugin styles</span>
    </h1>

    <p class="dscr">
        To bring the connected plugin to the ONLYOFFICE editor style, you can use the associated styles. 
        They are connected to the plugin in the <a href="<%= Url.Action("indexhtml") %>">index.html</a> file.
    </p>
    <p>
        The <a href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css" target="_blank">plugin.css</a> code contains ONLYOFFICE styles for different interface elements.
        Stylesheet can be connected to the <em>index.html</em> file in the following way:
    </p>
    <pre>
&lt;link rel="stylesheet" href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css"&gt;
</pre>

    <p>
        After that you can add interface elements to your plugins in the ONLYOFFICE style.
    </p>

    <h2>Adding interface elements to the plugin</h2>

    <p>Have a look at the YouTube plugin interface as an example of using ONLYOFFICE styles.</p>
    <p><img alt="YouTube plugin" src="<%= Url.Content("~/content/img/plugins/youtube-plugin.png") %>" /></p>

    <ol>
        <li>
            <p>
                To add a button in the ONLYOFFICE style, you need to use the <em>btn-text-default</em> class. 
                The <em>btn-text-default.primary</em> class defines a button with a dark background and indicates that this button is important.
            </p>
            <p>
                The following code adds the <b>OK</b> button to the plugin in the ONLYOFFICE style (button width - 30 pixels):
            </p>
            <pre>
&lt;button class="btn-text-default" style="width:30px;"&gt;OK&lt;/button&gt;
</pre>
        </li>
        <li>
            <p>
                To add a form in the ONLYOFFICE style, you need to use the <em>form-control</em> class.
            </p>
            <p>
                The following code adds the form to the plugin in the ONLYOFFICE style (form width - 100%, i.e. it is adjusted to the width of the parent element):
            </p>
            <pre>
&lt;input type="text" class="form-control" style="width:100%;"&gt;
</pre>
        </li>
    </ol>
</asp:Content>
