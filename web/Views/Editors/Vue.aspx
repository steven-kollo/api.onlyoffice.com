<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Docs Vue component
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE Docs Vue component</span>
    </h1>

    <p>The ONLYOFFICE Docs Vue.js <a href="https://github.com/ONLYOFFICE/document-editor-vue" target="_blank">component</a> integrates ONLYOFFICE Docs
        into <a href="https://vuejs.org/" target="_blank">Vue.js</a> projects.</p>


    <h2 id="prerequisites" class="copy-link">Prerequisites</h2>
    <p>This procedure requires <a href="https://nodejs.org/en" target="_blank">Node.js (and npm)</a>.</p>

    <h2 id="install" class="copy-link">Creating the demo Vue.js application with ONLYOFFICE Docs editor</h2>
    <p>This procedure creates a <a href="https://cli.vuejs.org/guide/creating-a-project.html#vue-create" target="_blank">basic Vue.js application</a>
        and installs an ONLYOFFICE Docs editor in it.</p>
    <ol>
        <li>
            <p>Open a command line or command prompt and create a Vue.js 3.x project named <em>onlyoffice-vue-demo</em>
                using the <a href="https://github.com/vuejs/create-vue" target="_blank">Create Vue Tool</a>:</p>
            <pre>
npm create vue@3
</pre>
        </li>
        <li>
            <p>Go to the newly created directory:</p>
            <pre>
cd onlyoffice-vue-demo
</pre>
        </li>
        <li>
            <p>Install ONLYOFFICE Docs Vue.js component from <b>npm</b> and save it to the <em>package.json</em> file with <em>--save</em>:</p>
            <pre>
npm install --save @onlyoffice/document-editor-vue
</pre>
        </li>
        <li>
            <p>Open the <em>./src/App.vue</em> file in the <em>onlyoffice-vue-demo</em> project and replace its contents with the following code:</p>
            <pre>
&lt;template&gt;
    &lt;DocumentEditor 
        id="docEditor" 
        documentServerUrl="http://documentserver/"
        :config="config"
        :events_onDocumentReady="onDocumentReady"
        :onLoadComponentError="onLoadComponentError"
    /&gt; 
&lt;/template&gt;

&lt;script lang="ts"&gt;
import { defineComponent } from 'vue';
import { DocumentEditor } from "@onlyoffice/document-editor-vue";

export default defineComponent({
    name: 'ExampleComponent',
    components: {
        DocumentEditor
    },
    data() {
        return {
            config: {
                document: {
                    fileType: "docx",
                    key: "Khirz6zTPdfd7",
                    title: "Example Document Title.docx",
                    url: "https://example.com/url-to-example-document.docx"
                },
                documentType: "word",
                editorConfig: {
                    callbackUrl: "https://example.com/url-to-callback.ashx"
                }
            }
        }
    },
    methods: {
        onDocumentReady() {
            console.log("Document is loaded");
        },
        onLoadComponentError (errorCode, errorDescription) {
            switch(errorCode) {
                case -1: // Unknown error loading component
                    console.log(errorDescription);
                    break;

                case -2: // Error load DocsAPI from http://documentserver/
                    console.log(errorDescription);
                    break;

                case -3: // DocsAPI is not defined
                    console.log(errorDescription);
                    break;
            }
        }
    },
});
&lt;/script&gt;
</pre>
            <p>Replace the following lines with your own data:</p>
            <ul>
                <li><b>"http://documentserver/"</b> - replace with the URL of your server;</li>
                <li><b>"https://example.com/url-to-example-document.docx"</b> - replace with the URL to your file;</li>
                <li><b>"https://example.com/url-to-callback.ashx"</b> - replace with your callback URL (this is required for the saving functionality to work).</li>
            </ul>
        </li>
        <li>
            <p>Test the application using the Vue development server:</p>
            <ul>
                <li>
                    <p>To start the development server, navigate to the <em>onlyoffice-vue-demo</em> directory and run:</p>
                    <pre>
npm run dev
</pre>
                </li>
                <li>To stop the development server, select on the command line or command prompt and press <em>Ctrl+C</em>.</li>
            </ul>
        </li>
    </ol>

    <h2 id="deploy" class="copy-link">Deploying the demo Vue.js application</h2>
    <p>The easiest way to deploy the application to a production environment is to install <a href="https://github.com/vercel/serve" target="_blank">serve</a> and create a static server:</p>
    <ol>
        <li>
            <p>Install the <em>serve</em> package globally:</p>
            <pre>
npm install -g serve
</pre>
        </li>
        <li>
            <p>Serve your static site on the 3000 port:</p>
            <pre>
serve -s build
</pre>
            <p>Another port can be adjusted using the <em>-l</em> or <em>--listen</em> flags:</p>
            <pre>
serve -s build -l 4000
</pre>
        </li>
        <li>
            <p>To serve the project folder, go to it and run the <em>serve</em> command:</p>
            <pre>
cd onlyoffice-vue-demo
serve
</pre>
        </li>
    </ol>
    <p>Now you can deploy the application to the created server:</p>
    <ol>
        <li>
            <p>Navigate to the <em>onlyoffice-vue-demo</em> directory and run:</p>
            <pre>
npm run build
</pre>
            <p>The <em>dist</em> directory will be created with a production build of your app.</p>
        </li>
        <li>
            <p>Copy the contents of the <em>onlyoffice-vue-demo/dist</em> directory to the root directory of the web server (to the <em>onlyoffice-vue-demo</em> folder).</p>
        </li>
    </ol>
    <p>The application will be deployed on the web server (<em>http://localhost:3000</em> by default).</p>

    <h2 id="api" class="copy-link">ONLYOFFICE Docs Vue component API</h2>
    <div class="header-gray">Properties</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
			<col class="table-type" />
			<col />
			<col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Type</td>
                <td>Default</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="id" class="copy-link">id<span class="required">*</span></td>
                <td>string</td>
                <td>null</td>
                <td>Component unique identifier.</td>
            </tr>
            <tr class="tablerow">
                <td id="documentServerUrl" class="copy-link">documentServerUrl<span class="required">*</span></td>
                <td>string</td>
                <td>null</td>
                <td>Address of ONLYOFFICE Docs.</td>
            </tr>
            <tr class="tablerow">
                <td id="config" class="copy-link">config<span class="required">*</span></td>
                <td>object</td>
                <td>null</td>
                <td>Generic <a href="<%= Url.Action("config") %>">configuration object</a> for opening a file with token.</td>
            </tr>
            <tr class="tablerow">
                <td id="document_fileType" class="copy-link">document_fileType</td>
                <td>string</td>
                <td>null</td>
                <td>The type of the file.</td>
            </tr>
            <tr class="tablerow">
                <td id="document_title" class="copy-link">document_title</td>
                <td>string</td>
                <td>null</td>
                <td>The file name.</td>
            </tr>
            <tr class="tablerow">
                <td id="documentType" class="copy-link">documentType</td>
                <td>string</td>
                <td>null</td>
                <td>The document type.</td>
            </tr>
            <tr class="tablerow">
                <td id="height" class="copy-link">height</td>
                <td>string</td>
                <td>null</td>
                <td>Defines the document height in the browser window.</td>
            </tr>
            <tr class="tablerow">
                <td id="type" class="copy-link">type</td>
                <td>string</td>
                <td>null</td>
                <td>Defines the platform type used to access the document (desktop, mobile or embedded).</td>
            </tr>
            <tr class="tablerow">
                <td id="width" class="copy-link">width</td>
                <td>string</td>
                <td>null</td>
                <td>Defines the document width in the browser window.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onAppReady" class="copy-link">events_onAppReady</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the application is loaded into the browser.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onDocumentStateChange" class="copy-link">events_onDocumentStateChange</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the document is modified.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onMetaChange" class="copy-link">events_onMetaChange</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the meta information of the document is changed via the meta command.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onDocumentReady" class="copy-link">events_onDocumentReady</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the document is loaded into the document editor.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onInfo" class="copy-link">events_onInfo</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the application opened the file.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onWarning" class="copy-link">events_onWarning</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when a warning occurs.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onError" class="copy-link">events_onError</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when an error or some other specific event occurs.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestSharingSettings" class="copy-link">events_onRequestSharingSettings</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to manage document access rights by clicking <b>Change access rights</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestRename" class="copy-link">events_onRequestRename</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to rename the file by clicking the <b>Rename...</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onMakeActionLink" class="copy-link">events_onMakeActionLink</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to get link for opening the document which contains a bookmark, scrolling to the bookmark position.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestInsertImage" class="copy-link">events_onRequestInsertImage</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to insert an image by clicking the <b>Image from Storage</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestSaveAs" class="copy-link">events_onRequestSaveAs</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to save file by clicking <b>Save Copy as...</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestMailMergeRecipients" class="copy-link">events_onRequestMailMergeRecipients</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to select recipients data by clicking the <b>Mail merge</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestCompareFile" class="copy-link">events_onRequestCompareFile</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to select document for comparing by clicking the <b>Document from Storage</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestEditRights" class="copy-link">events_onRequestEditRights</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to switch the document from the viewing into the editing mode by clicking the <b>Edit Document</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestHistory" class="copy-link">events_onRequestHistory</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to show the document version history by clicking the <b>Version History</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestHistoryClose" class="copy-link">events_onRequestHistoryClose</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to go back to the document from viewing the document version history by clicking the <b>Close History</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestHistoryData" class="copy-link">events_onRequestHistoryData</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to click the specific document version in the document version history.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestRestore" class="copy-link">events_onRequestRestore</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to restore the file version by clicking the <b>Restore</b> button in the version history.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <span class="required-descr"><span class="required">*</span><em> - required field</em></span>


    <h2 id="storybook" class="copy-link">Installing Storybook</h2>
    <p>Install <a href="https://storybook.js.org/" target="_blank">Storybook</a> to develop UI components in isolation:</p>
    <ol>
        <li>
            <p>Change the address of the document server in the <em>config/default.json</em> file:</p>
            <pre>
"documentServerUrl": "http://documentserver/"
</pre>
            <p>where the <b>documentserver</b> is the name of the server with <b>ONLYOFFICE Docs</b> installed.</p>
        </li>
        <li>
            <p>Build Storybook with the following command:</p>
            <pre>
npm run build-storybook
</pre>
        </li>
        <li>
            <p>Start Storybook:</p>
            <pre>
npm run storybook
</pre>
        </li>
    </ol>


    <h2 id="development" class="copy-link">Developing ONLYOFFICE Docs Vue component</h2>
    <ol>
        <li>
            <p>Clone project from the GitHub repository:</p>
            <pre>
git clone https://github.com/ONLYOFFICE/document-editor-vue
</pre>
        </li>
        <li>
            <p>Install the project dependencies:</p>
            <pre>
npm install
</pre>
        </li>
        <li>
            <p>Test the component:</p>
            <pre>
npm run test
</pre>
        </li>
        <li>
            <p>Build the project:</p>
            <pre>
npm run build
</pre>
        </li>
        <li>
            <p>Create the package:</p>
            <pre>
npm pack
</pre>
        </li>
    </ol>


    <h2 id="feedback" class="copy-link">Feedback and support</h2>
    <p>In case you have any issues, questions, or suggestions for the ONLYOFFICE Docs Vue component, please refer to the <a href="https://github.com/ONLYOFFICE/document-editor-vue/issues" target="_blank">Issues</a> section.</p>


</asp:Content>
