<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to integrate online editors into your own website on Java Spring</span>
</h1>

<h2>Overview</h2>
<p class="dscr">This example will help you integrate ONLYOFFICE Docs into your web application written in Java with Spring Boot.</p>
<p>Spring Boot has a lot of functionality, but its most significant features are: dependency management, auto-configuration, and built-in servlet containers.</p>

<div class="note">
    The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application.
    <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!
</div>

<h2 id="Windows" class="copy-link">For Windows</h2>
<h2 id="win-1" class="copy-link"><span class="style_step">Step 1. </span>Install ONLYOFFICE Docs</h2>
<p>Download and install <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE Docs</a> (packaged as Document Server).</p>
<p>See the detailed guide to learn how to install Document Server <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_csharp_example">for Windows</a>.</p>

<h2 id="win-2" class="copy-link"><span class="style_step">Step 2. </span>Download the Java code for the editors integration</h2>
<p>Download the <a href="<%= Url.Action("demopreview") %>">Java-Spring example</a> from our site.</p>
<p>To connect the editors to your website, specify the path to the editors installation, server address and port in the <em>\src\main\resources\application.properties</em> file:</p>

<pre>
server.port=port
files.docservice.url.site=https://documentserver/
</pre>

<p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed, <b>port</b> is any available port.
    Comment the address line if you want to use localhost.</p>
<p>If you want to experiment with the editor configuration, modify the <a href="<%= Url.Action("advanced") %>">parameters</a> in the <em>\src\main\webapp\editor.jsp</em> file.</p>

<h2 id="win-3" class="copy-link"><span class="style_step">Step 3. </span>Install the prerequisites</h2>
<p>To run the Java-Spring example code, install the Java version 11 appropriate for your OS and framework <b>Apache Maven</b>:</p>

<ul>
    <li><b>Java</b> (download from  <a href="https://www.oracle.com/java/technologies/downloads/#java11">the Oracle official website</a>);</li>
    <li><b>Apache Maven</b> (download from <a href="https://maven.apache.org/download.cgi">the official website</a>).</li>
</ul>

<h2 id="win-4" class="copy-link"><span class="style_step">Step 4. </span>Set environment variables</h2>
<ol>
    <li>
        <p>After you have installed Java on Windows, set the <b>JAVA_HOME</b> environment variable to point to the Java installation directory.</p>
        <p>
            Find out where Java is installed.
            If you didn't change the path during installation, it will be something like this:
        </p>

        <pre>C:\Program Files\Java\jdk11</pre>
        <p>In <b>Windows 7</b>, right click <b>My Computer</b> and select <b>Properties</b>, then click <b>Advanced</b>.</p>
        <p>In <b>Windows 8</b>, go to <b>Control Panel</b> and select <b>System</b>, then click <b>Advanced System Settings</b>.</p>
        <p>Click the <b>Environment Variables</b> button.</p>
        <p>Under <b>System Variables</b>, click <b>New</b>.</p>
        <p>In the <b>Variable Name</b> field, enter <b>JAVA_HOME</b> if you installed the <b>JDK</b> (Java Development Kit) or <b>JRE_HOME</b> if you installed the <b>JRE</b> (Java Runtime Environment).</p>
        <p>In the <b>Variable Value</b> field, enter your <b>JDK</b> or <b>JRE</b> installation path, for example <em>C:\Program Files\Java\jdk11</em>.</p>

        <p>Check if the variable created successfully by <b>echo</b> command in the <b>Command Prompt</b>:</p>
        <pre>echo %JAVA_HOME%</pre>
    </li>
    <li>
        <p>Set the <b>MAVEN_HOME</b> environment variable:</p>
        <p>Unzip the downloaded archive with Maven to any directory. It will be something like this:</p>

        <pre>C:\apache-maven-3.8.1</pre>
        <p>In <b>Windows 7</b>, right click <b>My Computer</b> and select <b>Properties</b>, then click <b>Advanced</b>.</p>
        <p>In <b>Windows 8</b>, go to <b>Control Panel</b> and select <b>System</b>, then click <b>Advanced System Settings</b>.</p>
        <p>Click the <b>Environment Variables</b> button.</p>
        <p>Under <b>System Variables</b>, click <b>New</b>.</p>
        <p>In the <b>Variable Name</b> field, enter <b>MAVEN_HOME</b>.</p>
        <p>In the <b>Variable Value</b> field, enter your <b>JDK</b> or <b>JRE</b> installation path, for example <em>C:\apache-maven-3.8.1</em>.</p>
        <p>In the system variables, find <b>PATH</b>, click the <b>Edit...</b> button. In the <b>Edit environment variable</b> dialog, click the <b>New</b> button 
            and add <em>C:\apache-maven-3.8.1\bin</em> to the <b>PATH</b> system variable.</p>

        <p>Check if the variable created successfully by <b>echo</b> command in the <b>Command Prompt</b>:</p>
        <pre>echo %MAVEN_HOME%</pre>
    </li>
</ol>


<h2 id="win-5" class="copy-link"><span class="style_step">Step 5. </span>Start application with Maven</h2>
<ol>
    <li>
        <p>Open a console and go to the <em>java-spring</em> folder using the <b>cd</b> command:</p>
        <pre>
cd C:\Program Files\document-server-integration\web\documentserver-example\java-spring
</pre>
    </li>
    <li>
        <p>In the open console, enter the following commands:</p>
        <pre>
mvn clean
mvn package
mvn spring-boot:run
</pre>
    </li>
    <li>
        <p>Open your browser using <b>server.address</b> and <b>server.port</b>:</p>
        <pre>
http://server.address:server.port/
</pre>
    </li>


<h2 id="win-6" class="copy-link"><span class="style_step">Step 6. </span>Check accessibility</h2>

<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    Make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>


<h2 id="Linux" class="copy-link">For Linux</h2>
<h2 id="linux-1" class="copy-link"><span class="style_step">Step 1. </span>Install ONLYOFFICE Docs</h2>
<p>Download and install <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE Docs</a> (packaged as Document Server).</p>
<p>See the detailed guide to learn how to install Document Server <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_csharp_example">for Linux</a>.</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">Step 2. </span>Install the prerequisites and run the website with the editors</h2>
<ol>
    <li>Install <b>Java</b>:
        <span class="commandline">sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java11-installer</span>
    </li>
    <li>
        <p>There are two ways to get the Java-Spring example:</p>
        <ul>
            <li>
                <p>download the archive with the Java-Spring example and unpack it:</p>
                <span class="commandline">wget https://api.onlyoffice.com/app_data/editor/Java-Spring%20Example.zip</span>
                <span class="commandline">unzip Java-Spring\ Example.zip</span>
            </li>
            <li>
                <p>clone the git repository:</p>
                <span class="commandline">git clone https://github.com/ONLYOFFICE/document-server-integration.git</span>
            </li>
        </ul>
    </li>
    <li>
        <p>Change the current directory for the project directory:</p>
        <ul>
            <li>
                <p>in the archive:</p>
                <div class="commandline">cd Java-Spring\ Example</div>
            </li>
            <li>
                <p>in the git repository:</p>
                <div class="commandline">cd document-server-integration/web/documentserver-example/java-spring</div>
            </li>
        </ul>
    </li>
    <li>Edit the <em>application.properties</em> configuration file.
        Specify the name of your local server with the ONLYOFFICE Docs installed.
        <div class="commandline">nano src/main/resources/application.properties</div>
        <p>Edit the following lines:</p>

        <pre>
server.port=port
files.docservice.url.site=https://documentserver/
</pre>

        <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed, <b>port</b> is any available port. 
    Comment the address line if you want to use localhost.</p>
    </li>
    <li>Install <b>Maven</b>:
        <div class="commandline">sudo apt-get install maven</div>
    </li>
    <li>Build:
        <div class="commandline">mvn package</div>
    </li>
    <li>
        <p>Start Java-Spring example:</p>
        <div class="commandline">./mvnw spring-boot:run</div>
    </li>
    <li>
        <p>Open your browser using <b>server.address</b> and <b>server.port</b>:</p>
        <div class="commandline">http://server.address:server.port/</div>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">Step 3. </span>Check accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    Make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>


<h2 id="Docker" class="copy-link">For Docker</h2>

<ol>
    <li>Edit the <em>application.properties</em> configuration file.
        Specify the name of your local server with the ONLYOFFICE Docs <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx">installed</a>.
        <div class="commandline">nano src/main/resources/application.properties</div>
        <p>Edit the following lines:</p>

        <pre>
server.address=address
server.port=port
files.docservice.url.site=https://documentserver/ 
</pre>

        <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed, <b>address</b> is the server address, <b>port</b> is any available port. 
    Comment the address line if you want to use localhost.</p>
    </li>
    <li>Run the next command in the Java-Spring example directory:
        <div class="commandline">docker-compose up</div>
    </li>
    <li>
        <p>Open your browser using <b>server.address</b> and <b>server.port</b>:</p>
        <div class="commandline">http://server.address:server.port/</div>
    </li>
</ol>
