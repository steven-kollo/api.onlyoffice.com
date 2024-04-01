<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ONLYOFFICE Docs FAQ: <br />
        Embedding questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="embedding_1">
    <dt>How to embed a document to a web site?</dt>
    <dd>
        <p>There are three main appearances of the editors, optimized for different use:</p>
        <ul>
            <li><b>desktop</b>, which is optimized for the display in desktop computer browsers;</li>
            <li><b>mobile</b>, which is optimized for the display in mobile device browsers;</li>
            <li><b>embedded</b>, which is optimized for the embedding the documents into a website page.</li>
        </ul>
        <p>You can embed the document with any appearance to your webpage, but it is more logical to use the specific <b>embedded</b> display type with only main controls for the editors displayed for the document within a website page.</p>
        <p>That is why the <em>type</em> should be set to <b>embedded</b> and the configuration file will look like this:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "type": "embedded",
    ...
});</pre>
        <p>Further information about the display type can be found <a href="<%= Url.Action("config") %>#type">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="embedding_2">
    <dt>How to change the behavior of the buttons in the embedded mode?</dt>
    <dd>
        <p>The embedded mode allows to display the document with only three control buttons: <b>Download</b>, <b>Share</b> and <b>Embed</b>. You can change the behavior of these buttons the following way:</p>
        <ul>
            <li><em>editorConfig.embedded.embedUrl</em> is the absolute URL to the document with the <em>type</em> parameter set to <b>embedded</b> in the configuration, which can be used by other users to embed it into their own website page.</li>
            <li><em>editorConfig.embedded.saveUrl</em> is the absolute URL to the document with the <em>document.permission.download</em> parameter set to <b>true</b>, which can be saved by other users to their own computer in the <em>DOCX</em>, <em>PPTX</em> or <em>XLSX</em> format depending on the file type.</li>
            <li><em>editorConfig.embedded.shareUrl</em> is the absolute URL to the document which can be used by other users to share it with others.</li>
        </ul>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "embedded": {
            "embedUrl": "https://example.com/embedded?doc=exampledocument1.docx",
            "saveUrl": "https://example.com/download?doc=exampledocument1.docx",
            "shareUrl": "https://example.com/view?doc=exampledocument1.docx",
            ...
        },
        ...
    },
    ...
});</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
        </p>
        <p>To remove any of these buttons simply do not include the corresponding parameter into the configuration file.</p>
        <div class="note">If you decide to hide the <b>Download</b> button (<em>editorConfig.embedded.saveUrl</em> parameter), please do not forget to also set the <em>document.permission.download</em> parameter in the document configuration to <b>false</b> to completely disable the possibility to download the file.</div>
        <p>Further information about the embedding parameters can be found <a href="<%= Url.Action("config/editor/embedded") %>">at this page</a>.</p>
    </dd>
</dl>