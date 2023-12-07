<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">APIPlugin</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>"></a>
</h1>

<p class="dscr">The plugin that is provided with the origin, proxy, and prefix to make requests to the portal server.</p>
<p><b>Interface</b>: IApiPlugin.</p>

<div class="header-gray">Variables</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="origin" class="copy-link">origin</td>
            <td>Stores the origin parameter of the DocSpace portal.</td>
            <td>string</td>
            <td>"https://example.com"</td>
        </tr>
        <tr class="tablerow">
            <td id="proxy" class="copy-link">proxy</td>
            <td>Stores the proxy parameter of the DocSpace portal.</td>
            <td>string</td>
            <td>"https://proxy-example"</td>
        </tr>
        <tr class="tablerow">
            <td id="prefix" class="copy-link">prefix</td>
            <td>Stores the prefix parameter of the DocSpace portal to access the server side.</td>
            <td>string</td>
            <td>"prefix"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p><b id="setOrigin" class="copy-link">setOrigin</b> - update the origin parameter of the DocSpace portal.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>origin</td>
                    <td>Defines the origin parameter of the DocSpace portal.</td>
                    <td>string</td>
                    <td>"https://example.com"</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getOrigin" class="copy-link">getOrigin</b> - get the origin parameter of the DocSpace portal.</p>
    </li>
    <li>
        <p><b id="setProxy" class="copy-link">setProxy</b> - update the proxy parameter of the DocSpace portal.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>proxy</td>
                    <td>Defines the proxy parameter of the DocSpace portal.</td>
                    <td>string</td>
                    <td>"https://proxy-example"</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getProxy" class="copy-link">getProxy</b> - get the proxy parameter of the DocSpace portal.</p>
    </li>
    <li>
        <p><b id="setPrefix" class="copy-link">setPrefix</b> - update the prefix parameter of the DocSpace portal.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>prefix</td>
                    <td>Defines the prefix parameter of the DocSpace portal.</td>
                    <td>string</td>
                    <td>"prefix"</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getPrefix" class="copy-link">getPrefix</b> - get the prefix parameter of the DocSpace portal.</p>
    </li>
    <li>
        <p><b id="setAPI" class="copy-link">setAPI</b> - update all the API parameters of the DocSpace portal in one request.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td id="origin" class="copy-link">origin</td>
                    <td>Stores the origin parameter of the DocSpace portal.</td>
                    <td>string</td>
                    <td>"https://example.com"</td>
                </tr>
                <tr class="tablerow">
                    <td id="proxy" class="copy-link">proxy</td>
                    <td>Stores the proxy parameter of the DocSpace portal.</td>
                    <td>string</td>
                    <td>"https://proxy-example"</td>
                </tr>
                <tr class="tablerow">
                    <td id="prefix" class="copy-link">prefix</td>
                    <td>Stores the prefix parameter of the DocSpace portal to access the server side.</td>
                    <td>string</td>
                    <td>"prefix"</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getAPI" class="copy-link">getAPI</b> - get all the API parameters of the DocSpace portal in one request.
            Returns an object with the origin, proxy, and prefix parameters.</p>
    </li>
</ul>

<div class="header-gray">Example</div>
<pre>
import {IApiPlugin} from "@onlyoffice/docspace-plugin-sdk";

class Plugin implements IApiPlugin {
    origin = "";
    proxy = "";
    prefix = "";

    setOrigin = (origin: string): void =&gt; {
        this.origin = origin;
    };

    getOrigin = (): string =&gt; {
        return this.origin;
    };

    setProxy = (proxy: string): void =&gt; {
        this.proxy = proxy;
    };

    getProxy = (): string =&gt; {
        return this.proxy;
    };

    setPrefix = (prefix: string): void =&gt; {
        this.prefix = prefix;
    };

    getPrefix = (): string =&gt; {
        return this.prefix;
    };

    setAPI = (origin: string, proxy: string, prefix: string): void =&gt; {
        this.origin = origin;
        this.proxy = proxy;
        this.prefix = prefix;
    };

    getAPI = (): {origin: string, proxy: string, prefix: string} =&gt; {
        return {origin: this.origin, proxy: this.proxy, prefix: this.prefix};
    };
}
</pre>
