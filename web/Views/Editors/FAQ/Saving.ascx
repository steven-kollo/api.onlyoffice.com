<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ONLYOFFICE Docs FAQ: <br />
        Saving questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="saving_1">
    <dt>How to forcefully save the document to my storage when editing it?</dt>
    <dd>
        <p>Normally the final document version is compiled once all the users editing it close the document and the delay time (about 10 seconds) passes. But this behavior can be overriden. To do that the <b>forcesave</b> option is available.</p>
        <p>There are several ways to initiate forced saving:</p>
        <ul>
            <li>Sending the request to the <a href="<%= Url.Action("command") %>">document command service</a>, using the <a href="<%= Url.Action("command/forcesave") %>">forcesave</a> value for the <em>c</em> parameter:
                <pre>{
    "c": "forcesave",
    "key": "Khirz6zTPdfd7",
    "userdata": "sample userdata"
}</pre>
            </li>
            <li>Enabling the <a href="<%= Url.Action("config/editor/customization") %>#forcesave">editorConfig.customization.forcesave</a> setting to <b>true</b> in the editor initialization configuration:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "forcesave": false,
            ...
        },
        ...
    },
    ...
});</pre>
            </li>
            <li>Enabling the repeating forcesave start in the <b>default.json</b> ONLYOFFICE Docs configuration file:
                <pre>{
    "services": {
        "CoAuthoring": {
            "autoAssembly": {
                "enable": true,
                "interval": "5m"
            }
        }
    }
}</pre>
            </li>
        </ul>
        <p>Depending on which type of forced saving you need, you can select the correct implementation. More information about this can be found at <a href="<%= Url.Action("save") %>#forcesave">this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_2">
    <dt>How to save the created document?</dt>
    <dd>
        <p>Please see the <a href="<%= Url.Action("save") %>">Saving file</a> section to find out how file saving works in ONLYOFFICE Docs and what is needed to save the created document.</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_3">
    <dt>How to save the opened document to another document file type?</dt>
    <dd>
        <p>If the document of a format different from the OOXML (.txt or .ods) is opened, the OOXML format will be saved by default.</p>
        <p>To save the opened document to a format different from the default Office Open XML one, the POST request must be sent to the <b>document conversion service</b>.</p>
        <p>The details of how the conversion works and why it is needed can be found in <a href="<%= Url.Action("conversion") %>">this section</a>. The POST request parameters and available responses to it can be found <a href="<%= Url.Action("conversionapi") %>">here</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_4">
    <dt>How to enable or disable the 'Autosave' option?</dt>
    <dd>
        <p>The <b>Autosave</b> option is enabled by default. To disable it, you need to set the <a href="<%= Url.Action("config/editor/customization") %>#autosave">editorConfig.customization.autosave</a> parameter in the document configuration to <b>false</b>:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "autosave": false,
            ...
        },
        ...
    },
    ...
});</pre>
        <div class="note">Please note, that disabling the <b>Autosave</b> will also disable the <b>Fast</b> co-editing mode which only works with the automatic document saving enabled.</div>
        <p>Further information about the autosaving can be found <a href="<%= Url.Action("config/editor/customization") %>#autosave">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_5">
    <dt>What is the conversion start delay time and how can it be changed?</dt>
    <dd>
        <p>Normally the document is not physically saved to the computer hard disk drive in the compiled form when it is being edited. Once the editing is done and all the users who work on the document close it, the file is converted to the Office Open XML format and saved to disk.</p>
        <p>After that the <b>document editing service</b> informs the <b>document storage service</b> that the file is ready and can be downloaded.</p>
        <p>The time between the end of the editing and the conversion start is set in the <b>default.json</b> configuration file with the <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-savetimeoutdelay" target="_blank">services.CoAuthoring.server.savetimeoutdelay</a> parameter (5000 milliseconds or 5 seconds by default) and can be changed:</p>
        <pre>{
    "services": {
        "CoAuthoring": {
            "server": {
                "savetimeoutdelay": 5000
            }
        }
    }
}</pre>
        <p>Further information about the conversion start delay can be found <a href="<%= Url.Action("save") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_6">
    <dt>How to specify the encoding type when converting from the csv or txt formats?</dt>
    <dd>
        <p>To preserve the readability of a <b>txt</b> or <b>csv</b> file, you might need to set the encoding it was initially saved with. This might be useful in case the characters different from the base latin letters (umlauted letters like ä, ö, ü, letters with accents, cyrillic letters and so on) are used in the file.</p>
        <p>For this purpose the POST request with the parameters set in the request body is sent to the <b>document conversion service</b>:</p>
        <pre>{
    "codePage": 65001,
    "filetype": "txt",
    "key": "Khirz6zTPdfd7",
    "outputtype": "docx",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.txt"
}</pre>
        <p>Further information about using the codepage during conversion can be found <a href="<%= Url.Action("conversionapi") %>#codePage">at this page</a>.</p>
    </dd>
</dl>
