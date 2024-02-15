<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Getting Started</span>
</h1>

<p class="dscr">
    You will create a sample application on localhost, connect it to the DocSpace platform and run basic methods. 
</p>
<p>You don't need to be an experienced JavaScript developer to use the DocSpace JavaScript SDK because we provide you with all the basics.
You only need a few lines of JavaScript to set up a fully functional integration.</p>
    <div class="container">
        <ul class="docspace-js-sdk-sample">
            <li class="docspace-js-sdk-sample tab active" id="nodejs">Node JS</li>
            <li class="docspace-js-sdk-sample tab" id="flask">Python Flask</li>
        </ul>
        <div id="nodejs" class="content active">
            <h2>Step 1. Install Node JS</h2>
            <p>Navigate to <a href="https://nodejs.org/en/download">Node JS Downloads page</a> and download NodeJS for your OS.<br />You'll need a Node JS app to run a local server only, no experience with Node JS required.</p>
            <p>Run the setup, accept all. After installation reboot your system and check Node JS version.</p>
            <pre>node -v</pre>
            <h2>Step 2. Create basic Node JS app</h2>
            <p>Create an empty folder for the app.</p>
            <p>Put the following structure inside the folder.</p>
            <img alt="Node JS Structure" class="screenshot" src="<%= Url.Content("~/content/img/docspace/nodejs-structure.png") %>" />
            <p>Copy the following inside app.js file</p>
            <pre>
var http = require('http');
var fs = require('fs');

fs.readFile('./index.html', function (err, html) {
    http.createServer(function(request, response) {  
        response.writeHeader(200, {"Content-Type": "text/html"});  
        response.write(html);  
        response.end();  
    }).listen(5000);
});
            </pre>

            <p>Copy the following inside index.html file. Don't forget to replace <b>{PORTAL_SRC}</b> with your portal URL.</p>
            <pre>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
    &lt;head&gt;
        &lt;meta charset="UTF-8"&gt;
        &lt;title&gt;DocSpace JavaScript SDK&lt;/title&gt;
        &lt;script src="{PORTAL_SRC}/static/scripts/api.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div id="ds-frame"&gt;&lt;/div&gt;
    &lt;/body&gt;
    &lt;script&gt;
        var onAppReady = function (e) {
            var frame = DocSpace.SDK.frames["ds-frame"];
            console.log("APP READY!");  
        };

        const config = { 
            "destroyText": "",
            "editorType": "embedded",
            "events": {
                "onSelectCallback": null,
                "onCloseCallback": null,
                "onAppReady": onAppReady,
                "onAppError": null
            },
            "frameId": "ds-frame",
            "height":  "700px",
            "id": null,
            "locale": "en-US",
            "mode": "manager",
            "name": "frameDocSpace",
            "rootPath": "/rooms/shared/",
            "showFilter": true,
            "showHeader": true,
            "showMenu": true,
            "showTitle": true,
            "src": {PORTAL_SRC},
            "theme": "Base",
            "type": "desktop",
            "viewAs": "row",
            "width": "100%"
        };

        var docSpace = DocSpace.SDK.initManager(config);
    &lt;/script&gt;
&lt;/html&gt;
            </pre>
            <h2>Step 3. Add app's URL to your DocSpace Developer Tools.</h2>
            <p>Navigate to the app folder you've just created and run your Node JS app with:</p>
            <pre>node app.js</pre>
            <p>The app is running on <b>"http://127.0.0.1:5000"</b>. Add this URL to the allow list in your <b>DocSpace Developer Tools</b>.<br />
            Open your DocSpace Developer Tools in browser at <b>{PORTAL_SRC}/portal-settings/developer-tools/javascript-sdk</b> and add the URL the <b>allow list</b>.</p>
            <img alt="JsSDK add localhost" class="screenshot max-width-550" src="<%= Url.Content("~/content/img/docspace/jssdk-devtools-localhost.png") %>" />
        </div>
        <div id="flask" class="content">
            <h2>Step 1. Install Flask</h2>
            <p>Search for the latest Python in Microsoft Store on Windows. Click "Get" to install. For Linux and MacOS navigate to the <a href="https://www.python.org/downloads/">Python Downloads page</a> and download Python for your OS.<br />
            You'll need a Flask app to run a local server only, no experience with Flask or Python required.</p>
            <p>Install Flask after successfully installing Python.</p>
            <pre>pip3 install Flask</pre>
            <p>After installation reboot your system and Flask version.</p>
            <pre>python3 -m flask --version</pre>
            <h2>Step 2. Create basic Flask app</h2>
            <p>Create an empty folder for the app.</p>
            <p>Put the following structure inside the folder.</p>
            <img alt="Flask Structure" class="screenshot" src="<%= Url.Content("~/content/img/docspace/flask-structure.png") %>" />
            <p>Copy the following inside app.py file</p>
            <pre>
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def main():
    return render_template("index.html") 
            </pre>

            <p>Copy the following inside index.html file. Don't forget to replace <b>{PORTAL_SRC}</b> with your portal URL.</p>
            <pre>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
    &lt;head&gt;
        &lt;meta charset="UTF-8"&gt;
        &lt;title&gt;DocSpace JavaScript SDK&lt;/title&gt;
        &lt;script src="{PORTAL_SRC}/static/scripts/api.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div id="ds-frame"&gt;&lt;/div&gt;
    &lt;/body&gt;
    &lt;script&gt;
        var onAppReady = function (e) {
            var frame = DocSpace.SDK.frames["ds-frame"];
            console.log("APP READY!");  
        };

        const config = { 
            "destroyText": "",
            "editorType": "embedded",
            "events": {
                "onSelectCallback": null,
                "onCloseCallback": null,
                "onAppReady": onAppReady,
                "onAppError": null
            },
            "frameId": "ds-frame",
            "height":  "700px",
            "id": null,
            "locale": "en-US",
            "mode": "manager",
            "name": "frameDocSpace",
            "rootPath": "/rooms/shared/",
            "showFilter": true,
            "showHeader": true,
            "showMenu": true,
            "showTitle": true,
            "src": {PORTAL_SRC},
            "theme": "Base",
            "type": "desktop",
            "viewAs": "row",
            "width": "100%"
        };

        var docSpace = DocSpace.SDK.initManager(config);
    &lt;/script&gt;
&lt;/html&gt;
            </pre>
            <h2>Step 3. Add app's URL to your DocSpace Developer Tools.</h2>
            <p>Navigate to the app folder you've just created and run your Flask app with:</p>
            <pre>python3 -m flask run</pre>
            <p>The app is running on <b>"http://127.0.0.1:5000"</b>. Add this URL to the allow list in your <b>DocSpace Developer Tools</b>.</p>
            <img alt="Flask Localhost" class="screenshot" src="<%= Url.Content("~/content/img/docspace/flask-localhost.png") %>" />
            <p>Open your DocSpace Developer Tools in browser at <b>{PORTAL_SRC}/portal-settings/developer-tools/javascript-sdk</b> and add the URL the <b>allow list</b>.</p>
            <img alt="JsSDK add localhost" class="screenshot max-width-550" src="<%= Url.Content("~/content/img/docspace/jssdk-devtools-localhost.png") %>" />
        </div>
    </div>
<h2>Step 4. Login on your app's page</h2>
<p>While your app is running you can navigate to it's URL (<b>"http://127.0.0.1:5000"</b> in this example) and login into DocSpace. 
If you have signed in previously with this browser this step can run automatically.</p>
<img alt="JsSDK login" class="screenshot max-width-550" src="<%= Url.Content("~/content/img/docspace/jssdk-login.png") %>" />
<h2>Step 5. Test JavaScript SDK</h2>
<p>You can now test JavaScript SDK methods by editing the script inside your <b>index.html</b> file.</p>
<p>Open it in the IDE, navigate to the &lt;script&gt; tag and find <b>onAppReady</b> method (it's connected to the "onAppReady" event in the DocSpace config).<br />
Call the <b>getFolderInfo</b> method and set a promise with printing the responce.</p>
<pre>
var onAppReady = function (e) {
    var frame = DocSpace.SDK.frames["ds-frame"];
    console.log("APP READY!");
    frame.getFolderInfo().then(res => {
        console.log("==== FOLDER INFO ====");
        console.log(res);
    });
};
</pre>
<p>After the app is ready you'll be able to see the result in your browser developer tools console.</p>
<img alt="JsSDK test method" class="screenshot max-width-550" src="<%= Url.Content("~/content/img/docspace/jssdk-test-method.png") %>" />
<script type="text/javascript">
    $('ul.docspace-js-sdk-sample').on('click', 'li:not(.browser tab active)', function () {
        $(this)
            .addClass('active').siblings().removeClass('active')
            .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
    });
    var loc = window.location.hash;
    if (loc != "") {
        var id = loc.substring(1);;
        $('.docspace-js-sdk-sample .tab').removeClass('active');
        $('.docspace-js-sdk-sample .tab[id="' + id + '"]').addClass('active');
        $('.content').removeClass('active');
        $('.content[id="' + id + '"]').addClass('active');
    }
</script>