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

    <p>ONLYOFFICE Docs Angular <a href="https://github.com/ONLYOFFICE/document-editor-angular-workspace" target="_blank">组件</a>将 ONLYOFFICE Docs 集成到 <a href="https:/ /angularjs.org/" target="_blank">Angular</a> 项目。</p>

    <h2 id="prerequisites" class="copy-link">先决条件</h2>
    <p>此过程需要 <a href="https://nodejs.org/en" target="_blank">Node.js（和 npm）</a>。</p>

    <h2 id="demo-angular-app" class="copy-link">使用 ONLYOFFICE 文档编辑器创建演示 Angular 应用程序</h2>
    <p>此过程创建一个<a href="https://angular.io/guide/setup-local" target="_blank">基本 Angular 应用程序</a>，并在其中安装 ONLYOFFICE 文档编辑器。</p>
    <ol>
        <li>
            <p>打开命令行或命令提示符并安装 <a href="https://angular.io/cli" target="_blank">Angular CLI Tool</a> 包：</p>
            <pre>
npm install -g @angular/cli
</pre>
        </li>
        <li>
            <p>创建一个名为 <em>onlyoffice-angular-demo</em> 的新 Angular 项目：</p>
            <pre>
ng new --defaults --skip-git onlyoffice-angular-demo
</pre>
        </li>
        <li>
            <p>进入新创建的目录：</p>
            <pre>
cd onlyoffice-angular-demo
</pre>
        </li>
        <li>
            <p>从 <b>npm</b> 安装 ONLYOFFICE Docs Angular 组件，并使用 <em>--save</em> 将其保存到 <em>package.json</em> 文件中：</p>
            <pre>
npm install --save @onlyoffice/document-editor-angular
</pre>
            <p>您还可以使用以下 <b>yarn</b> 命令：</p>
            <pre>
yarn add @onlyoffice/document-editor-angular
</pre>
        </li>
    </ol>

    <p>以下步骤取决于您使用的 Angular 版本。 要检查已安装的版本，请运行以下命令：</p>
    <pre>
ng version
</pre>

    <div class="container">
        <ul class="browser">
            <li class="browser tab active copy-link" id="old-versions">17.0.0 之前的版本</li>
            <li class="browser tab copy-link" id="new-versions">17.0.0 及以上的版本</li>
        </ul>
        <div id="old-versions" class="content active">
            <ol>
                <li>
                    <p>打开 <em>onlyoffice-angular-demo</em> 项目中的 <em>./src/app/app.module.ts</em> 文件并导入 <b>DocumentEditorModule</b>：</p>
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
                    <p>打开 <em>onlyoffice-angular-demo</em> 项目中的 <em>./src/app/app.component.ts</em> 文件，并在您的使用组件中定义选项：</p>
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
                    <p>将以下行替换为您自己的数据：</p>
                    <ul>
                        <li><b>"https://example.com/url-to-example-document.docx"</b> - 替换为您的文件的 URL；</li>
                        <li><b>"https://example.com/url-to-callback.ashx"</b> - 替换为您的回调 URL（这是保存功能正常工作所必需的）。</li>
                    </ul>
                    <p>此 TypeScript 文件将创建 <em>AppComponent</em> 组件，其中包含配置了基本功能的 ONLYOFFICE 文档编辑器。</p>
                </li>
                <li>
                    <p>在模板中，将<em>文档编辑器</em>组件与您的选项一起使用：</p>
                    <pre>
&lt;document-editor
    id="docxEditor"
    documentServerUrl="http://documentserver/"
    [config]="config"
    [events_onDocumentReady]="onDocumentReady"
&gt;&lt;/document-editor&gt;
</pre>
                    <p>将 <b>"http://documentserver/"</b> 行替换为您的服务器的 URL。</p>
                </li>
            </ol>
        </div>
        <div id="new-versions" class="content">
            <ol>
                <li>
                    <p>打开 <em>onlyoffice-angular-demo</em> 项目中的 <em>./src/app/app.component.ts</em> 文件，并在您的使用组件中定义选项：</p>
                    <note>请注意，从 Angular v17.0.0 开始，默认情况下，<em>app.module.ts</em> 文件不会添加到新项目中。
                        您必须在 <em>Component</em> 装饰器的 <em>imports</em> 属性中指定 <em>DocumentEditorModule</em>，并将 <em>standalone</em> 设置为 <em>true</em>。</note>
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
                    <p>将以下行替换为您自己的数据：</p>
                    <ul>
                        <li><b>"https://example.com/url-to-example-document.docx"</b> - 替换为您的文件的 URL；</li>
                        <li><b>"https://example.com/url-to-callback.ashx"</b> - 替换为您的回调 URL（这是保存功能正常工作所必需的）。</li>
                    </ul>
                    <p>此 TypeScript 文件将创建 <em>AppComponent</em> 组件，其中包含配置了基本功能的 ONLYOFFICE 文档编辑器。</p>
                </li>
                <li>
                    <p>在模板中，将<em>document-editor</em>组件与您的选项一起使用：</p>
                    <pre>
&lt;document-editor
    id="docxEditor"
    documentServerUrl="http://documentserver/"
    [config]="config"
    [events_onDocumentReady]="onDocumentReady"
&gt;&lt;/document-editor&gt;
</pre>
                    <p>将 <b>"http://documentserver/"</b> 行替换为您的服务器的 URL。</p>
                </li>
            </ol>
        </div>
    </div>
    <p>使用 Node.js 开发服务器测试应用程序：</p>
    <ul>
        <li>
            <p>要启动开发服务器，请导航到 <em>onlyoffice-angular-demo</em> 目录并运行：</p>
            <pre>
npm run start
</pre>
        </li>
        <li>要停止开发服务器，请选择命令行或命令提示符，然后按 <em>Ctrl+C</em>。</li>
    </ul>


    <h2 id="deploy" class="copy-link">部署演示 Angular 应用程序</h2>
    <p>要将应用程序部署到产品环境，请为 Angular 项目创建特定于构建的配置选项：</p>
    <ol>
        <li>
            <p>创建 <em>src/environments/</em> 目录并通过运行以下命令将项目配置来使用这些文件：</p>
            <pre>
ng generate environments
</pre>
            <p>新创建的目录包含<em>environment.ts</em>基本配置文件，它提供默认<em>production</em>环境的配置。
                可以在特定于目标的配置文件中覆盖其他环境的默认值，例如<em>development</em>和<em>staging</em>。</p>
                <p>基础 <em>environment.ts</em> 文件包含默认环境设置：</p>
                <pre>
export const environment = {
    production: false
}
</pre>
            <p>当未指定环境时，<em>build</em> 命令使用它作为构建目标。</p>
            <p>您可以将其他属性添加到<em>environment</em>对象中，或者作为单独的对象。
                例如，默认的 <em>apiUrl</em> 变量被添加到默认环境中：</p>
                <pre>
export const environment = {
    production: true,
    apiUrl: "http://my-prod-url"
};
</pre>
            <p>特定于目标的配置文件（例如<em>environment.development.ts</em>）为<em>development</em>构建目标设置默认值：</p>
            <pre>
export const environment = {
    production: true
}
</pre>
        </li>
        <li>
            <p>在 <em>app.component.ts</em> 组件文件中导入原始环境文件，以使用您定义的环境配置：</p>
            <pre>
import { environment } from "./../environments/environment";
</pre>
            <p>这可确保 <em>build</em> 和 <em>serve</em> 命令可以找到特定构建目标的配置。</p>
        </li>
        <li>
            <p>将 <em>fileReplacements</em> 参数添加到 <em>angular.json</em> 配置文件的每个构建目标的配置中。
                此参数将 TypeScript 程序中的任何文件替换为特定于目标的文件版本，并在针对特定环境的构建中包含特定于目标的代码或变量，
                例如<em>development</em>或<em>staging</em>。</p>
            <p>默认情况下不替换任何文件。 但您可以为特定构建目标添加文件替换：</p>
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
            <p>这意味着当您使用<em>ng build --configurationdevelopment</em>构建开发配置时，
                <em>src/environments/environment.ts</em> 文件将替换为 <em>src/environments/environment.development.ts</em> 特定目标的文件版本。</p>
            <p>您可以添加其他配置。 例如，要添加 <em>staging</em> 环境，请复制 <em>src/environments/environment.ts</em> 文件以及
                <em>src/environments/environment.staging.ts</em> 标题，然后将 <em>staging</em> 配置添加到 <em>angular.json</em>：</p>
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
            <p>>将 <em>serve</em> 命令配置为使用目标构建配置，方法是将其添加到 <em>angular.json</em> 的 <em>serve.configurations</em> 部分：</p>
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
    <p>现在您可以将应用程序部署到创建的服务器：</p>
    <ol>
        <li>
            <p>导航到 <em>onlyoffice-angular-demo</em> 目录并运行：</p>
            <pre>
ng build
</pre>
            <p><em>dist</em> 目录将使用您的应用程序的产品版本创建。</p>
        </li>
        <li>
            <p>将 <em>dist/onlyoffice-angular-demo</em> 目录的内容复制到 Web 服务器的根目录（复制到 <em>onlyoffice-angular-demo</em> 文件夹）。</p>
        </li>
    </ol>
    <p>该应用程序将部署在 Web 服务器上（默认情况下<em>http://localhost:3000</em>）。</p>


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
