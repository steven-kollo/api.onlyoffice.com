<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">React samples</span>
</h1>

<p class="dscr">
    In the React application that you've created using these <a href="<%= Url.Action("react") %>">instructions</a>,
    you can install <a href="https://storybook.js.org/" target="_blank">Storybook</a> and create various UI components.
    To enable interaction between the UI components of the React application and the ONLYOFFICE editors, we will use the <a href="<%= Url.Action("connector") %>">Automation API</a>.
    This API allows us to interact with text documents, spreadsheets, presentations, fillable forms, and PDFs using the created UI components.
</p>

<p>You can find some ready-made React components in this <a href="https://github.com/ONLYOFFICE/document-editor-react-samples" target="_blank">repository</a>:</p>
<ul>
    <li><a href="https://github.com/ONLYOFFICE/document-editor-react-samples/tree/master/src/components/Comments" target="_blank">Working with comments</a></li>
    <li><a href="https://github.com/ONLYOFFICE/document-editor-react-samples/tree/master/src/components/Review" target="_blank">Working with review changes</a></li>
    <li><a href="https://github.com/ONLYOFFICE/document-editor-react-samples/tree/master/src/components/ContentControls" target="_blank">Filling out forms</a></li>
</ul>

<p>Let's see how to create React components and use them.</p>

<h2 id="prerequisites" class="copy-link">Install the prerequisites</h2>
<ol>
    <li>
        <p>Go to the React project directory:</p>
        <pre>
cd onlyoffice-react-demo
</pre>
    </li>
    <li>
        <p>Install Storybook using the following command:</p>
        <pre>
npx -p @storybook/cli sb init
</pre>
        <p>When the installation is completed, Storybook will open a new tab in your browser. To run it manually, execute the following command:</p>
        <pre>
yarn storybook
</pre>
        <p>In the opened window, you will see the default UI components, such as buttons, headers, and pages. They are presented here for demonstration purposes. You can delete them by clearing the <em>src/stories</em> directory.
</p>
    </li>
    <li>
        <p>Install TypeScript to create your own components:</p>
        <pre>
yarn add typescript
</pre>
    </li>
    <li>
        <p>Add the <em>src/tsconfig.json</em> file with the following content:</p>
        <pre>
{
    "compilerOptions": {
        "target": "es5",
        "lib": [
            "dom",
            "dom.iterable",
            "esnext"
        ],
        "allowJs": true,
        "skipLibCheck": true,
        "esModuleInterop": true,
        "allowSyntheticDefaultImports": true,
        "strict": true,
        "forceConsistentCasingInFileNames": true,
        "noFallthroughCasesInSwitch": true,
        "module": "esnext",
        "moduleResolution": "node",
        "resolveJsonModule": true,
        "isolatedModules": true,
        "noEmit": true,
        "jsx": "react-jsx"
    },
    "include": [
        "src"
    ]
}
</pre>
    </li>
</ol>


<h2 id="create-component" class="copy-link">Create React components</h2>
<p>Let's start developing React components.</p>
<ol>
    <li>
        <p>Create the <em>config</em> folder and add the <em>config.json</em> file with the following code:</p>
        <pre>
{
    "documentserverUrl": "http://documentserver/",
    "demoStorage": "https://d2nlctn12v279m.cloudfront.net/assets/docs/samples/",
    "oformsUrl": "https://cmsoforms.onlyoffice.com/api/oforms?populate=*&locale=all"
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
                    <td id="documentserverUrl" class="copy-link">documentserverUrl</td>
                    <td>Defines your server URL where the example will be deployed.</td>
                    <td>string</td>
                    <td>"http://documentserver/"</td>
                </tr>
                <tr class="tablerow">
                    <td id="demoStorage" class="copy-link">demoStorage</td>
                    <td>Defines your storage URL where the demo examples are stored.</td>
                    <td>string</td>
                    <td>"https://d2nlctn12v279m.cloudfront.net/assets/docs/samples/"</td>
                </tr>
                <tr class="tablerow">
                    <td id="oformsUrl" class="copy-link">oformsUrl</td>
                    <td>Defines your storage URL where the pdf sample files are stored.</td>
                    <td>string</td>
                    <td>"https://cmsoforms.onlyoffice.com/api/oforms?populate=*&locale=all"</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <p>You can add any other parameters to the config file. For example, URLs to other storages.</p>
    </li>
    <li>Create the <em>src/components</em> directory.</li>
    <li>For each component, create a separate folder in the <em>src/components</em> directory. In our example, we create three folders:
        <em>Comments</em>, <em>ContentControls</em>, and <em>Review</em>. All the related files will be placed in these folders (<em>css</em> files, <em>tsx</em> files, etc.).</li>
    <li>
        <p>Each component has its own story file that captures the rendered state of the UI component.
        These files store the component variations - <em>stories</em>.
        They will be placed in the <em>src</em> folder with the titles in the following format:</p>
        <pre>
component_name.stories.tsx
</pre>
    </li>
    <li>
        <p>Create the Document Editor component which implements the document editor with the specified configuration parameters.</p>
        <ol>
            <li>
                <p>Define the default export which provides information used by other stories:</p>
                <pre>
export default {
    "title": "DocumentEditor",
    "component": DocumentEditor,
    "parameters": {},
    "decorators": [
        (Story) =&gt; (
            &lt;div style={{ "height": "400px" }}&gt;
                &lt;Story /&gt;
            &lt;/div&gt;
        ),
    ],
    "argTypes": {
        "documentType": {
            "options": ["word", "cell", "slide"],
            "control": { "type": "select" },
        },
        "editorConfig_lang": {
            "options": [
                "en", "az", "be", "bg", "ca", "zh", "cs", "da", "nl", "fi",
                "fr", "gl", "de", "el", "hu", "id", "it", "ja", "ko", "lv",
                "lo", "nb", "pl", "pt", "ro", "ru", "sk", "sl", "es", "sv",
                "tr", "uk", "vi"
            ],
            "control": { "type": "select" },
        },
        "type": {
            "options": ["desktop", "mobile"],
            "control": { "type": "select" },
        },
        "events_onAppReady": { "action": "onAppReady" },
        "events_onDocumentStateChange": { "action": "onDocumentStateChange" },
        "events_onMetaChange": { "action": "onMetaChange" },
        "events_onDocumentReady": { "action": "onDocumentReady" },
        "events_onInfo": { "action": "onInfo" },
        "events_onWarning": { "action": "onWarning" },
        "events_onError": { "action": "onError" },
        "events_onRequestSharingSettings": { "action": "onRequestSharingSettings" },
        "events_onRequestRename": { "action": "onRequestRename" },
        "events_onMakeActionLink": { "action": "onMakeActionLink" },
        "events_onRequestInsertImage": { "action": "onRequestInsertImage" },
        "events_onRequestSaveAs": { "action": "onRequestSaveAs" },
        "events_onRequestMailMergeRecipients": { "action": "onRequestMailMergeRecipients" },
        "events_onRequestCompareFile": { "action": "onRequestCompareFile" },
        "events_onRequestEditRights": { "action": "onRequestEditRights" },
        "events_onRequestHistory": { "action": "onRequestHistory" },
        "events_onRequestHistoryClose": { "action": "onRequestHistoryClose" },
        "events_onRequestHistoryData": { "action": "onRequestHistoryData" },
        "events_onRequestRestore": { "action": "onRequestRestore" }
    },
} as ComponentMeta&lt;typeof DocumentEditor&gt;;
</pre>
                <p>You can find descriptions for the React component properties <a href="<%= Url.Action("react") %>#api">here</a>.</p>
            </li>
            <li>
                <p>Create the named exports to build out the Document Editor four states: FormTemplate, DocumentTemplate, SpreadsheetTemplate, and PresentationTemplate.
                    You can find the code for each story <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/DocumentEditor.stories.tsx" target="_blank">here</a>.
                    For example, for a document template:</p>
                <pre>
export const DocumentTemplate = Template.bind({});
DocumentTemplate.storyName = "Document";
DocumentTemplate.args = {
    "id": "docxEditor",
    "documentServerUrl": config.documentServerUrl,
    "config": {
        "document": {
            "fileType": "docx",
            "key": "docx" + Math.random(),
            "title": "demo.docx",
            "url": config.demoStorage + "demo.docx",
        },
        "documentType": "word",
    },
};
</pre>
            </li>
            <li>
                <p>Start Storybook to see the result:</p>
                <pre>
yarn storybook
</pre>
            </li>
        </ol>
    </li>
    <img class="screenshot max-width-832" alt="Document editor component" src="<%= Url.Content("~/content/img/editor/document-editor-component.png") %>" />
</ol>
