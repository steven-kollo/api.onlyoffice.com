<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Opening documents
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Opening documents</span>
    </h1>

    <p>After <a href="<%= Url.Action("loginlogout") %>">registering</a> in the cloud, you can start working on documents stored there.</p>
    <p>Connecting ONLYOFFICE Desktop Editors to your cloud allows you to edit text documents, spreadsheets, and presentations without having a constant Internet connection 
        and easily switch to the online mode for real-time co-editing (in case <a href="<%= Url.Action("basic", "editors") %>">ONLYOFFICE Docs</a> is integrated with your cloud).</p>
    <p>Besides, using ONLYOFFICE Desktop Editors you are no longer limited by your browser resources. It means you can:</p>
    <ul>
        <li>copy and paste from/into another document using the editor toolbar buttons and context menu options;</li>
        <li>print the document directly from the app using the <b>Print</b> option;</li>
        <li>use all the fonts available on the local computer;</li>
        <li>work with documents without prior manual language setting (it is set automatically).</li>
    </ul>

    <p>To open a document in a new window / tab correctly:</p>
    <p><b>Option 1.</b> Use the <em>window.open("http://url.to.document")</em> JavaScript command, where URL to the document is validated by the <em>editorPage</em> value of the <a href="<%= Url.Action("addingdms") %>">config</a>. 
        The document will be opened upon successful validation.</p>
    <p><b>Option 2.</b> Use the <em>open:document</em> command of the <a href="<%= Url.Action("loginlogout") %>">execCommand</a> method. When this command is sent, the document is opened. 
        Parameters are specified in the format of a string with the serialized <em>json</em> as follows:</p>
    <pre>
{
    "url" : "url to document",
    "type" : "type",
    "provider" : "provider"
} 
</pre>

    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
                <td>Example</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="url" class="copy-link">url</td>
                <td>
                    Defines the absolute URL to the opened document.
                </td>
                <td>string</td>
                <td>"https://example.com/url-to-example-document.docx"</td>
            </tr>
            <tr class="tablerow">
                <td id="type" class="copy-link">type</td>
                <td>
                    Defines the type of the opened document if it is possible to define: <b>word</b>, <b>cell</b> or <b>slide</b>.
                </td>
                <td>string</td>
                <td>"word"</td>
            </tr>
            <tr class="tablerow">
                <td id="provider" class="copy-link">provider</td>
                <td>
                    Defines the provider id used to refer to the desktop app in the JavaScript commands (the same as in the <a href="<%= Url.Action("addingdms") %>">config</a>).
                </td>
                <td>string</td>
                <td>"onlyoffice"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>
    <pre>
const params = {
    "url" : "https://example.com/url-to-example-document.docx",
    "type" : "word",
    "provider" : "onlyoffice"
}
AscDesktopEditor.execCommand("open:document", JSON.stringify(params))                     
</pre>
    
</asp:Content>
