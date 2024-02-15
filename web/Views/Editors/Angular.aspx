<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html"

%><asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE 文档 Angular 组件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE 文档 Angular 组件</span>
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


    <h2 id="api" class="copy-link">ONLYOFFICE 文档 Angular 组件API</h2>
    <div class="header-gray">属性</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col class="table-type" />
            <col />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>类型</td>
                <td>默认</td>
                <td>描述</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="id" class="copy-link">id<span class="required">*</span></td>
                <td>string</td>
                <td>null</td>
                <td>组件唯一标识符。</td>
            </tr>
            <tr class="tablerow">
                <td id="documentServerUrl" class="copy-link">documentServerUrl<span class="required">*</span></td>
                <td>string</td>
                <td>null</td>
                <td>ONLYOFFICE 文档服务器的地址。</td>
            </tr>
            <tr class="tablerow">
                <td id="config" class="copy-link">config<span class="required">*</span></td>
                <td>object</td>
                <td>null</td>
                <td>用于使用令牌打开文件的 <a href="<%= Url.Action("config") %>">通用配置</a> 对象。</td>
            </tr>
            <tr class="tablerow">
                <td id="document_fileType" class="copy-link">document_fileType</td>
                <td>string</td>
                <td>null</td>
                <td>文件的类型。</td>
            </tr>
            <tr class="tablerow">
                <td id="document_title" class="copy-link">document_title</td>
                <td>string</td>
                <td>null</td>
                <td>文件名。</td>
            </tr>
            <tr class="tablerow">
                <td id="documentType" class="copy-link">documentType</td>
                <td>string</td>
                <td>null</td>
                <td>文档类型。</td>
            </tr>
            <tr class="tablerow">
                <td id="height" class="copy-link">height</td>
                <td>string</td>
                <td>null</td>
                <td>定义浏览器窗口中的文档高度。</td>
            </tr>
            <tr class="tablerow">
                <td id="type" class="copy-link">type</td>
                <td>string</td>
                <td>null</td>
                <td>定义用于访问文档的平台类型（桌面、移动或嵌入式）。</td>
            </tr>
            <tr class="tablerow">
                <td id="width" class="copy-link">width</td>
                <td>string</td>
                <td>null</td>
                <td>定义浏览器窗口中的文档宽度。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onAppReady" class="copy-link">events_onAppReady</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当应用程序加载到浏览器时调用的函数。 当应用程序加载到浏览器中时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onDocumentStateChange" class="copy-link">events_onDocumentStateChange</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>修改文档时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onMetaChange" class="copy-link">events_onMetaChange</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>通过 meta 命令更改文档的元信息时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onDocumentReady" class="copy-link">events_onDocumentReady</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>将文档加载到文档编辑器时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onInfo" class="copy-link">events_onInfo</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>应用程序打开文件时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onWarning" class="copy-link">events_onWarning</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>发生警告时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onError" class="copy-link">events_onError</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>发生错误或其他特定事件时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestSharingSettings" class="copy-link">events_onRequestSharingSettings</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户尝试通过单击 <b>“更改访问权限”</b> 按钮来管理文档访问权限时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestRename" class="copy-link">events_onRequestRename</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户尝试通过单击 <b>“重命名...”</b> 按钮重命名文件时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onMakeActionLink" class="copy-link">events_onMakeActionLink</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户试图获取打开包含书签的文档的链接，滚动到书签位置时，调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestInsertImage" class="copy-link">events_onRequestInsertImage</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户尝试通过单击 <b>“来自存储的图像”</b> 按钮插入图像时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestSaveAs" class="copy-link">events_onRequestSaveAs</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户尝试通过单击 <b>“另存为...”</b> 按钮来保存文件时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestMailMergeRecipients" class="copy-link">events_onRequestMailMergeRecipients</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户尝试通过单击<b> </b> <b>“邮件合并”</b> 按钮来选择收件人数据时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestCompareFile" class="copy-link">events_onRequestCompareFile</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户尝试通过单击 <b>“存储中的文档”</b> 按钮来选择要比较的文档时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestEditRights" class="copy-link">events_onRequestEditRights</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户尝试通过单击 <b>“编辑文档”</b> 按钮将文档从查看模式切换到编辑模式时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestHistory" class="copy-link">events_onRequestHistory</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户尝试通过单击 <b>“版本历史记录”</b> 按钮来显示文档版本历史记录时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestHistoryClose" class="copy-link">events_onRequestHistoryClose</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户试图通过单击 <b>“关闭历史记录”</b> 按钮从查看文档版本历史记录返回到文档时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestHistoryData" class="copy-link">events_onRequestHistoryData</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户试图单击文档版本历史记录中的特定文档版本时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestRestore" class="copy-link">events_onRequestRestore</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>当用户尝试通过单击版本历史记录中的 <b>“恢复”</b> 按钮来恢复文件版本时调用的函数。</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <span class="required-descr"><span class="required">*</span><em> - 必填字段</em></span>


    <h2 id="development" class="copy-link">开发 ONLYOFFICE 文档 Angular 组件</h2>
    <ol>
        <li>
            <p>从 GitHub 存储库克隆项目：</p>
            <pre>
git clone https://github.com/ONLYOFFICE/document-editor-angular-workspace.git
</pre>
        </li>
        <li>
            <p>安装项目依赖：</p>
            <pre>
npm install
</pre>
        </li>
        <li>
            <p>构建项目：</p>
            <pre>
cd ./projects

ng build @onlyoffice/document-editor-angular
</pre>
        </li>
        <li>
            <p>创建包：</p>
            <pre>
cd ./dist/onlyoffice/document-editor-angular

npm pack
</pre>
        </li>
        <li>
            <p>测试组件：</p>
            <pre>
cd ./projects

ng test @onlyoffice/document-editor-angular
</pre>
        </li>
    </ol>


    <h2 id="feedback" class="copy-link">反馈和支持</h2>
    <p>如果您对 ONLYOFFICE 文档 Angular 组件有任何问题、疑问或建议，请参阅 <a href="https://github.com/ONLYOFFICE/document-editor-angular-workspace/issues" target="_blank">问题</a> 部分。</p>


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
