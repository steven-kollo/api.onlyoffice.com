<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to integrate online editors into your own web site on Java</span>
</h1>

<h2>Introduction</h2>
<p class="dscr">To integrate <b>ONLYOFFICE&trade; online editors</b> into your own website on <b>Java</b> you need to download and install ONLYOFFICE&trade; editors on your local server and use the <a href="<%= Url.Action("demopreview") %>">Java Example</a> for their integration.</p>
<p>You can choose any appropriate way how to run the Java example code. We will show how to run the Java code using the <b>Apache Tomcat</b> web server.</p>

<div class="note">The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application. <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!</div>

<p>This guide will show you the sequence of actions to integrate the editors successfully.</p>

<h2 id="wind-1"><span class="style_step">Step 1. </span>Download and Install Document Server</h2>
<p>First, download the <a href="<%= Url.Action("demopreview") %>"><b>ONLYOFFICE&trade; Editors</b></a> (the ONLYOFFICE&trade; Document Server).</p>
<p>See the detailed guide to learn how to install Document Server <a href="http://helpcenter.onlyoffice.com/server/windows/document/install-office-apps.aspx">for Windows</a> or <a href="http://helpcenter.onlyoffice.com/server/linux/document/index.aspx">for Linux</a>.</p>

<h2 id="wind-2"><span class="style_step">Step 2. </span>Download the Java code for the editors integration</h2>
<p>Download the <a href="<%= Url.Action("demopreview") %>">Java Example</a> from our site.</p>
<p>You need to connnect the editors to your web site. For that specify the path to the editors installation in the <em>\src\main\resources\settings.properties</em> file:</p>

<span class="commandline">files.docservice.url.storage=http://documentserver.com/FileUploader.ashx
files.docservice.url.converter=http://documentserver.com/ConvertService.ashx
files.docservice.url.tempstorage=http://documentserver.com/ResourceService.ashx
files.docservice.url.api=http://documentserver.com/web-apps/apps/api/documents/api.js
files.docservice.url.preloader=http://documentserver.com/web-apps/apps/api/documents/cache-scripts.html
</span>

<p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE&trade; Document Server installed.</p>
<p>If you want to experiment with the editor configuration, modify the <a href="<%= Url.Action("advanced") %>">parameters</a> it the <em>\src\main\webapp\editor.jsp</em> file.</p>

<h2 id="wind-3"><span class="style_step">Step 3. </span>Install the prerequisites</h2>
<p>To run the Java example code you will need to install the Java version appropriate for your OS and web server <b>Apache Tomcat</b>.</p>

<ul>
    <li>Java (download from  <a href="https://www.java.com/en/download/manual.jsp">the Oracle official web site</a>)</li>
    <li>Apache Tomcat (download from <a href="http://tomcat.apache.org/">the official website</a>)</li>
</ul>

<h2 id="wind-4"><span class="style_step">Step 4. </span>Running Apache Tomcat</h2>
<ol>
    <li>
        <p>After you have installed Java in Windows, you must set the <b>JAVA_HOME</b> environment variable to point to the Java installation directory.</p>
        <p>Find out where Java is installed. If you didn't change the path during installation, it will be something like this:</p>

        <pre>C:\Program Files\Java\jdk1.8.0_65</pre>
        <p>In <b>Windows 7</b> right click <b>My Computer</b> and select <b>Properties</b>, then click <b>Advanced</b>.</p>
        <p>In <b>Windows 8</b> go to <b>Control Panel</b> -> <b>System</b> -> <b>Advanced System Settings</b>.</p>
        <p>Click the <b>Environment Variables</b> button.</p>
        <p>Under <b>System Variables</b>, click <b>New</b>.</p>
        <p>In the <b>Variable Name</b> field, enter:</p>
        <p><b>JAVA_HOME</b> if you installed the <b>JDK</b> (Java Development Kit) or <b>JRE_HOME</b> if you installed the <b>JRE</b> (Java Runtime Environment).</p>
        <p>In the <b>Variable Value</b> field, enter your <b>JDK</b> or <b>JRE</b> installation path, for example C:\Program Files\Java\jdk1.8.0_65 </p>

        <img src="/content/img/java/make-var.png" alt="" />

        <p>Check if the variable created successfully by <b>echo</b> command in the <b>Command Prompt</b>:</p>
        <pre>echo %JAVA_HOME%</pre>
    </li>
    <li>
        <p>Run the <b>Command Prompt</b>. Change the current directory for the <b>Apache Tomcat</b> installation directory:</p>
        <pre>cd /d C:\Apache Tomcat\apache-tomcat-7.0.67\bin</pre>
    </li>
    <li>
        <p>Use the bin <em>startup.bat</em> script to start Apache Tomcat:</p>
        <pre>startup.bat</pre>
        <p>You will see the new <b>Tomcat</b> console window displayed that provides the information and mesages about Tomcat startup:</p>
        <img src="/content/img/java/tomcat-cmd.jpg" width="800" alt="" />

        <p>Test your Tomcat installation using the address in a web browser:</p>
        <div class="commandline">http://localhost:8080</div>
        <p>If everything is correct, you will see the Tomcat web page in the browser as shown below.</p>
    </li>
</ol>

<h2 id="wind-5"><span class="style_step">Step 5 . </span>Running the Java code</h2>
<ol>
    <li>
        <p>Open Tomcat Web Application Manager by clicking <b>Manager App:</b></p>
        <img src="/content/img/java/manager.jpg" width="700" alt="" />
    </li>
    <li>
        <p>Tomcat Web Application Manager will request the <b>username</b> and the <b>password:</b></p>
        <img src="/content/img/java/author.jpg" height="300" alt="" />

        <p>For that you will need to specify user data in <em>tomcat-users.xml</em> file in the Apache Tomcat installation folder. Define the <b>manager-gui</b> user role, specify the <b>user name</b> and <b>password</b> values:</p>

        <pre>
&lt;tomcat-users&gt;
    &lt;role rolename="manager-gui"/&gt;
    &lt;user username="tomcat" password="tomcat" roles="manager-gui"/&gt;
&lt;/tomcat-users&gt;
</pre>

    </li>
    <li>
        <p>Upload the Java project in Tomcat Web Application Manager. For that click <b>Choose File</b> in the <b>WAR file to deploy</b> section  and find the <b>.war</b> file in the Java project folder, then click <b>Deploy</b>.</p>
        <img src="/content/img/java/upload-app.jpg" width="800" alt="" />
        <img src="/content/img/java/war-file.jpg" width="600" alt="" />
    </li>
    <li>
        <p>You will see the project in the <b>Application List</b>:</p>
        <img src="/content/img/java/manager-app.jpg" width="800" alt="" />
    </li>
    <li>
        <p>Click the link with the application name to run it.</p>
    </li>
</ol>

<h2 id="wind-6"><span class="style_step">Step 6. </span>Checking accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>
