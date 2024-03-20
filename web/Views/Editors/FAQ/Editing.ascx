<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ONLYOFFICE Docs FAQ: <br />
        Editing questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="editing_1">
    <dt>What is the 'Callback handler' and why do I need it?</dt>
    <dd>
        <p>The <b>document editing service</b> informs the <b>document storage service</b> about the status of the document editing and sends the response with all the necessary data via the <em>callbackUrl</em>, which is specified in the configuration file like this:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx"
    },
    ...
});</pre>
        <p>Here the <b>https://example.com/url-to-callback.ashx</b> is the address of the special handler which can process the response from the <b>document editing service</b> and response with the <em>"error": 0</em> status code. This handler can be written in the programming language of your choice.</p>
        <p>All the parameters which can be sent to the callback handler and their description can be found at <a href="<%= Url.Action("callback") %>">this page</a>.</p>
        <p>There are also examples in several programming languages of how this handler can be implemented: <a href="<%= Url.Action("callback") %>#csharp">.Net (C#)</a>, <a href="<%= Url.Action("callback") %>#java">Java</a>, <a href="<%= Url.Action("callback") %>#nodejs">Node.js</a>, <a href="<%= Url.Action("callback") %>#php">PHP</a>, <a href="<%= Url.Action("callback") %>#ruby">Ruby</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="editing_2">
    <dt>What is the 'document.key' parameter?</dt>
    <dd>
        <p>The <em>document.key</em> parameter is a unique document identifier which helps distinguish the document among the others and univocally identify it by the editing service.</p>
        <p>Each time the document is changed, the <em>document.key</em> parameter must also be generated anew as the documents with the known key are taken from cache.</p>
        <p>More information on this parameter is available <a href="<%= Url.Action("config/document") %>#key">here</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="editing_3">
    <dt>How to define the mode that the file should be opened in (viewing or editing)?</dt>
    <dd>
        <p>To define the document opening mode the <em>editorConfig.mode</em> parameter is used. It can acquire two values:</p>
        <ul>
            <li><b>edit</b> is used by default and allows to open the document file for editing (if the corresponding <a href="<%= Url.Action("config/document/permissions") %>">document.permissions</a> parameters are also set to <b>true</b>);</li>
            <li><b>view</b> allows to open the document for viewing with the main toolbar and editing disabled.</li>
        </ul>
        <p>Set the mode using the <em>editorConfig</em> section of the configuration file:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
        <p>More information on this parameter is available <a href="<%= Url.Action("config/editor") %>#mode">here</a>.</p>
    </dd>
</dl>