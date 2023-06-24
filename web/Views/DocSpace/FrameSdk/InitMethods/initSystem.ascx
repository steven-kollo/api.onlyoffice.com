<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("framesdk/initmethods") %>"></a>
    <span class="hdr">initSystem</span>
</h1>

<div id="methodDesc" class="header-gray">Description</div>
<p class="dscr">Initializes the system DocSpace frame to call system methods. This lightweight frame displays a blank page with the loader.</p>
<pre>
var docSpace = new DocSpace.SDK.initSystem({config});
</pre>

<h2>Methods and their description:</h2>
    <ul>
        <li>
            <p>
                <b id="getHashSettings" class="copy-link">getHashSettings</b> - returns the hash settings for generating a password hash.
            </p>
            <pre>
docSpace.getHashSettings();
</pre>
        </li>
        <li>
            <p>
                <b id="createHash" class="copy-link">createHash</b> - generates a password hash.
            </p>
            <pre>
docSpace.createHash(password, hashSettings);
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>password</td>
                        <td>Defines a password to the DocSpace account.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>hashSettings</td>
                        <td>Defines the hash settings for generating a password hash.</td>
                        <td>object</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>hashSettings.size</td>
                        <td>Defines the hash size.</td>
                        <td>integer</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>hashSettings.salt</td>
                        <td>Defines the hash salt - a randomly generated set of characters that is added to a password before hashing it.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>hashSettings.iterations</td>
                        <td>Defines a number of hash iterations.</td>
                        <td>integer</td>
                        <td>required</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p>
                <b id="login" class="copy-link">login</b> - logs in to the DocSpace acoount.
            </p>
            <pre>
docSpace.login(email, passwordHash);
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Presence</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>email</td>
                        <td>Defines the user email address.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    <tr class="tablerow">
                        <td>passwordHash</td>
                        <td>Defines a password hash.</td>
                        <td>string</td>
                        <td>required</td>
                    </tr>
                    </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p>
                <b id="logout" class="copy-link">logout</b> - logs out from the DocSpace acoount.
            </p>
            <pre>
docSpace.logout();
</pre>
        </li>
        <li>
            <p>
                <b id="getUserInfo" class="copy-link">getUserInfo</b> - returns the information about the current DocSpace user or null if there are no authorized users.
            </p>
            <pre>
docSpace.getUserInfo();
</pre>
        </li>
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

var docSpace = new DocSpace.SDK.initSystem({
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

var docSpace = new DocSpace.SDK.initSystem({
    "events": {
        "onAppError": null,
        ...
    },
    ...
});
</pre>
    </li>
</ul>
