<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Inserting external data
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Inserting external data</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of inserting data into the spreadsheet by an external link in ONLYOFFICE Document Server.</p>
    <img alt="Inserting external data" src="<%= Url.Content("~/content/img/editor/inserting-external-data.png") %>" />
    <ol>
        <li>The user copies the data in the <b>document editor</b>.</li>
        <li>The <b>document editor</b> sends the data to the <b>document manager</b>.</li>
        <li>The <b>document manager</b> sends the copied data to another <b>document editor</b> to paste it into the spreadsheet.</li>
        <li>The user sends a request to refresh the data inserted from the external file by clicking the <em>Update values</em> button in the <em>External links</em> dialog box of the <em>Data</em> tab in the <b>document editor</b>.</li>
        <li>The <b>document editor</b> informs the <b>document manager</b> about the request.</li>
        <li>The <b>document manager</b> sends the file data to the <b>document editor</b> which uses it to update the inserted data in the current document.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>
            <p>
                Specify the <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> parameter
                and the <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> event handler for the <em>Paste link</em>
                and <em>Update values</em> buttons to be displayed in the configuration script for Document Editor initialization:
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
            "referenceData": {
                "fileKey": "Mgetl3dYUppf2",
                "instanceId": "https://example.com"
            },
            ...
        },
    "events": {
        "onRequestReferenceData": onRequestReferenceData,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>The user copies some data from another spreadsheet. The clipboard receives the following values:</p>
            <ul>
                <li>the sheet name and the range where the data was copied which will be used later to refresh the copied data;</li>
                <li>the <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> object which will be used to check the availability of insering data into another spreadsheet by the external link;</li>
                <li>the file name which will be used to display a formula in the editor.</li>
            </ul>
        </li>
        <li>
            <p>The user pastes the copied data to the current spreadsheet. If there are the <em>document.referenceData</em> object
                and the <em>onRequestReferenceData</em> event in the config, then the <em>Paste link</em> button is displayed in the dialog box.</p>
            <img alt="Paste link" src="<%= Url.Content("~/content/img/editor/paste-link.png") %>" />
        </li>
        <li>
            <p>When the user clicks the <em>Paste link</em> button, the formula is inserted into the current cell and the <em>referenceData</em> object is saved to the current file.
                The inserted formula is displayed as follows:</p>
            <pre>
='[fileName]sheetName1'!cell
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Example</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>fileName</td>
                        <td>The file name where the data was copied.</td>
                        <td>string</td>
                        <td>new.xlsx</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sheetName</td>
                        <td>The sheet name where the data was copied.</td>
                        <td>string</td>
                        <td>Sheet1</td>
                    </tr>
                    <tr class="tablerow">
                        <td>cell</td>
                        <td>The cell where the data was copied.</td>
                        <td>string</td>
                        <td>E5</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <p>The data update request to the file will be sent to the file URL.</p>
        </li>
        <li>
            <p>When the user is trying to refresh data from the external file by clicking the <em>Update values</em> button in the <em>External links</em> dialog box of the <em>Data</em> tab,
                the <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> event is called. An object with the unique file data received
                from the external file and the file path or name are sent in the <em>data</em> parameter:</p>
            <pre>
var onRequestReferenceData = function (event) {
    var referenceData = event.data.referenceData;
    var path = event.data.path;
    ...
};
</pre>
            <img alt="Update values" src="<%= Url.Content("~/content/img/editor/update-values.png") %>" />
        </li>
        <li>
            <p>In order to refresh the data from the external file, the <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> method must be called:</p>
            <note>Please note that this method is executed only when the user has permissions to the file from which the data is taken.</note>
            <pre>
docEditor.setReferenceData({
    "url": "https://example.com/url-to-example-document.docx",
    "referenceData": {
        "fileKey": "Mgetl3dYUppf2",
        "instanceId": "https://example.com"
    },
    "path": "sample.xlsx",
    "error": "Exception"
});
</pre>
            <p>
                Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
            </p>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>Defines the URL address to download the current file.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>referenceData</td>
                        <td>
                            Defines an object that is generated by the integrator to uniquely identify a file in its system:
                            <ul>
                                <li>
                                    <b>fileKey</b> - the unique document identifier used by the service to get a link to the file.
                                    It must not be changed when the document is edited and saved (i.e. it is not equal to the <a href="<%= Url.Action("config/document") %>#key">document.key</a> parameter),
                                    <br />
                                    <b>type</b>: string,
                                    <br />
                                    <b>example</b>:  "Mgetl3dYUppf2";
                                </li>
                                <li>
                                    <b>instanceId</b> - the unique system identifier. If the data was copied from a file on one system, and inserted into a file on another,
                                    then pasting by link will not be available and there will be no corresponding button in the context menu,
                                    <br />
                                    <b>type</b>: string,
                                    <br />
                                    <b>example</b>:  "https://example.com".
                                </li>
                            </ul>
                        </td>
                        <td>object</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>path</td>
                        <td>Defines the file name or relative path for the formula editor.
                            It is used to identify a file when the <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> event is executed.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                    <tr class="tablerow">
                        <td>error</td>
                        <td>Defines the error message text.</td>
                        <td>string</td>
                        <td>optional</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
    </ol>

</asp:Content>
