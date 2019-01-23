<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Document Server FAQ: <br />
        General questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="general_1">
    <dt>I am new to Document Server API. Where should I start?</dt>
    <dd>
        <p>If you do not know where to start with Document Server API, we suggest that you first read the <a href="<%= Url.Action("basic") %>">Basic concepts</a> and <a href="<%= Url.Action("howitworks") %>">How it works</a> sections to have better understanding of how Document Server API is built. Once you are familiar with the main concepts, you can visit the <a href="<%= Url.Action("try") %>">Try now</a> section to see the live examples of the main Document Server features in action.</p>
        <p>If you are interested in a specific programming language example, see the <a href="<%= Url.Action("demopreview") %>">Integration examples</a> which are available in several programming languages and explain how to install Document Server, where to get the example source files and how to install them and connect Document Server.</p>
        <p>The users who use some document management systems (Nextcloud, ownCloud, SharePoint etc.) and simply want to know how to connect Document Server to these systems should visit the <a href="<%= Url.Action("plugins") %>">Integration connectors</a> section where all the main plugins working with Document Server are explained.</p>
        <p>The detailed description of every API method is available in the larger <b>Documentation</b> module. All the methods are described in the appropriate sections, the list of them is available in the <a href="<%= Url.Action("advanced") %>">Advanced parameters</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="general_2">
    <dt>How to find out the current version number of Document Server?</dt>
    <dd>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <ul>
            <li>Posuere urna nec tincidunt praesent semper feugiat nibh.</li>
            <li>Mauris a diam maecenas sed enim ut sem viverra.</li>
            <li>Et pharetra pharetra massa massa.</li>
            <li>Ut sem nulla pharetra diam sit amet nisl suscipit adipiscing. Lacus vestibulum sed arcu non odio euismod. Id faucibus nisl tincidunt eget nullam non. Aliquet enim tortor at auctor urna nunc id cursus. Nunc faucibus a pellentesque sit amet. Nibh sit amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor vitae. Molestie ac feugiat sed lectus vestibulum.</li>
        </ul>
        <pre>Pellentesque dignissim enim sit amet venenatis urna. Sed sed risus pretium quam. Odio ut sem nulla pharetra diam sit. Erat imperdiet sed euismod nisi. Gravida quis blandit turpis cursus in hac habitasse platea. Bibendum neque egestas congue quisque egestas diam. Neque ornare aenean euismod elementum nisi quis. Ullamcorper sit amet risus nullam eget felis. Enim nulla aliquet porttitor lacus luctus accumsan tortor. Pulvinar neque laoreet suspendisse interdum consectetur libero id. Faucibus ornare suspendisse sed nisi. Porta non pulvinar neque laoreet suspendisse interdum. Facilisi etiam dignissim diam quis enim lobortis scelerisque. Praesent tristique magna sit amet purus gravida quis. Sodales neque sodales ut etiam sit amet nisl purus. Risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est. Egestas pretium aenean pharetra magna. Aliquam eleifend mi in nulla posuere.</pre>
    </dd>
</dl>