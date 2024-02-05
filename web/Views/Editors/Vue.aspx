<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE 文档 Vue 组件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE 文档 Vue 组件</span>
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

    <h2 id="api" class="copy-link">ONLYOFFICE 文档 Vue 组件 API</h2>
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
                <td>当用户尝试通过单击 <b>更改访问权限</b> 按钮来管理文档访问权限时调用的函数。</td>
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


    <h2 id="storybook" class="copy-link">安装Storybook</h2>
    <p>安装 <a href="https://storybook.js.org/" target="_blank">Storybook</a> 以独立开发UI组件：</p>
    <ol>
        <li>
            <p>更改 <em>config/default.json</em> 文件中文档服务器的地址：</p>
            <pre>
"documentServerUrl": "http://documentserver/";
</pre>
            <p>其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE 文档</b> 的服务器的名称。</p>
        </li>
        <li>
            <p>使用以下命令生成Storybook：</p>
            <pre>
npm run build-storybook
</pre>
        </li>
        <li>
            <p>启动Storybook:</p>
            <pre>
npm run storybook
</pre>
        </li>
    </ol>


    <h2 id="development" class="copy-link">开发ONLYOFFICE 文档 Vue组件</h2>
    <ol>
        <li>
            <p>从 GitHub 存储库克隆项目：</p>
            <pre>
git clone https://github.com/ONLYOFFICE/document-editor-vue
</pre>
        </li>
        <li>
            <p>安装项目依赖：</p>
            <pre>
npm install
</pre>
        </li>
        <li>
            <p>测试组件：</p>
            <pre>
npm run test
</pre>
        </li>
        <li>
            <p>构建项目：</p>
            <pre>
npm run build
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
    <p>如果您对 ONLYOFFICE 文档 Vue有任何问题、疑问或建议，请参阅 <a href="https://github.com/ONLYOFFICE/document-editor-vue/issues" target="_blank">问题</a> 部分。</p>


</asp:Content>
