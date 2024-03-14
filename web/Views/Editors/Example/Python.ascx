<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to integrate Docs into website on Python</span>
</h1>

<h2>Overview</h2>
<p class="dscr">
    This example will help you integrate ONLYOFFICE Docs into your web application written on Python.
</p>

<div class="note">
    It is intended for testing purposes and demonstrating functionality of the editors.
    <b>DO NOT</b> use this integration example on your own server without proper code modifications.
    In case you enabled the test example, disable it before going for production.
</div>

<h2 id="security" class="copy-link">Important security info</h2>
<p>Please keep in mind the following security aspects when you are using test examples:</p>
<ul>
    <li>There is no protection of the storage from unauthorized access since there is no need for authorization.</li>
    <li>There are no checks against parameter substitution in links, since the parameters are generated by the code according to the pre-arranged scripts.</li>
    <li>There are no data checks in requests of saving the file after editing, since each test example is intended for requests only from ONLYOFFICE Document Server.</li>
    <li>There are no prohibitions on using test examples from other sites, since they are intended to interact with ONLYOFFICE Document Server from another domain.</li>
</ul>

<h2 id="install" class="copy-link"><span class="style_step">Step 1. </span>Install the prerequisites and run the website with the editors</h2>
<p>The Python example offers various installation options, but we highly recommend using Docker for this purpose.</p>
<p><b>Option 1. Using Docker</b></p>
<p>To run the example using <a href="https://www.docker.com/" target="_blank">Docker</a>,
you will need <a href="https://docs.docker.com/desktop/" target="_blank">Docker Desktop 4.17.0</a> or <a href="https://docs.docker.com/engine/" target="_blank">Docker Engine 20.10.23</a>
with <a href="https://docs.docker.com/compose/" target="_blank">Docker Compose 2.15.1</a>.
Additionally, you might want to consider installing <a href="https://www.gnu.org/software/make/" target="_blank">GNU Make 4.4.1</a>, although it is optional.
These are the minimum versions required for the tools.</p>
<p>Once you have everything installed, download the release archive and unarchive it:</p>
<pre>
curl --output Python.Example.zip --location https://github.com/ONLYOFFICE/document-server-integration/releases/latest/download/Python.Example.zip
unzip Python.Example.zip
</pre>
<p>Then open the example directory and <a href="https://github.com/ONLYOFFICE/document-server-integration/blob/cd0647e0f7a16eaa5af8d82fa09ae95cd3c483ba/web/documentserver-example/python/Makefile#L38" target="_blank">up containers</a>:</p>
<pre>
cd "Python Example"
make compose-prod
</pre>
<p>By default, the server starts at <em>localhost:80</em>.</p>
<p>To configure the example, you can edit the environment variables in <a href="https://github.com/ONLYOFFICE/document-server-integration/blob/cd0647e0f7a16eaa5af8d82fa09ae95cd3c483ba/web/documentserver-example/python/compose-base.yml" target="_blank">compose-base.yml</a>.
See <a href="#configure">below</a> for more information about environment variables.</p>

<p><b>Option 2. On local machine</b></p>
<p>Before diving into the example, you will need to install ONLYOFFICE Docs.
Check the detailed guide to learn how to install it on <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_python_example" target="_blank">Windows</a>,
<a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_python_example" target="_blank">Linux</a>,
or <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx?from=api_python_example" target="_blank">Docker</a>.</p>
<p>To run the example on your local machine, you will need <a href="https://www.python.org/" target="_blank">Python 3.11.4</a>
with <a href="https://pip.pypa.io/en/stable/" target="_blank">pip 23.1.2</a>. Additionally, you might want to consider installing <a href="https://www.gnu.org/software/make/" target="_blank">GNU Make 4.4.1</a>,
although it is optional. These are the minimum versions required for the tools.</p>
<p>Once you have everything installed, download the release archive and unarchive it:</p>
<pre>
curl --output Python.Example.zip --location https://github.com/ONLYOFFICE/document-server-integration/releases/latest/download/Python.Example.zip
unzip Python.Example.zip
</pre>
<p>Then open the example directory, <a href="https://github.com/ONLYOFFICE/document-server-integration/blob/cd0647e0f7a16eaa5af8d82fa09ae95cd3c483ba/web/documentserver-example/python/Makefile#L13" target="_blank">install dependencies</a>,
and <a href="https://github.com/ONLYOFFICE/document-server-integration/blob/cd0647e0f7a16eaa5af8d82fa09ae95cd3c483ba/web/documentserver-example/python/Makefile#L21" target="_blank">start the server</a>:</p>
<pre>
cd "Python Example"
make prod
make server-prod
</pre>
<p>By default, the server starts at <em>0.0.0.0:8000</em>.</p>
<p>To configure the example, you can pass the environment variables before the command that starts the server.
See <a href="#configure">below</a> for more information about environment variables.</p>

<h2 id="accessibility" class="copy-link"><span class="style_step">Step 2. </span>Check accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
</p>
<p>Make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.</p>

<h2 id="configure" class="copy-link"><span class="style_step">Step 3. </span>Configure the Python example</h2>
<p>The example is configured by changing environment variables.</p>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td id="DEBUG" class="copy-link">DEBUG</td>
            <td>Disable or enable debug mode.</td>
            <td>false</td>
        </tr>
        <tr>
            <td id="ADDRESS" class="copy-link">ADDRESS</td>
            <td>The address where the server should be started.</td>
            <td>0.0.0.0</td>
        </tr>
        <tr>
            <td id="PORT" class="copy-link">PORT</td>
            <td>The port on which the server should be running.</td>
            <td>80</td>
        </tr>
        <tr>
            <td id="DOCUMENT_SERVER_PRIVATE_URL" class="copy-link">DOCUMENT_SERVER_PRIVATE_URL</td>
            <td>The URL through which the server will communicate with Document Server</td>
            <td>http://proxy:8080</td>
        </tr>
        <tr>
            <td id="DOCUMENT_SERVER_PUBLIC_URL" class="copy-link">DOCUMENT_SERVER_PUBLIC_URL</td>
            <td>The URL through which a user will communicate with Document Server.</td>
            <td>http://localhost:8080</td>
        </tr>
        <tr>
            <td id="EXAMPLE_URL" class="copy-link">EXAMPLE_URL</td>
            <td>The URL through which Document Server will communicate with the server.</td>
            <td>http://proxy</td>
        </tr>
        <tr>
            <td id="JWT_SECRET" class="copy-link">JWT_SECRET</td>
            <td>JWT authorization secret. Leave blank to disable authorization.</td>
            <td>your-256-bit-secret</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>
