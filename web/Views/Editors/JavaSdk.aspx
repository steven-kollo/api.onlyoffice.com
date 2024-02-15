<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    使用 Java SDK 集成编辑器
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">使用 Java SDK 集成编辑器</span>
    </h1>

    <p class="dscr"><a href="https://central.sonatype.com/artifact/com.onlyoffice/docs-integration-sdk" target="_blank">ONLYOFFICE文档集成SDK</a>提供通用接口和默认实现，
        用于将ONLYOFFICE文档服务器集成到您自己的Java网站或应用程序中。</p>

    <h2 id="prerequisites" class="copy-link">先决条件</h2>
    <ul>
        <li><b>Java</b>：版本 11.x 及更高版本（从 <a href="https://www.oracle.com/java/technologies/downloads/#java11" target="_blank">Oracle官方网站 </a>下载）；</li>
        <li><b>Apache Maven</b>（从<a href="https://maven.apache.org/download.cgi" target="_blank">官方网站</a>下载）。</li>
    </ul>

    <h2 id="sdk-structure" class="copy-link">SDK结构</h2>
    <p>SDK由5个主要管理器和4个服务组成。</p>
    <div class="header-gray">管理器</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>管理器</td>
                <td>描述</td>
                <td>默认实现</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/document/DocumentManager.java" target="_blank">DocumentManager</a></td>
                <td>该管理器用于处理文件和文档格式。</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/document/DefaultDocumentManager.java" target="_blank">DefaultDocumentManager</a> (抽象)</td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/request/RequestManager.java" target="_blank">RequestManager</a></td>
                <td>该管理器用于向 ONLYOFFICE 文档服务器发出请求。</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/request/DefaultRequestManager.java" target="_blank">DefaultRequestManager</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/security/JwtManager.java" target="_blank">JwtManager</a></td>
                <td>该管理器用于生成和验证授权令牌。</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/security/DefaultJwtManager.java" target="_blank">DefaultJwtManager</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/settings/SettingsManager.java" target="_blank">SettingsManager</a></td>
                <td>该管理器用于管理集成应用程序设置。</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/settings/DefaultSettingsManager.java" target="_blank">DefaultSettingsManager</a> (抽象)</td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/url/UrlManager.java" target="_blank">UrlManager</a></td>
                <td>该管理器用作 URL 提供者。</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/url/DefaultUrlManager.java" target="_blank">DefaultUrlManager</a></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">服务</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>服务</td>
                <td>描述</td>
                <td>默认实现</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/documenteditor/config/ConfigService.java" target="_blank">ConfigService</a></td>
                <td>该配置生成服务用于打开文档编辑器。</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/documenteditor/config/DefaultConfigService.java" target="_blank">DefaultConfigService</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/documenteditor/callback/CallbackService.java" target="_blank">CallbackService</a></td>
                <td>该服务用于处理文档服务器的响应。</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/documenteditor/callback/DefaultCallbackService.java" target="_blank">DefaultCallbackService</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/convert/ConvertService.java" target="_blank">ConvertService</a></td>
                <td>该服务用于转换文档。</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/convert/DefaultConvertService.java" target="_blank">DefaultConvertService</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/settings/SettingsValidationService.java" target="_blank">SettingsValidationService</a></td>
                <td>该服务用于检查文档服务器连接设置。</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/settings/DefaultSettingsValidationService.java" target="_blank">DefaultSettingsValidationService</a></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="usage" class="copy-link">用法</h2>
    <p>让我们看一下<a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/tree/main/demo-example" target="_blank">演示示例</a>，
        它展示了 SDK 如何在经典 Spring Web 应用程序中工作：</p>
    <ol>
        <li>
            <p>实现抽象<b>DefaultSettingsManager</b> 类的方法：</p>
            <pre>
@Override
public String getSetting(final String name) {
    return properties.getProperty(name);
}

@Override
public void setSetting(final String name, final String value) {
    properties.setProperty(name, value);
}
</pre>
            <p>完整的示例代码可以在 <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/ manager/SettingsManagerImpl.java" target="_blank">此处</a>找到。</p>
        </li>
        <li>
            <p>实现抽象 <b>DefaultDocumentManager</b> 类的方法：</p>
            <pre>
@Override
public String getDocumentKey(final  String fileId, final boolean embedded) {
    return String.valueOf(fileId.hashCode());
}

@Override
public String getDocumentName(final String fileId) {
    return "sample.docx";
}
</pre>
            <p>完整的示例代码可以在 <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/ manager/DocumentManagerImpl.java" target="_blank">此处</a>找到。</p>
        </li>
        <li>
            <p>实现 <b>UrlManager</b> 方法。 要在编辑模式下打开编辑器，您需要定义：</p>
            <pre>
@Override
public String getFileUrl(final String fileId) {
    return getServerUrl() + "/file/download";
}

@Override
public String getCallbackUrl(final String fileId) {
    return getServerUrl() + "/callback";
}
</pre>
            <p>完整的示例代码可以在 <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/ manager/UrlMangerImpl.java" target="_blank">此处</a>找到。</p>
        </li>
        <li>
            <p>初始化 <b>JwtManager</b> 和 <b>RequestManager</b> Spring bean 并将它们添加到 DI 容器中。
                这允许您在应用程序中的任何位置调用注册的 bean：</p>
            <pre>
@Bean
public JwtManager jwtManager(final SettingsManager settingsManager) {
    return new DefaultJwtManager(settingsManager);
}

@Bean
public RequestManager requestManager(final UrlManager urlManager, final JwtManager jwtManager, final SettingsManager settingsManager) {
    return new DefaultRequestManager(urlManager, jwtManager, settingsManager);
}
</pre>
            <p>完整的示例代码可以在 <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/ DemoExampleApplication.java" target="_blank">此处</a>找到。</p>
        </li>
        <li>
            <p>之后，您可以在其默认实现中或通过覆盖和扩展它们来使用所有可用服务：</p>
            <ul>
                <li>要使用 <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/service/CallbackServiceImpl. java" target="_blank">回调服务</a>，
                    创建 <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/controllers/CallbackController.java" target="_blank">回调控制器</a>，
                    其中请求正文包装在<em>Callback</em>模型中，并调用回调服务来处理该模型。</li>
                <li>
                    <p>演示<a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/service/ConfigServiceImpl.java" target="_blank">配置服务</a>工作，
                        <em>@GetMapping("/editor")</em> 用于 <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/ src/main/java/com/onlyoffice/demoexample/controllers/MainController.java" target="_blank">主控制器</a>。
                        当用户打开该地址时，会请求编辑器页面。 同时，调用配置服务并生成<em>Config</em>模型以打开编辑器：</p>
                </li>
            </ul>
            <pre>
@GetMapping("/editor")
public String main(final Model model) throws JsonProcessingException {

    Config config = configService.createConfig("1", Mode.EDIT, Type.DESKTOP);

    model.addAttribute("config", config);
    model.addAttribute("documentServerApiUrl", urlManager.getDocumentServerApiUrl());

    return "editor";
}
</pre>
        </li>
        <li>创建 <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/controllers/FileController.java" target="_blank">文件控制器</a>
            获取要在编辑器中打开的文件。 当配置服务生成配置模型时，该模型中指定了下载文件的URL。 要打开文档，编辑器向此 URL 发送请求，文件控制器响应此请求并返回文档。</li>
    </ol>

</asp:Content>
