<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to integrate online editors into your own web site on Node.js</span>
</h1>

<h2>Introduction</h2>
<p class="dscr">
    To integrate <b>ONLYOFFICE online editors</b> into your own website on <b>Node.js</b> you need to download and install ONLYOFFICE editors on your local server and use the <a href="<%= Url.Action("demopreview") %>">Node.js Example</a> for their integration.
    We will show you how to run the Node.js example on <a href="#Windows">Windows OS</a> and <a href="#Linux">Linux OS</a>.
</p>

<div class="note">
    The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application.
    <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!
</div>

<p>This guide will show you the sequence of actions to integrate the editors successfully.</p>

<h2 id="Windows" class="copy-link">Running the example on Windows OS</h2>
<h2 id="win-1" class="copy-link"><span class="style_step">Step 1. </span>Download and Install Document Server</h2>
<p>First, download the <a href="<%= Url.Action("demopreview") %>"><b>ONLYOFFICE Editors</b></a> (the ONLYOFFICE Document Server).</p>
<p>See the detailed guide to learn how to <a href="https://helpcenter.onlyoffice.com/server/developer-edition/windows/index.aspx?from=api_nodejs_example">install Document Server for Windows</a>.</p>

<h2 id="win-2" class="copy-link"><span class="style_step">Step 2. </span>Download the Node.js code for the editors integration<span class="copy-link" title="Click to get link"></span></h2>
<p>Download the <a href="<%= Url.Action("demopreview") %>">Node.js example</a> from our site.</p>
<p>You need to connnect the editors to your web site. For that specify the path to the editors installation in the <em>config/default.json</em> file:</p>
<pre class="commandline">
"siteUrl": "https://documentserver/"
</pre>

<p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
<p>If you want to experiment with the editor configuration, modify the <a href="<%= Url.Action("advanced") %>">parameters</a> it the <em>\views\editor.ejs</em> file.</p>

<h2 id="win-3" class="copy-link"><span class="style_step">Step 3. </span>System requirements</h2>
<p>Download and install the <b>node.js</b> enviroment which is going to be used to run the Node.js project. Please follow the link at the oficial website: <a href="https://nodejs.org/en/download/">https://nodejs.org/en/download/</a>, choosing the correct version for your Windows OS (32-bit or 64-bit).</p>

<h2 id="win-4" class="copy-link"><span class="style_step">Step 4. </span>Running the Node.js code</h2>
<p>We will run the code in Node.js runtime environment and will interact with it using the command line interface (cmd).</p>

<ol>
    <li>Launch the <b>Command Prompt</b> and switch to the folder with the Node.js project code, for example:
        <div class="commandline">cd /d "C:\Node.js Example"</div>
    </li>
    <li>Node.js comes with a package manager, <b>node package manager (npm)</b>, which is automatically installed along with Node.js.
        To run the Node.js code install the project modules using the following npm command:
        <div class="commandline">npm install</div>
        <p>A new <em>node_modules</em> folder will be created in the project folder.</p>
    </li>
    <li>Run the project using the <b>Command Prompt</b>:
        <div class="commandline">node bin/www</div>
    </li>
    <li>See the result in your browser using the address:
        <div class="commandline">http://localhost:3000</div>
    </li>
</ol>

<h2 id="win-5" class="copy-link"><span class="style_step">Step 5. </span>Checking accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<h2 id="Linux" class="copy-link">Running the example on Linux OS</h2>
<h2 id="linux-1" class="copy-link"><span class="style_step">Step 1. </span>Download and Install Document Server</h2>
<p>First, download the <a href="<%= Url.Action("demopreview") %>"><b>ONLYOFFICE Editors</b></a> (the ONLYOFFICE Document Server).</p>
<p>See the detailed guide to learn how to <a href="https://helpcenter.onlyoffice.com/server/developer-edition/linux/index.aspx?from=api_nodejs_example">install Document Server for Linux</a>.</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">Step 2. </span>Install the prerequisites and run the web site with the editors</h2>
<ol>
    <li>Install <b>Node.js</b>:
        <div class="commandline">curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -</div>
        <div class="commandline">sudo apt-get install -y nodejs</div>
    </li>
    <li>Download the archive with the Node.js example and unpack the archive:
        <div class="commandline">wget https://api.onlyoffice.com/app_data/editor/Node.js%20Example.zip</div>
        <div class="commandline">unzip Node.js\ Example.zip</div>
    </li>
    <li>Change the current directory for the project directory:
        <div class="commandline">cd Node.js\ Example/</div>
    </li>
    <li>Install the dependencies:
        <div class="commandline">npm install</div>
    </li>
    <li>Edit the <em>default.json</em> configuration file.
        Specify the name of your local server with the ONLYOFFICE Document Server installed.
        <div class="commandline">nano config/default.json</div>
        <p>Edit the following lines:</p>

        <pre>
"siteUrl": "https://documentserver/"
</pre>

        <p>Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
    </li>
    <li>Run the project with Node.js:
        <div class="commandline">nodejs bin/www</div>
    </li>
    <li>See the result in your browser using the address:
        <div class="commandline">http://localhost:3000</div>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">Step 3. </span>Checking accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>
