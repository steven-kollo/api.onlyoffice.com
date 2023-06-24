<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("framesdk/initmethods") %>"></a>
    <span class="hdr">initEditor</span>
</h1>

<div id="methodDesc" class="header-gray">Description</div>
<p class="dscr">Initializes the editor frame.</p>
<pre>
var docSpace = new DocSpace.SDK.initEditor({config});
</pre>

<h2>Methods and their description:</h2>
    <ul>
        <li>
            <p>
                <b id="destroyFrame" class="copy-link">destroyFrame</b> - destroys the <em>docSpace</em> frame.
            </p>
            <pre>
docSpace.destroyFrame();
</pre>
        </li>
    </ul>


<h2>Events and their description:</h2>
<ul>
    <li>
        <p>
            <b id="onAppReady" class="copy-link">onAppReady</b> - the function called when DocSpace is initialized successfully.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onAppReady = function () {
    console.log("ONLYOFFICE DocSpace is ready");
};

var docSpace = new DocSpace.SDK.initEditor({
    "events": {
        "onAppReady": null,
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>
            <b id="onAppError" class="copy-link">onAppError</b> - the function called when DocSpace is initialized with an error.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onAppError = function () {
    console.log("ONLYOFFICE DocSpace reports an error");
};

var docSpace = new DocSpace.SDK.initEditor({
    "events": {
        "onAppError": null,
        ...
    },
    ...
});
</pre>
    </li>
</ul>
