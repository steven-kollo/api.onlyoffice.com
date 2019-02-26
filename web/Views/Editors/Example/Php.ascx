<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to integrate online editors into your own web site on PHP</span>
</h1>

<h2>Introduction</h2>
<p class="dscr">
    To integrate <b>ONLYOFFICE online editors</b> into your own website on <b>PHP</b> you need to download and install ONLYOFFICE editors on your local server and use the <a href="<%= Url.Action("demopreview") %>">PHP Example</a> for their integration.
    We will show you how to run the PHP example on <a href="#Windows">Windows OS</a> and <a href="#Linux">Linux OS</a>.
</p>

<div class="note">
    The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application.
    <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!
</div>

<p>This guide will show you the sequence of actions to integrate the editors successfully.</p>

<h2 id="Windows" class="copy-link">Running the example on Windows OS</h2>
<h2 id="win-1" class="copy-link"><span class="style_step">Step 1. </span>Download and Install Document Server</h2>
<p>First, download the <a href="<%= Url.Action("demopreview") %>"><b>ONLYOFFICE Editors</b></a> (the ONLYOFFICE Document Server).</p>
<p>See the detailed guide to learn how to <a href="https://helpcenter.onlyoffice.com/server/developer-edition/windows/index.aspx?from=api_php_example">install Document Server for Windows</a>.</p>

<h2 id="win-2" class="copy-link"><span class="style_step">Step 2. </span>Download the PHP code for the editors integration</h2>
<p>Download the <a href="<%= Url.Action("demopreview") %>">PHP example</a> from our site.</p>
<p>You need to connnect the editors to your web site. For that specify the path to the editors installation in the <em>config.php</em> file:</p>
<pre>
$GLOBALS['DOC_SERV_CONVERTER_URL'] = "https://documentserver/ConvertService.ashx";
$GLOBALS['DOC_SERV_API_URL'] = "https://documentserver/web-apps/apps/api/documents/api.js";
$GLOBALS['DOC_SERV_PRELOADER_URL'] = "https://documentserver/web-apps/apps/api/documents/cache-scripts.html";
</pre>

<p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
<p>If you want to experiment with the editor configuration, modify the <a href="<%= Url.Action("advanced") %>">parameters</a> it the <em>doceditor.php</em> file.</p>

<h2 id="win-3" class="copy-link"><span class="style_step">Step 3. </span>Install the prerequisites</h2>
<p>
    You can use any web server capable of runnig PHP code to run the sample.
    We will demonstrate how to run the PHP sample using <b>Internet Information Services (IIS)</b> web server.
    To set up and configure PHP on IIS <b>PHP Manager for IIS</b> will be used.
</p>

<ul>
    <li><b>IIS: version 7</b> or later (refer to <a href="https://www.iis.net/learn/application-frameworks/scenario-build-a-php-website-on-iis/configuring-step-1-install-iis-and-php">Microsoft official website</a> to learn how to install <b>IIS</b>);</li>
    <li><b>PHP</b> (download it from the <a href="https://php.net/downloads.php">http://php.net</a> site);</li>
    <li><b>PHP Manager for IIS</b> (download it from the <a href="https://phpmanager.codeplex.com/releases/view/69115">Microsoft open source site</a>).</li>
</ul>

<h2 id="win-4" class="copy-link"><span class="style_step">Step 4. </span>IIS configuration</h2>
<ol>
    <li>
        <p><b>PHP Manager for IIS</b> configuration:</p>
        <p>After <b>PHP Manager for IIS</b> installation is complete launch the <b>IIS Manager:</b></p>
        <p>Start -> ControlPanel -> System and Security -> Administrative Tools -> Internet Information Services (IIS) Manager </p>
        <p>and find the <b>PHP Manager</b> feature in the <b>Features View</b> in <b>IIS</b>.</p>
        <img src="<%= Url.Content("~/content/img/php/manager.png") %>" alt="">

        <p>You need to register the installed PHP version in <b>IIS</b> using <b>PHP Manager</b>.</p>

        <p>
            Double-click <b>PHP Manager</b> to open it, click the <b>Register new PHP version</b> task and specify the full path to the main PHP executable file location.
            For example: <em>C:\Program Files\PHP\php-cgi.exe</em>.
        </p>
        <img src="<%= Url.Content("~/content/img/php/php-version-1.jpg") %>" width="700" alt="" />

        <p>After clicking <b>OK</b> the new <b>PHP version</b> will be registered with IIS and will become active.</p>
        <img src="<%= Url.Content("~/content/img/php/php-version-2.jpg") %>" width="650" alt="" />
    </li>
    <li>
        <p>Configure IIS to handle PHP requests:</p>
        <p>For IIS to host PHP applications, you must add handler mapping that tells IIS to pass all PHP-specific requests to the PHP application framework by using the FastCGI protocol.</p>
        <p>Double-click the <b>Handler Mappings</b> feature:</p>
        <img src="<%= Url.Content("~/content/img/php/handlerclick.png") %>" alt="" />

        <p>
            In the <b>Action</b> panel, click <b>Add Module Mapping</b>.
            In the <b>Add Module Mapping</b> dialog box, specify the configuration settings as follows:
        </p>
        <ul>
            <li>Request path: <b>*.php</b>,</li>
            <li>Module: <b>FastCgiModule</b>,</li>
            <li>Executable: <b>"C:\[Path to your PHP installation]\php-cgi.exe"</b>,</li>
            <li>
                <p>Name: <b>PHP via FastCGI</b>,</p>
                <p>click <b>OK</b>.</p>
            </li>
        </ul>
        <img src="<%= Url.Content("~/content/img/php/handler-add.png") %>" alt="" />
    </li>
</ol>
<p>After IIS manager configuration is complete everything is ready for running the <b>PHP</b> example.</p>

<h2 id="win-5" class="copy-link"><span class="style_step">Step 5. </span>Running your web site with the editors</h2>
<ol>
    <li>
        <p>Add your web site in the IIS Manager:</p>
        <p>On the <b>Connections</b> panel right-click the <b>Sites</b> node in the tree, then click <b>Add Website</b>.</p>
        <img alt="" src="<%= Url.Content("~/content/img/csharp/add.png") %>" />
    </li>
    <li>
        <p>In the <b>Add Website</b> dialog box specify the name of the folder with the PHP project in the <b>Site name</b> box.</p>
        <p>Specify the path to the folder with your project in the <b>Physical Path</b> box.</p>
        <p>Specify the unique value used only for this website in the <b>Port</b> box.</p>
        <img alt="" src="<%= Url.Content("~/content/img/editor/php-add.png") %>" />
    </li>
    <li>
        <p>Browse your web site with the IIS manager:</p>
        <p>Right-click the site -> <b>Manage Website</b> -> <b>Browse</b></p>
        <img alt="" src="<%= Url.Content("~/content/img/php/browse.png") %>" />
    </li>
</ol>

<h2 id="win-6" class="copy-link"><span class="style_step">Step 6. </span>Checking accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>


<h2 id="Linux" class="copy-link">Running the example on Linux OS</h2>
<h2 id="linux-1" class="copy-link"><span class="style_step">Step 1. </span>Download and Install Document Server</h2>
<p>First, download the <a href="<%= Url.Action("demopreview") %>"><b>ONLYOFFICE Editors</b></a> (the ONLYOFFICE Document Server).</p>
<p>See the detailed guide to learn how to <a href="https://helpcenter.onlyoffice.com/server/developer-edition/linux/index.aspx?from=api_php_example">install Document Server for Linux</a>.</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">Step 2. </span>Install the prerequisites and run the web site with the editors</h2>
<ol>
    <li>Install <b>Apache</b> and <b>PHP</b>:
        <div class="commandline">apt-get install -y apache2 php7.0 libapache2-mod-php7.0</div>
    </li>
    <li>Download the archive with the PHP example and unpack the archive:
        <div class="commandline">cd /var/www/html</div>
        <div class="commandline">wget https://api.onlyoffice.com/app_data/editor/PHP%20Example.zip</div>
        <div class="commandline">unzip PHP\ Example.zip</div>
    </li>
    <li>Change the current directory for the project directory:
        <div class="commandline">cd PHP\ Example/</div>
    </li>
    <li>Edit the <em>config.php</em> configuration file. Specify the name of your local server with the ONLYOFFICE Document Server installed.
        <div class="commandline">nano config.php</div>
        <p>Edit the following lines:</p>

        <pre>
$GLOBALS['DOC_SERV_CONVERTER_URL'] = "https://documentserver/ConvertService.ashx";
$GLOBALS['DOC_SERV_API_URL'] = "https://documentserver/web-apps/apps/api/documents/api.js";
$GLOBALS['DOC_SERV_PRELOADER_URL'] = "https://documentserver/web-apps/apps/api/documents/cache-scripts.html";
</pre>

        <p>Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
    </li>
    <li>Set permission for site:
        <div class="commandline">chown -R www-data:www-data /var/www/html</div>
    </li>
    <li>Restart apache:
        <div class="commandline">service apache2 restart</div>
    </li>
    <li>See the result in your browser using the address:
        <div class="commandline">http://localhost/PHP%20Example/</div>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">Step 3. </span>Checking accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>
