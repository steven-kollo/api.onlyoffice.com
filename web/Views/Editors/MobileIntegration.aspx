<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    集成ONLYOFFICE移动web编辑器
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">集成ONLYOFFICE移动web编辑器</span>
    </h1>
    <p>要访问移动应用程序中的编辑器功能，请通过WebView组件（一个负责在应用程序中打开网页的系统组件）将其与ONLYOFFICE编辑器集成。
        之后，用户将能够在iOS或Android设备上直接查看、创建和编辑文本文档、电子表格和演示文稿，填写表单，阅读PDF。</p>
    <note>请注意，ONLYOFFICE移动web编辑器仅适用于 <a href="https://www.onlyoffice.com/zh/docs-enterprise.aspx" target="_blank">企业</a> 和 <a href="https://www.onlyoffice.com/zh/developer-edition.aspx" target="_blank">开发者</a> 版本的商业版本。</note>
    <div class="container">
        <ul class="browser">
            <li class="browser tab active copy-link" id="ios">iOS</li>
            <li class="browser tab copy-link" id="android">安卓</li>
        </ul>
        <div id="ios" class="content active">
            <p>在本节中，我们将使用 <a href="https://github.com/ONLYOFFICE/editors-webview-ios" target="_blank">GitHub</a>上提供的iOS移动演示示例，通过 <a href="https://developer.apple.com/documentation/webkit/wkwebview" target="_blank">WKWebView</a> 查看集成过程。</p>

            <h2>基于ONLYOFFICE测试范例的集成</h2>
            <p>此示例演示了如何将ONLYOFFICE移动web编辑器与ONLYOFFICE <a href="<%= Url.Action("demopreview") %>">测试或DMS范例</a>集成。</p>
            <p><img class="screenshot max-width-832" alt="通过测试范例实现iOS集成" src="<%= Url.Content("~/content/img/editor/ios-test-sample.png") %>" /></p>
            <p><b>打开ONLYOFFICE编辑器</b></p>
            <ol>
                <li>下载并安装ONLYOFFICE 文档 <a href="https://www.onlyoffice.com/zh/docs-enterprise.aspx" target="_blank">企业</a> 或 <a href="https://www.onlyoffice.com/zh/developer-edition.aspx" target="_blank">开发者</a> 版本。</li>
                <li>从 <a href="https://github.com/ONLYOFFICE/editors-webview-ios" target="_blank">GitHub</a>下载适用于iOS的移动演示示例。</li>
                <li>用 <a href="https://developer.apple.com/xcode/" target="_blank">Xcode</a> 打开 <em>EditorWebViewDemo.xcodeproj</em> 项目，以修改此示例的代码片段，使DMS能够正常工作。</li>
                <li>
                    <p>要显示DMS主页，请在 <em>Info.plist</em> 文件的 <b>DocumentServerURL</b> 属性值中指定文档服务器web界面的地址。</p>
                    <pre>
&lt;dict&gt;
    ...
    &lt;key&gt;DocumentServerURL&lt;/key&gt;
    &lt;string&gt;https://documentserver/&lt;/string&gt;
&lt;/dict&gt;
</pre>
                    <p>其中， <b>documentserver</b> 是安装了ONLYOFFICE 文档服务器的服务器的名称。</p>
                    <p>如果指定了 <b>DocumentServerURL</b> ，则会加载DMS主页。否则，会发生错误：</p>
                    <pre>
private func load() {
    if documentServerUrlString.isEmpty {
        showAlert(title: "Error", message: "You must specify the document server address, the \"DocumentServerURL\" value in the Info.plist file.")
        return
    }

    guard let url = URL(string: documentServerUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
        return
    }

    webView.load(URLRequest(url: url))
}
</pre>
                    <div class="img-block-2">
                        <div>
                            <img class="screenshot max-width-260" alt="iOS错误" src="<%= Url.Content("~/content/img/editor/ios-error.png") %>" />
                            <p><b>未指定DocumentServerURL</b></p>
                        </div>
                        <div>
                            <img class="screenshot max-width-260" alt="iOS管理" src="<%= Url.Content("~/content/img/editor/ios-managing.png") %>" />
                            <p><b>已指定DocumentServerURL</b></p>
                        </div>
                    </div>
                </li>
                <li>
                    <p>使用 <b>DocumentServerViewController</b> 控制器在iOS设备上正确打开编辑器。
                        在此控制器中，定义通过WKWebView组件打开文档的函数。
                        首先，请求一个绝对URL并检查它是否包含 <em>"/editor?"</em> 字符串。
                        如果是，请向链接添加其他查询参数（移动平台类型）：</p>
                    <pre>
private var openDocumentMarker = "/editor?"
private var additionalQueryParameters = ["type": "mobile"]

func webView(_ webView: WKWebView,
    decidePolicyFor navigationAction:
    WKNavigationAction,
    decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
{
    guard let urlString = navigationAction.request.url?.absoluteString else {
        decisionHandler(.cancel)
        return
    }

    if urlString.contains(openDocumentMarker),
       let redirectUrl = navigationAction.request.url?.appendingQueryParameters(additionalQueryParameters)
    {
        decisionHandler(.cancel)
        navigator.navigate(to: .documentServerEditor(url: redirectUrl))
    } else {
        reloadItem.isEnabled = true
        backItem.isEnabled = webView.canGoBack
        forwardItem.isEnabled = webView.canGoForward

        title = navigationAction.request.url?.host ?? ""

        decisionHandler(.allow)
    }

}
</pre>
                </li>
                <li>在 <b>DocumentServerViewController</b> 控制器中，创建DMS主页上可用的导航操作。
                    例如，在我们的测试范例中，它们是用界面元素指定的，例如 <b>Reload</b>, <b>Back</b>, 和 <b>Forward</b> 按钮。</li>
                <li>
                    <p>为了便于与编辑器交互，请定义 <b>活动指示器</b> 和 <b>进度视图</b> UI组件。</p>
                    <p><b>DocumentServerViewController</b> 的完整代码可以在 <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/DocumentServerDemo/DocumentServerViewController.swift" target="_blank">此处</a>找到。</p>
                    <div class="img-block-3">
                        <div>
                            <img class="screenshot max-width-260" alt="活动指示器" src="<%= Url.Content("~/content/img/editor/activity-indicator.png") %>" />
                            <p align="center"><b>活动指示器</b></p>
                        </div>
                        <div>
                            <img class="screenshot max-width-260" alt="进度视图" src="<%= Url.Content("~/content/img/editor/progress-view.png") %>" />
                            <p align="center"><b>进度视图</b></p>
                        </div>
                        <div>
                            <img class="screenshot max-width-260" alt="按钮" src="<%= Url.Content("~/content/img/editor/buttons.png") %>" />
                            <p align="center"><b>按钮</b></p>
                        </div>
                    </div>
                </li>
                <li>
                    <p>要开始处理文档，请通过WKWebView组件在移动设备上显示ONLYOFFICE编辑器。
                        为此，请在 <b>DocumentServerEditorViewController</b> 控制器中设置WKWebView和布局，如下所示：</p>
                    <pre>
private func configureView() {
    let preferences = WKPreferences()
    let configuration = WKWebViewConfiguration()
    preferences.javaScriptEnabled = true
    configuration.preferences = preferences

    webView = WKWebView(frame: .zero, configuration: configuration)

    view.addSubview(webView)
    webView.translatesAutoresizingMaskIntoConstraints = false

    webView.navigationDelegate = self
    webView.uiDelegate = self

    if let webViewSuperview = webView.superview {
        webView.topAnchor.constraint(equalTo: webViewSuperview.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: webViewSuperview.leadingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: webViewSuperview.bottomAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: webViewSuperview.trailingAnchor).isActive = true
    }
...
}
</pre>
                </li>
                <li>在Xcode工具栏中，选择要运行应用程序的构建方案和设备。
                    然后，选择 <b>Product -> Run</b>，或单击项目工具栏中的 <b>Run</b> 按钮来构建和运行代码。</li>
                <li>在应用程序的主屏幕上，选择 <b>Using DocumentServer</b> 选项以演示一个将ONLYOFFICE移动web编辑器与ONLYOFF测试或DMS范例集成的示例。</li>
            </ol>

            <br />
            <p><b>关闭ONLYOFFICE编辑器</b></p>
            <p>使用 <b>DocumentServerEditorViewController</b> 控制器退出编辑器。
                例如，在当前测试范例中，创建 <b>返回</b> 按钮以导航到上一屏：</p>
            <pre>
private let goBackUrl = Bundle.main.object(forInfoDictionaryKey: "DocumentServerURL") as? String ?? ""

func webView(_ webView: WKWebView,
    decidePolicyFor navigationAction: WKNavigationAction,
    decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
{
    guard let urlString = navigationAction.request.url?.absoluteString else {
        decisionHandler(.cancel)
        return
    }
        
    if urlString == goBackUrl {
        decisionHandler(.cancel)
        navigationController?.popViewController(animated: true)
    } else {
        decisionHandler(.allow)
    }
}
</pre>
            <div>
                <img class="screenshot max-width-260" alt="回去" src="<%= Url.Content("~/content/img/editor/exit-button.png") %>" />
                <p style="margin-left: 40px;"><b>退出编辑器的按钮</b></p>
            </div>
            <p><b>DocumentServerEditorViewController</b> 的完整代码可以在 <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/DocumentServerEditor/DocumentServerEditorViewController.swift" target="_blank">此处</a>找到。</p>

            <h2>基于ONLYOFFICE 文档 API的集成</h2>
            <p>此示例演示如何使用 <a href="<%= Url.Action("basic") %>">API文档</a> 和 <a href="<%= Url.Action("try") %>">配置示例</a>中描述的编辑器配置通过WKWebView打开ONLYOFFICE编辑器。</p>
            <p><img class="screenshot max-width-832" alt="通过api集成iOS" src="<%= Url.Content("~/content/img/editor/ios-api-config.png") %>" /></p>
            <p><b>打开ONLYOFFICE编辑器</b></p>
            <ol>
                <li>下载并安装ONLYOFFICE 文档 <a href="https://www.onlyoffice.com/zh/docs-enterprise.aspx" target="_blank">企业</a> 或 <a href="https://www.onlyoffice.com/zh/developer-edition.aspx" target="_blank">开发者</a> 版本。</li>
                <li>从 <a href="https://github.com/ONLYOFFICE/editors-webview-ios" target="_blank">GitHub</a>下载适用于iOS的移动演示示例。</li>
                <li>用 <a href="https://developer.apple.com/xcode/" target="_blank">Xcode</a> 打开 <em>EditorWebViewDemo.xcodeproj</em> 项目，以修改此示例的代码片段，使DMS能够正常工作。</li>
                <li>创建一个空的 <em>html</em> 文件。用演示项目 <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/Resources/editor.html" target="_blank">editor.html</a> 资源作模板。</p></li>
                <li>
                    <p>添加 <em>div</em> 元素，如下所示：</p>
                    <pre>
&lt;div id="placeholder"&gt;&lt;/div&gt;
</pre>
                </li>
                <li>
                    <p>使用将用于您的网站的 JavaScript API 指定您的 ONLYOFFICE 文档服务器链接：</p>
                    <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
</pre>
                    <p>其中， <b>documentserver</b> 是安装了ONLYOFFICE 文档服务器的服务器的名称。</p>
                </li>
                <li>
                    <p>使用要打开的文档的配置添加脚本，初始化div元素的文档编辑器：添加脚本指定你想打开的文档，为 <em>div</em> 元素初始化 <b>文档编辑器</b>。</p>
                    <pre>
window.docEditor = new DocsAPI.DocEditor("placeholder",
    {
        {external_config},
        "type": "mobile",
        "events": {
            "onAppReady": onAppReady,
            "onDocumentReady": onDocumentReady,
            "onDownloadAs": onDownloadAs,
            "onError": onError,
            "onInfo": onInfo,
            "onRequestClose": onRequestClose,
            "onRequestInsertImage": onRequestInsertImage,
            "onRequestUsers": onRequestUsers,
            "onWarning": onWarning,
        }
    });
</pre>
                </li>
                <li>
                    <p>要开始处理文档，请通过WKWebView组件在移动设备上显示ONLYOFFICE编辑器。
                        为此，请指定 <b>EditorViewController</b> 控制器。向编辑器请求 <em>editor.html</em> 文件的URL，
                        获取其内容并用示例 <em>samples.plist</em> 文件中的配置替换 <em>"{external_config}"</em> 参数，
                        在这里，根据 <a href="<%= Url.Action("try") %>">API documentation Try page</a>对所有示例配置进行分类：</p>
                    <pre>
private func load() {
    guard let url = Bundle.main.url(forResource: "editor", withExtension: "html") else {
        return
    }

    var html = ""

    do {
        html = try String(contentsOf: url)
    } catch {
        print(error)
    }

    html = html.replacingOccurrences(of: "{external_config}", with: config ?? "")
    webView.loadHTMLString(html, baseURL: nil)
}
</pre>
                    <div>
                        <img class="screenshot max-width-260" alt="编辑器示例" src="<%= Url.Content("~/content/img/editor/editor-samples.png") %>" />
                        <p style="margin-left: 25px;"><b>ONLYOFFICE编辑器示例</b></p>
                    </div>
                    <p><b>EditorViewController</b> 的完整代码可以在 <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/Editor/EditorViewController.swift" target="_blank">这里</a>找到。</p>
                </li>
                <li>在Xcode工具栏中，选择要运行应用程序的构建方案和设备。
                    然后，选择 <b>Product -> Run</b>，或单击项目工具栏中的 <b>Run</b> 按钮来构建和运行代码。</li>
                <li>在应用程序的主屏幕上，选择 <b>使用API配置</b> 选项，
                    演示如何使用API文档和配置示例中描述的编辑器配置打开ONLYOFFICE移动web编辑器。</li>
                <li>在下一页中，选择一个配置示例以在WKWebView组件中打开生成的HTML。</li>
            </ol>

            <br />
            <p><b>使用文档</b></p>
            <p>要使用文档（打开、下载、插入图像、提及其他用户等），请使用API文档的事件和方法：</p>
            <ol>
                <li>
                    <p>要跟踪事件并调用适当的方法，请通过 <b>EditorEventsHandler</b> 控制器以本地代码处理ONLYOFFICE编辑器的 <a href="<%= Url.Action("config/events") %>">事件</a>，
                        然后将其委托给 <b>EditorViewController</b>处理：</p>
                    <pre>
var delegate: EditorEventsDelegate?

convenience init(configuration: WKWebViewConfiguration) {
    self.init()
   
    configuration.userContentController.add(self, name: EditorEvent.onDownloadAs.rawValue)
    ....
}

extension EditorEventsHandler: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage)
    {
        let event = EditorEvent(rawValue: message.name)

        switch event {
        case .onDownloadAs:
            guard
                let json = message.body as? [String: Any],
                let fileType = json["fileType"] as? String,
                let url = json["url"] as? String
            else { return }

            delegate?.onDownloadAs(fileType: fileType, url: url)
        ...
        }
    }
}
</pre>
                    <p>让我们以 <a href="<%= Url.Action("config/events") %>#onDownloadAs">onDownloadAs</a> 事件为例。
                        在WKWebView配置期间，通过调用 <em>configuration.userContentController.add(self, name: messageName)</em>，为特定消息的处理程序注册一个对象。
                        获取事件参数（文件类型和URL）并将事件委托给 <b>EditorViewController</b>处理：</p>
                    <pre>
func onDownloadAs(fileType: String, url: String) {
    print("&#9889; ONLYOFFICE Document Editor create file: \(url)")
}
</pre>
                </li>
                <li>
                    <p>定义 <b>callMethod</b> 函数以从本地代码调用 <a href="<%= Url.Action("methods") %>">API方法</a>。它可以将字符串、布尔值或对象值作为参数。
                        此函数将方法名及其参数添加到带有JavaScript代码的字符串中，然后使用 <em>evaluateJavaScript</em> 方法运行WKWebView组件中的JavaScript：</p>
                    <pre>
private func callMethod(function: String, arg: Bool) {
    let javascript = "window.docEditor.\(function)(\(arg))"
    webView.evaluateJavaScript(javascript, completionHandler: nil)
}

private func callMethod(function: String, arg: String) {
    let javascript = "window.docEditor.\(function)(\"\(arg)\")"
    webView.evaluateJavaScript(javascript, completionHandler: nil)
}

private func callMethod(function: String, arg: [String: Any]) {
    guard
        let json = try? JSONSerialization.data(withJSONObject: arg, options: []),
        let jsonString = String(data: json, encoding: .utf8)
    else {
        return
    }

    let javascript = "window.docEditor.\(function)(\(jsonString))"
    webView.evaluateJavaScript(javascript, completionHandler: nil)
}
</pre>
                    <p><b>EditorEventsHandler</b> 的完整代码可以在 <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/Editor/EditorEventsHandler.swift" target="_blank">这里</a>找到。</p>
                </li>
                <li>
                    <p>要显示下载和打印文档的结果，请使用 <b>PreviewController</b> 控制器。此控制器基于 <b>QLPreviewController</b>。
                        按文档的URL下载文档，并将 <em>dataSource</em> 和 <em>delegate</em> 属性设置为 <b>QLPreviewController</b>：</p>
                    <pre>
func present(url: URL, in parent: UIViewController, complation: @escaping (() -> Void)) {
    download(url: url) { fileUrl in
        DispatchQueue.main.async {
            guard let fileUrl = fileUrl else {
                complation()
                return
            }

            self.fileUrl = fileUrl

            let quickLookController = QLPreviewController()
            quickLookController.dataSource = self
            quickLookController.delegate = self

            if QLPreviewController.canPreview(fileUrl as QLPreviewItem) {
                quickLookController.currentPreviewItemIndex = 0
                parent.present(quickLookController, animated: true, completion: nil)
            }
            complation()
        }
    }
}
</pre>
                    <p><b>PreviewController</b> 的完整代码可以在 <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/Editor/PreviewController.swift" target="_blank">这里</a>找到。</p>
                </li>
            </ol>
        </div>
        <div id="android" class="content">
            <p>在本节中，我们将使用 <a href="https://github.com/ONLYOFFICE/editors-webview-android" target="_blank">GitHub</a>上提供的Android手机演示范例，通过 <a href="https://developer.android.com/reference/android/webkit/WebView" target="_blank">WebView</a> 查看集成过程。</p>
            <h2>基于ONLYOFFICE测试范例的集成</h2>
            <p>此示例演示了如何将ONLYOFFICE移动web编辑器与ONLYOFFICE <a href="<%= Url.Action("demopreview") %>">测试或DMS范例</a>集成。</p>
            
            <p><img class="screenshot max-width-832" alt="通过测试范例实现Android集成" src="<%= Url.Content("~/content/img/editor/android-test-sample.png") %>" /></p>
            <p><b>打开ONLYOFFICE编辑器</b></p>
            <ol>
                <li>下载并安装ONLYOFFICE 文档 <a href="https://www.onlyoffice.com/zh/docs-enterprise.aspx" target="_blank">企业</a> 或 <a href="https://www.onlyoffice.com/zh/developer-edition.aspx" target="_blank">开发者</a> 版本。</li>
                <li>从 <a href="https://github.com/ONLYOFFICE/editors-webview-android" target="_blank">GitHub</a>下载Android手机演示范例。</li>
                <li>使用 <a href="https://developer.android.com/studio" target="_blank">Android Studio</a> 打开顶层 <em>build.gradle</em> 文件，修改此示例的代码片段，以便DMS正常工作。</li>
                <li>
                    <p>要显示DMS的主页，请在模块级 <em>build.gradle</em> 文件的 <b>DOCUMENT_SERVER_URL</b> 属性中指定文档服务器web界面的地址。</p>
                    <pre>
buildConfigField("String", "DOCUMENT_SERVER_URL", "https://documentserver/")
</pre>
                    <p>其中， <b>documentserver</b> 是安装了ONLYOFFICE 文档服务器的服务器的名称。</p>
                    <p>如果指定了 <b>DOCUMENT_SERVER_URL</b> ，则会加载DMS主页。否则，会发生错误：</p>
                    <pre>
private fun showDialog() {
    AlertDialog.Builder(requireContext())
    .setMessage("Document server url is empty.\nYou must specify the address in build.gradle")
    .setPositiveButton("Ok") { dialog, _ ->
        dialog.dismiss()
        requireActivity().finish()
    }
    .create()
    .show()
}
</pre>
                    <div class="img-block-2">
                        <div>
                            <img class="screenshot max-width-260" alt="Android错误" src="<%= Url.Content("~/content/img/editor/android-error.png") %>" />
                            <p><b>未指定DocumentServerURL</b></p>
                        </div>
                        <div>
                            <img class="screenshot max-width-260" alt="Android管理" src="<%= Url.Content("~/content/img/editor/android-managing.png") %>" />
                            <p><b>已指定DocumentServerURL</b></p>
                        </div>
                    </div>
                </li>
                <li>
                    <p>使用 <b>MainFragment.kt</b> 控制器在Android设备上正确打开编辑器。
                        在此控制器中，定义通过WebView组件打开文档的函数。
                        请求URL并检查它是否包含 <em>"editor"</em> 字符串，这个字符串指定将要打开的文档：</p>
                    <pre>
private class MainWebViewClient(private val navController: NavController) : WebViewClient() {

    override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest?): Boolean {
        val url = request?.url
        if (url != null) {
            val path = url.path
            if (path?.contains("editor") == true) {
                navController.navigate(R.id.action_mainFragment_to_editorFragment, Bundle(1).apply {
                    putString("document_url", url.toString())
                })
                return true
            }
            return false
        }
        return super.shouldOverrideUrlLoading(view, request)
    }

}
</pre>
                    <p><b>MainFragment.kt</b> 的完整代码，可以在 <a href="https://github.com/ONLYOFFICE/editors-webview-android/blob/fd8f9809441fab9653140cf2e51a1303e2edd774/app/src/main/java/ru/mike/florida/MainFragment.kt" target="_blank">这里</a>找到。</p>
                </li>
                <li>
                    <p>要开始处理文档，请通过WebView组件在移动设备上显示ONLYOFFICE编辑器。
                        为此，在 <b>EditorFragment.kt</b> 控制器中设置WebView和布局如下：</p>
                    <pre>
@SuppressLint("SetJavaScriptEnabled")
private fun setSettings() {
    webView?.settings?.apply {
        javaScriptEnabled = true
        javaScriptCanOpenWindowsAutomatically = true
        loadWithOverviewMode = true
        cacheMode = WebSettings.LOAD_NO_CACHE
        domStorageEnabled = true
    }
    webView?.webViewClient = EditorWebViewClient(findNavController())
}
</pre>
                </li>
                <li>在Android Studio工具栏中，选择应用程序和运行应用程序的设备。
                    然后，单击项目工具栏中的 <b>Run</b> 按钮来构建和运行代码。</li>
                <li>该应用程序将被打开，以演示一个将ONLYOFFICE移动web编辑器与ONLYOFF测试或DMS范例集成的示例。</li>
            </ol>

            <br />
            <p><b>关闭ONLYOFFICE编辑器</b></p>
            <p>使用 <b>EditorFragment.kt</b> 控制器退出编辑器：</p>
            <pre>
private class EditorWebViewClient(private val navController: NavController) : WebViewClient() {

    override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest?): Boolean {
        request?.url?.let { url ->
            if (!url.toString().contains("editor")) {
                navController.popBackStack()
                return true
            }
        }
        return super.shouldOverrideUrlLoading(view, request)
    }

}
</pre>
            <p><b>EditorFragment.kt</b> 的完整代码可以在 <a href="https://github.com/ONLYOFFICE/editors-webview-android/blob/fd8f9809441fab9653140cf2e51a1303e2edd774/app/src/main/java/ru/mike/florida/EditorFragment.kt" target="_blank">这里</a>找到。</p>
        </div>
    </div>

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
