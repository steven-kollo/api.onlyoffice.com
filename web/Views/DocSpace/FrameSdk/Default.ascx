<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Basic concepts</span>
</h1>

<p class="dscr">
    The ONLYOFFICE DocSpace API allows developers to integrate ONLYOFFICE DocSpace into their websites, configure and manage it.
</p>
<p>Follow the steps below to connect DocSpace as a frame to your own website.</p>
<ol>
    <li>
        <p>Create the target HTML file where ONLYOFFICE DocSpace is to be embedded need to have a placeholder <em>div</em> tag, where all the information about DocSpace parameters will be passed:</p>
        <pre>
&lt;div id="frameId"&gt;&lt;/div&gt;
&lt;script type="text/javascript" src="https://docspaceserver/static/scripts/api.js"&gt;&lt;/script&gt;
</pre>
        <p>where <b>docspaceserver</b> is the name of the server with the ONLYOFFICE DocSpace installed.</p>
        <p>The API JavaScript file can normally be found in the following DocSpace folder:</p>
        <p><b>https://docspaceserver/static/scripts/api.js</b></p>
    </li>
    <li>
        <p>When the API JavaScript is connected to the page, get an object to work with the DocSpace SDK:</p>
        <pre>DocSpace.SDK</pre>
    </li>
    <li>
        <p>Initialize DocSpace using the <b>initManager()</b> method with the initialization config passed to it:</p>
        <pre>
var docSpace = new DocSpace.SDK.initManager({
    frameId: "frameId",
    showMenu: true
});
</pre>
        <p>You can use other available <a href="<%= Url.Action("framesdk/initmethods") %>">methods</a> to initialize DocSpace.</p>
        <p>The full list of <a href="<%= Url.Action("framesdk/config") %>">config parameters</a> can be found here.</p>
    </li>
    <li>After initializing <b>docSpace</b>, you will get an object that can be used to configure and manage DocSpace.</li>
</ol>
