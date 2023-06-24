<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("framesdk/initmethods") %>"></a>
    <span class="hdr">initManager</span>
</h1>

<div id="methodDesc" class="header-gray">Description</div>
<p class="dscr">Initializes a frame displaying the DocSpace page.</p>
<pre>
var docSpace = new DocSpace.SDK.initManager({config});
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

var docSpace = new DocSpace.SDK.initManager({
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

var docSpace = new DocSpace.SDK.initManager({
    "events": {
        "onAppError": null,
        ...
    },
    ...
});
</pre>
    </li>
</ul>
