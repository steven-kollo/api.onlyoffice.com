<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE 文档 React 组件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE 文档 React 组件</span>
    </h1>

    <p>ONLYOFFICE 文档 React <a href="https://github.com/ONLYOFFICE/document-editor-react" target="_blank">组件</a> 将ONLYOFFICE Docs集成到 <a href="https://react.dev/" target="_blank">React</a> 项目。

    <h2 id="prerequisites" class="copy-link">先决条件</h2>
    <p>此过程需要 <a href="https://nodejs.org/en" target="_blank">Node.js（和 npm）</a>。</p>

    <h2 id="demo-react-app" class="copy-link">使用 ONLYOFFICE 文档编辑器创建演示 React 应用程序</h2>
    <p>此过程创建一个<a href="https://github.com/facebook/create-react-app" target="_blank">基本 React 应用程序</a>，并在其中安装 ONLYOFFICE 文档编辑器。</p>
    <ol>
        <li>
            <p>使用 <em>Create React App</em> 包创建一个名为 <em>onlyoffice-react-demo</em> 的新 React 项目：</p>
            <pre>
npx create-react-app onlyoffice-react-demo
</pre>
        </li>
        <li>
            <p>进入新创建的目录：</p>
            <pre>
cd onlyoffice-react-demo
</pre>
        </li>
        <li>
            <p>从 <b>npm</b> 安装 ONLYOFFICE Docs React 组件，并使用 <em>--save</em> 将其保存到 <em>package.json</em> 文件中：</p>
            <pre>
npm install --save @onlyoffice/document-editor-react
</pre>
            <p>您还可以使用以下 <b>yarn</b> 命令：</p>
            <pre>
yarn add @onlyoffice/document-editor-react
</pre>
        </li>
        <li>
            <p>打开 <em>onlyoffice-react-demo</em> 项目中的 <em>./src/App.js</em> 文件，并将其内容替换为以下代码：</p>
            <pre>
import React, { useRef } from 'react';
import { DocumentEditor } from "@onlyoffice/document-editor-react";

var onDocumentReady = function (event) {
    console.log("Document is loaded");
};

var onLoadComponentError = function (errorCode, errorDescription) {
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
};

export default function App() {
    return (
        &lt;&gt;
            &lt;DocumentEditor
                id="docxEditor"
                documentServerUrl="http://documentserver/"
                config={{
                    "document": {
                        "fileType": "docx",
                        "key": "Khirz6zTPdfd7",
                        "title": "Example Document Title.docx",
                        "url": "https://example.com/url-to-example-document.docx"
                    },
                    "documentType": "word",
                    "editorConfig": {
                        "callbackUrl": "https://example.com/url-to-callback.ashx"
                    }
                }}
                events_onDocumentReady={onDocumentReady}
                onLoadComponentError={onLoadComponentError}
            /&gt;
        &lt;/&gt;
    );
}
</pre>
            <p>将以下行替换为您自己的数据：</p>
            <ul>
                <li><b>"http://documentserver/"</b> - 替换为您的服务器的 URL；</li>
                <li><b>"https://example.com/url-to-example-document.docx"</b> - 替换为您的文件的 URL；</li>
                <li><b>"https://example.com/url-to-callback.ashx"</b> - 替换为您的回调 URL（这是保存功能正常工作所必需的）。</li>
            </ul>
            <p>此 JavaScript 文件将创建 <em>App</em> 组件，其中包含配置了基本功能的 ONLYOFFICE 文档编辑器。</p>
        </li>
        <li>
            <p>使用 Node.js 开发服务器测试应用程序：</p>
            <ul>
                <li>
                    <p>要启动开发服务器，请导航到 <em>onlyoffice-react-demo</em> 目录并运行：</p>
                    <pre>
npm run start
</pre>
                </li>
                <li>要停止开发服务器，请选择命令行或命令提示符，然后按 <em>Ctrl+C</em>。</li>
            </ul>
        </li>
    </ol>
    
    <h2 id="deploy" class="copy-link">部署演示 React 应用程序</h2>
    <p>将应用程序部署到产品环境的最简单方法是安装 <a href="https://github.com/vercel/serve" target="_blank">serve</a> 并创建静态服务器：</p>
    <ol>
        <li>
            <p>全局安装 <em>serve</em> 包：</p>
            <pre>
npm install -g serve
</pre>
        </li>
        <li>
            <p>在 3000 端口上为您的静态站点提供服务：</p>
            <pre>
serve -s build
</pre>
            <p>可以使用 <em>-l</em> 或 <em>--listen</em> 标志调整另一个端口：</p>
            <pre>
serve -s build -l 4000
</pre>
        </li>
        <li>
            <p>要提供服务给项目文件夹，请转到该文件夹并运行 <em>serve</em> 命令：</p>
            <pre>
cd onlyoffice-react-demo
serve
</pre>
        </li>
    </ol>
    <p>现在您可以将应用程序部署到创建的服务器：</p>
    <ol>
        <li>
            <p>导航到 <em>onlyoffice-react-demo</em> 目录并运行：</p>
            <pre>
npm run build
</pre>
            <p><em>build</em> 目录将使用您的应用程序的产品版本创建。</p>
        </li>
        <li>
            <p>将 <em>onlyoffice-react-demo/build</em> 目录的内容复制到 Web 服务器的根目录（复制到 <em>onlyoffice-react-demo</em> 文件夹）。</p>
        </li>
    </ol>
    <p>该应用程序将部署在 Web 服务器上（默认情况下<em>http://localhost:3000</em>）。</p>

    <h2 id="api" class="copy-link">ONLYOFFICE 文档 React 组件 API</h2>
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
                <td id="onLoadComponentError" class="copy-link">onLoadComponentError</td>
                <td>(errorCode: number, errorDescription: string) => void</td>
                <td>null</td>
                <td>加载组件时发生错误时调用的函数。</td>
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
                <td>当用户试图获取打开包含书签的文档的链接时调用的函数，滚动到书签位置。</td>
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
                <td>当用户尝试通过单击<b> </b><b>“邮件合并”</b> 按钮来选择收件人数据时调用的函数。</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestCompareFile" class="copy-link">events_onRequestCompareFile</td>
                <td>(event: object) =&gt; void</td>
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


    <h2 id="storybook" class="copy-link">安装Storybook</h2>
    <p>安装 <a href="https://storybook.js.org/" target="_blank">Storybook</a> 以独立开发UI组件：</p>
    <ol>
        <li>
            <p>更改 <em>config/default.json</em> 文件中文档服务器的地址：</p>
            <pre>
"documentServerUrl": "http://documentserver/"
</pre>
            <p>其中 documentserver 是安装了 <b>ONLYOFFICE 文档</b> 的服务器的名称。</p>
        </li>
        <li>
            <p>使用以下命令生成Storybook：</p>
            <pre>
yarn build-storybook
</pre>
        </li>
        <li>
            <p>启动Storybook:</p>
            <pre>
yarn storybook
</pre>
        </li>
    </ol>


    <h2 id="development" class="copy-link">开发ONLYOFFICE 文档 React组件</h2>
    <ol>
        <li>
            <p>从 GitHub 存储库克隆项目：</p>
            <pre>
git clone https://github.com/ONLYOFFICE/document-editor-react
</pre>
        </li>
        <li>
            <p>安装项目依赖：</p>
            <pre>
yarn install
</pre>
        </li>
        <li>
            <p>测试组件：</p>
            <pre>
yarn test
</pre>
        </li>
        <li>
            <p>构建项目：</p>
            <pre>
yarn rollup
</pre>
        </li>
        <li>
            <p>创建包：</p>
            <pre>
npm pack
</pre>
        </li>
    </ol>


    <h2 id="feedback" class="copy-link">反馈和支持</h2>
    <p>如果您对 ONLYOFFICE 文档 React件有任何问题、疑问或建议，请参阅 <a href="https://github.com/ONLYOFFICE/document-editor-react/issues" target="_blank">问题</a> 部分。</p>


</asp:Content>
