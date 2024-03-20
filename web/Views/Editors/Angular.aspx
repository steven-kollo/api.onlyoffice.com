<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Docs Angular component
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE Docs Angular component</span>
    </h1>

    <p>The ONLYOFFICE Docs Angular <a href="https://github.com/ONLYOFFICE/document-editor-angular-workspace" target="_blank">component</a> integrates ONLYOFFICE Docs into <a href="https://angularjs.org/" target="_blank">Angular</a> projects.</p>

    <h2 id="prerequisites" class="copy-link">Prerequisites</h2>
    <p>This procedure requires <a href="https://nodejs.org/en" target="_blank">Node.js (and npm)</a>.</p>

    <h2 id="demo-angular-app" class="copy-link">Creating the demo Angular application with ONLYOFFICE Docs editor</h2>
    <p>This procedure creates a <a href="https://angular.io/guide/setup-local" target="_blank">basic Angular application</a> and installs an ONLYOFFICE Docs editor in it.</p>
    <ol>
        <li>
            <p>Open a command line or command prompt and install the <a href="https://angular.io/cli" target="_blank">Angular CLI Tool</a> package:</p>
            <pre>
npm install -g @angular/cli
</pre>
        </li>
        <li>
            <p>Create a new Angular project named <em>onlyoffice-angular-demo</em>:</p>
            <pre>
ng new --defaults --skip-git onlyoffice-angular-demo
</pre>
        </li>
        <li>
            <p>Go to the newly created directory:</p>
            <pre>
cd onlyoffice-angular-demo
</pre>
        </li>
        <li>
            <p>Install ONLYOFFICE Docs Angular component from <b>npm</b> and save it to the <em>package.json</em> file with <em>--save</em>:</p>
            <pre>
npm install --save @onlyoffice/document-editor-angular
</pre>
            <p>You can also use the following <b>yarn</b> command:</p>
            <pre>
yarn add @onlyoffice/document-editor-angular
</pre>
        </li>
    </ol>

    <p>The following steps depend on the Angular version you use. To check the installed version, run the following command:</p>
    <pre>
ng version
</pre>

    <div class="container">
        <ul class="browser">
            <li class="browser tab active copy-link" id="old-versions">Versions prior to 17.0.0</li>
            <li class="browser tab copy-link" id="new-versions">Versions 17.0.0 and above</li>
        </ul>
        <div id="old-versions" class="content active">
            <ol>
                <li>
                    <p>Open the <em>./src/app/app.module.ts</em> file in the <em>onlyoffice-angular-demo</em> project and import the <b>DocumentEditorModule</b>:</p>
                    <pre>
import { NgModule } from "@angular/core";
import { DocumentEditorModule } from "@onlyoffice/document-editor-angular";
import { AppComponent } from "./app.component";
import { BrowserModule } from "@angular/platform-browser";

@NgModule({
    declarations: [
        AppComponent
    ],
    imports: [
        DocumentEditorModule,
        BrowserModule
    ],
    bootstrap: [AppComponent]
})

export class AppModule { }
 </pre>
                </li>
                <li>
                    <p>Open the <em>./src/app/app.component.ts</em> file in the <em>onlyoffice-angular-demo</em> project and define options in your consuming component:</p>
                    <pre>
import { Component } from "@angular/core";
import { IConfig } from "@onlyoffice/document-editor-angular";

@Component({
    selector: "app-root",
    templateUrl: "./app.component.html"
})
export class AppComponent {
    config: IConfig = {
        document: {
            "fileType": "docx",
            "key": "Khirz6zTPdfd7",
            "title": "Example Document Title.docx",
            "url": "https://example.com/url-to-example-document.docx"
        },
        documentType: "word",
        editorConfig: {
            "callbackUrl": "https://example.com/url-to-callback.ashx"
        },
    }

    onDocumentReady = () => {
        console.log("Document is loaded");
    };

    onLoadComponentError = (errorCode, errorDescription) => {
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
}
</pre>
                    <p>Replace the following lines with your own data:</p>
                    <ul>
                        <li><b>"https://example.com/url-to-example-document.docx"</b> - replace with the URL to your file;</li>
                        <li><b>"https://example.com/url-to-callback.ashx"</b> - replace with your callback URL (this is required for the saving functionality to work).</li>
                    </ul>
                    <p>This TypeScript file will create the <em>AppComponent</em> component containing the ONLYOFFICE Docs editor configured with basic features.</p>
                </li>
                <li>
                    <p>In template, use the <em>document-editor</em> component with your options:</p>
                    <pre>
&lt;document-editor
    id="docxEditor"
    documentServerUrl="http://documentserver/"
    [config]="config"
    [events_onDocumentReady]="onDocumentReady"
    [onLoadComponentError]="onLoadComponentError"
&gt;&lt;/document-editor&gt;
</pre>
                    <p>Replace the <b>"http://documentserver/"</b> line with the URL of your server.</p>
                </li>
            </ol>
        </div>
        <div id="new-versions" class="content">
            <ol>
                <li>
                    <p>Open the <em>./src/app/app.component.ts</em> file in the <em>onlyoffice-angular-demo</em> project and define options in your consuming component:</p>
                    <note>Please note that starting from Angular v17.0.0, the <em>app.module.ts</em> file is not added to the new projects by default.
                        You must specify <em>DocumentEditorModule</em> in the <em>imports</em> property of the <em>Component</em> decorator and set <em>standalone</em> to <em>true</em>.</note>
                    <pre>
import { Component } from "@angular/core";
import { IConfig } from "@onlyoffice/document-editor-angular";
import { DocumentEditorModule } from "@onlyoffice/document-editor-angular";

@Component({
    selector: "app-root",
    standalone: true,
    imports: [DocumentEditorModule],
    templateUrl: "./app.component.html"
})
export class AppComponent {
    config: IConfig = {
        document: {
            "fileType": "docx",
            "key": "Khirz6zTPdfd7",
            "title": "Example Document Title.docx",
            "url": "https://example.com/url-to-example-document.docx"
        },
        documentType: "word",
        editorConfig: {
            "callbackUrl": "https://example.com/url-to-callback.ashx"
        },
    }

    onDocumentReady = () => {
        console.log("Document is loaded");
    };

    onLoadComponentError = (errorCode, errorDescription) => {
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
}
</pre>
                    <p>Replace the following lines with your own data:</p>
                    <ul>
                        <li><b>"https://example.com/url-to-example-document.docx"</b> - replace with the URL to your file;</li>
                        <li><b>"https://example.com/url-to-callback.ashx"</b> - replace with your callback URL (this is required for the saving functionality to work).</li>
                    </ul>
                    <p>This TypeScript file will create the <em>AppComponent</em> component containing the ONLYOFFICE Docs editor configured with basic features.</p>
                </li>
                <li>
                    <p>In template, use the <em>document-editor</em> component with your options:</p>
                    <pre>
&lt;document-editor
    id="docxEditor"
    documentServerUrl="http://documentserver/"
    [config]="config"
    [events_onDocumentReady]="onDocumentReady"
    [onLoadComponentError]="onLoadComponentError"
&gt;&lt;/document-editor&gt;
</pre>
                    <p>Replace the <b>"http://documentserver/"</b> line with the URL of your server.</p>
                </li>
            </ol>
        </div>
    </div>
    <p>Test the application using the Node.js development server:</p>
    <ul>
        <li>
            <p>To start the development server, navigate to the <em>onlyoffice-angular-demo</em> directory and run:</p>
            <pre>
npm run start
</pre>
        </li>
        <li>To stop the development server, select on the command line or command prompt and press <em>Ctrl+C</em>.</li>
    </ul>


    <h2 id="deploy" class="copy-link">Deploying the demo Angular application</h2>
    <p>To deploy the application to a production environment, create the build-specific configuration options for Angular projects:</p>
    <ol>
        <li>
            <p>Create the <em>src/environments/</em> directory and configure the project to use these files by running the following command:</p>
            <pre>
ng generate environments
</pre>
            <p>The newly created directory contains the <em>environment.ts</em> base configuration file, which provides configuration for the default <em>production</em> environment.
                The default values can be overridden for the additional environments, such as <em>development</em> and <em>staging</em>, in target-specific configuration files.</p>
                <p>The base <em>environment.ts</em> file contains the default environment settings:</p>
                <pre>
export const environment = {
    production: false
}
</pre>
            <p>The <em>build</em> command uses this as the build target when no environment is specified.</p>
            <p>You can add additional properties to the <em>environment</em> object, or as separate objects.
                For example, the default <em>apiUrl</em> variable is added to the default environment:</p>
                <pre>
export const environment = {
    production: true,
    apiUrl: "http://my-prod-url"
};
</pre>
            <p>The target-specific configuration files, such as <em>environment.development.ts</em>, set default values for the <em>development</em> build target:</p>
            <pre>
export const environment = {
    production: true
}
</pre>
        </li>
        <li>
            <p>Import the original environment file in the <em>app.component.ts</em> component file to use the environment configurations you have defined:</p>
            <pre>
import { environment } from "./../environments/environment";
</pre>
            <p>This ensures that the <em>build</em> and <em>serve</em> commands can find the configurations for the specific build targets.</p>
        </li>
        <li>
            <p>Add the <em>fileReplacements</em> parameter to the configuration for each build target of the <em>angular.json</em> configuration file.
                This parameter replaces any file in the TypeScript program with the target-specific file version and includes the target-specific code or variables
                in a build that targets a specific environment, such as <em>development</em> or <em>staging</em>.</p>
            <p>By default no files are replaced. But you can add file replacements for the specific build targets:</p>
            <pre>
"configurations": {
    "development": {
        "fileReplacements": [
            {
                "replace": "src/environments/environment.ts",
                "with": "src/environments/environment.development.ts"
            }
        ],
        ...
    }
}
</pre>
            <p>This means that when you build your development configuration with <em>ng build --configuration development</em>,
                the <em>src/environments/environment.ts</em> file is replaced with the <em>src/environments/environment.development.ts</em> target-specific version of the file.</p>
            <p>You can add additional configurations. For example, to add a <em>staging</em> environment, copy the <em>src/environments/environment.ts</em> file
                with the <em>src/environments/environment.staging.ts</em> title, then add a <em>staging</em> configuration to <em>angular.json</em>:</p>
            <pre>
"configurations": {
    "production": { ... },
    "staging": {
        "fileReplacements": [
            {
                "replace": "src/environments/environment.ts",
                "with": "src/environments/environment.staging.ts"
            }
        ]
    }
}
</pre>
        </li>
        <li>
            <p>Configure the <em>serve</em> command to use the targeted build configuration by adding it to the <em>serve.configurations</em> section of <em>angular.json</em>:</p>
            <pre>
"serve": {
    "builder": "@angular-devkit/build-angular:dev-server",
    "configurations": {
        "production": {
            "browserTarget": "document-editor-angular-workspace:build:production"
        },
        "development": {
            "browserTarget": "document-editor-angular-workspace:build:development"
        }
    }
}
</pre>
        </li>
    </ol>
    <p>Now you can deploy the application to the created server:</p>
    <ol>
        <li>
            <p>Navigate to the <em>onlyoffice-angular-demo</em> directory and run:</p>
            <pre>
ng build
</pre>
            <p>The <em>dist</em> directory will be created with a production build of your app.</p>
        </li>
        <li>
            <p>Copy the contents of the <em>dist/onlyoffice-angular-demo</em> directory to the root directory of the web server (to the <em>onlyoffice-angular-demo</em> folder).</p>
        </li>
    </ol>
    <p>The application will be deployed on the web server (<em>http://localhost:3000</em> by default).</p>


    <h2 id="api" class="copy-link">ONLYOFFICE Docs Angular component API</h2>
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


    <h2 id="development" class="copy-link">Developing ONLYOFFICE Docs Angular component</h2>
    <ol>
        <li>
            <p>Clone project from the GitHub repository:</p>
            <pre>
git clone https://github.com/ONLYOFFICE/document-editor-angular-workspace.git
</pre>
        </li>
        <li>
            <p>Install the project dependencies:</p>
            <pre>
npm install
</pre>
        </li>
        <li>
            <p>Build the project:</p>
            <pre>
cd ./projects

ng build @onlyoffice/document-editor-angular
</pre>
        </li>
        <li>
            <p>Create the package:</p>
            <pre>
cd ./dist/onlyoffice/document-editor-angular

npm pack
</pre>
        </li>
        <li>
            <p>Test the component:</p>
            <pre>
cd ./projects

ng test @onlyoffice/document-editor-angular
</pre>
        </li>
    </ol>


    <h2 id="feedback" class="copy-link">Feedback and support</h2>
    <p>In case you have any issues, questions, or suggestions for the ONLYOFFICE Docs Angular component, please refer to the <a href="https://github.com/ONLYOFFICE/document-editor-angular-workspace/issues" target="_blank">Issues</a> section.</p>


    <script type="text/javascript">
        $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
            $(this)
            .addClass('active').siblings().removeClass('active')
            .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
        });
        var loc = window.location.hash;
        if (loc != "") {
            var id = loc.substring(1);;
            $('.browser .tab').removeClass('active');
            $('.browser .tab[id="'+id  +'"]').addClass('active');
            $('.content').removeClass('active');
            $('.content[id="'+id  +'"]').addClass('active');
        }
    </script>

</asp:Content>
