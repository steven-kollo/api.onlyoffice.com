<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Integrating editors using Java SDK
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Integrating editors using Java SDK</span>
    </h1>

    <p class="dscr"><a href="https://central.sonatype.com/artifact/com.onlyoffice/docs-integration-sdk" target="_blank">ONLYOFFICE Docs Integration SDK</a> provides common interfaces and default implementations for integrating ONLYOFFICE Docs
        into your own website or application on Java.</p>

    <h2 id="prerequisites" class="copy-link">Prerequisites</h2>
    <ul>
        <li><b>Java</b>: version 11.x and higher (download from the <a href="https://www.oracle.com/java/technologies/downloads/#java11" target="_blank">Oracle official website</a>);</li>
        <li><b>Apache Maven</b> (download from the <a href="https://maven.apache.org/download.cgi" target="_blank">official website</a>).</li>
    </ul>

    <h2 id="sdk-structure" class="copy-link">SDK structure</h2>
    <p>SDK consists of 5 main managers and 4 services.</p>
    <div class="header-gray">Managers</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Manager</td>
                <td>Description</td>
                <td>Default implementation</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/document/DocumentManager.java" target="_blank">DocumentManager</a></td>
                <td>This manager is used for working with files and document formats.</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/document/DefaultDocumentManager.java" target="_blank">DefaultDocumentManager</a> (abstract)</td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/request/RequestManager.java" target="_blank">RequestManager</a></td>
                <td>This manager is used to make requests to the ONLYOFFICE Docs.</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/request/DefaultRequestManager.java" target="_blank">DefaultRequestManager</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/security/JwtManager.java" target="_blank">JwtManager</a></td>
                <td>This manager is used for generating and verifying authorization tokens.</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/security/DefaultJwtManager.java" target="_blank">DefaultJwtManager</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/settings/SettingsManager.java" target="_blank">SettingsManager</a></td>
                <td>This manager is used to manage integration application settings.</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/settings/DefaultSettingsManager.java" target="_blank">DefaultSettingsManager</a> (abstract)</td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/url/UrlManager.java" target="_blank">UrlManager</a></td>
                <td>This manager is used as a URL provider.</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/manager/url/DefaultUrlManager.java" target="_blank">DefaultUrlManager</a></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Services</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Service</td>
                <td>Description</td>
                <td>Default implementation</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/documenteditor/config/ConfigService.java" target="_blank">ConfigService</a></td>
                <td>This configuration generation service is used for opening the document editor.</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/documenteditor/config/DefaultConfigService.java" target="_blank">DefaultConfigService</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/documenteditor/callback/CallbackService.java" target="_blank">CallbackService</a></td>
                <td>This service is used for processing the response of the document server.</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/documenteditor/callback/DefaultCallbackService.java" target="_blank">DefaultCallbackService</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/convert/ConvertService.java" target="_blank">ConvertService</a></td>
                <td>This service is used for converting documents.</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/convert/DefaultConvertService.java" target="_blank">DefaultConvertService</a></td>
            </tr>
            <tr class="tablerow">
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/settings/SettingsValidationService.java" target="_blank">SettingsValidationService</a></td>
                <td>This service is used for checking document server connection settings.</td>
                <td><a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/src/main/java/com/onlyoffice/service/settings/DefaultSettingsValidationService.java" target="_blank">DefaultSettingsValidationService</a></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="usage" class="copy-link">Usage</h2>
    <p>Let's look at the <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/tree/main/demo-example" target="_blank">demo example</a>,
        which shows how the SDK works in a classic Spring web application:</p>
    <ol>
        <li>
            <p>Implement the methods of the abstract <b>DefaultSettingsManager</b> class:</p>
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
            <p>The full example code can be found <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/manager/SettingsManagerImpl.java" target="_blank">here</a>.</p>
        </li>
        <li>
            <p>Implement the methods of the abstract <b>DefaultDocumentManager</b> class:</p>
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
            <p>The full example code can be found <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/manager/DocumentManagerImpl.java" target="_blank">here</a>.</p>
        </li>
        <li>
            <p>Implement the <b>UrlManager</b> methods. To open the editor in the editing mode, you need to define:</p>
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
            <p>The full example code can be found <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/manager/UrlMangerImpl.java" target="_blank">here</a>.</p>
        </li>
        <li>
            <p>Initialize the <b>JwtManager</b> and <b>RequestManager</b> Spring beans and add them to the DI container.
                This allows you to call the registered beans anywhere in the application:</p>
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
            <p>The full example code can be found <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/DemoExampleApplication.java" target="_blank">here</a>.</p>
        </li>
        <li>
            <p>After this, you can use all available services in their default implementations or by overriding and extending them:</p>
            <ul>
                <li>To use the <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/service/CallbackServiceImpl.java" target="_blank">callback service</a>,
                    create the <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/controllers/CallbackController.java" target="_blank">callback controller</a>
                    where the request body is wrapped in the <em>Callback</em> model and the callback service is called to handle this model.</li>
                <li>
                    <p>To demonstrate the <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/service/ConfigServiceImpl.java" target="_blank">config service</a> work,
                        <em>@GetMapping("/editor")</em> is used in the <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/controllers/MainController.java" target="_blank">main controller</a>.
                        When the user opens this address, the editor page is requested. At the same time, the config service is called and generates the <em>Config</em> model to open the editor:</p>
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
        <li>Create the <a href="https://github.com/ONLYOFFICE/docs-integration-sdk-java/blob/main/demo-example/src/main/java/com/onlyoffice/demoexample/controllers/FileController.java" target="_blank">file controller</a>
            to get a file for opening in the editor. When the config service generates the config model, the URL for downloading a file is specified in this model. To open the document, the editor sends a request to this URL, and the file controller responds to this request and returns the document.</li>
    </ol>

</asp:Content>
