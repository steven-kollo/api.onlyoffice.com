# How to integrate online editors into your own web site on Java

## Introduction

To integrate **ONLYOFFICE online editors** into your own website on **Java** you need to download and install ONLYOFFICE editors on your local server and use the [Java Example](https://api.onlyoffice.com/editors/demopreview) for their integration.

You can choose any appropriate way how to run the Java example code. We will show how to run the Java code using the Apache Tomcat web server on Windows OS and Linux OS.

> The integration examples are used to demonstrate document editors functions and the ways to connect Document Server to your own application. DO NOT USE these examples on your own server without PROPER CODE MODIFICATIONS!

This guide will show you the sequence of actions to integrate the editors successfully.

## Running the example on Windows OS

### Step 1. Download and Install Document Server

First, download the [ONLYOFFICE Editors](https://api.onlyoffice.com/editors/demopreview) (the ONLYOFFICE Document Server).

See the detailed guide to learn how to install Document Server for [Windows](https://helpcenter.onlyoffice.com/server/developer-edition/windows/index.aspx?from=api_java_example).

### Step 2. Download the Java code for the editors integration

Download the [Java example](https://api.onlyoffice.com/editors/demopreview) from our site.

You need to connnect the editors to your web site. For that specify the path to the editors installation in the `\src\main\resources\settings.properties` file:

```c#
files.docservice.url.converter=https://documentserver/ConvertService.ashx
files.docservice.url.tempstorage=https://documentserver/ResourceService.ashx
files.docservice.url.api=https://documentserver/web-apps/apps/api/documents/api.js
files.docservice.url.preloader=https://documentserver/web-apps/apps/api/documents/cache-scripts.html
```

where the **documentserver** is the name of the server with the ONLYOFFICE Document Server installed.

If you want to experiment with the editor configuration, modify the parameters it the `\src\main\webapp\editor.jsp` file.

### Step 3. Install the prerequisites

To run the Java example code you will need to install the Java version appropriate for your OS and web server **Apache Tomcat**:

* Java (download from [the Oracle official web site](https://www.java.com/en/download/manual.jsp));

* Apache Tomcat (download from [the official website](http://tomcat.apache.org/)).

### Step 4. Running Apache Tomcat

1. After you have installed Java in Windows, you must set the **JAVA_HOME** environment variable to point to the Java installation directory.

    Find out where Java is installed. If you didn't change the path during installation, it will be something like this:
`C:\Program Files\Java\jdk1.8.0_65`

    In **Windows 7** right click **My Computer** and select **Properties**, then click **Advanced**.

    In **Windows 8** go to **Control Panel** -> **System** -> **Advanced System Settings**.

    Click the **Environment Variables** button.

    Under **System Variables**, click **New**.

    In the **Variable Name** field, enter:

    **JAVA_HOME** if you installed the **JDK** (Java Development Kit) or **JRE_HOME** if you installed the **JRE** (Java Runtime Environment).

    In the **Variable Value** field, enter your **JDK** or **JRE** installation path, for example `C:\Program Files\Java\jdk1.8.0_65`.

    ![ENV](https://api.onlyoffice.com/content/img/java/make-var.png)

    Check if the variable created successfully by **echo** command in the **Command Prompt**:

    ```commandline
    echo %JAVA_HOME%
    ```

2. Run the **Command Prompt**. Change the current directory for the **Apache Tomcat** installation directory:

    ```commandline
    cd /d C:\Apache Tomcat\apache-tomcat-7.0.67\bin
    ```

3. Use the bin `startup.bat` script to start Apache Tomcat:

    ```commandline
    startup.bat
    ```

    You will see the new Tomcat console window displayed that provides the information and mesages about Tomcat startup:

    ![Tomcat](https://api.onlyoffice.com/content/img/java/tomcat-cmd.jpg)

    Test your Tomcat installation using the address in a web browser:

    ```property
    http://localhost:8080
    ```

    If everything is correct, you will see the Tomcat web page in the browser as shown below.

### Step 5 . Running the Java code

1. Open Tomcat Web Application Manager by clicking **Manager App**:

    ![Manager App](https://api.onlyoffice.com/content/img/java/manager.jpg)

2. Tomcat Web Application Manager will request the **username** and the **password**:

    ![Tomcat Web Application Manager](https://api.onlyoffice.com/content/img/java/author.jpg)

    For that you will need to specify user data in tomcat-users.xml file in the Apache Tomcat installation folder. Define the **manager-gui** user role, specify the **user name** and **password** values:

    ```xml
        <tomcat-users>
        <role rolename="manager-gui"/>
        <user username="tomcat" password="tomcat" roles="manager-gui"/>
        </tomcat-users>
    ``

3. Upload the Java project in Tomcat Web Application Manager. For that click **Choose File** in the **WAR file to deploy** section and find the **.war** file in the Java project folder, then click **Deploy**.

    ![Deploy](https://api.onlyoffice.com/content/img/java/upload-app.jpg)
    ![Open File](https://api.onlyoffice.com/content/img/java/war-file.jpg)

4. You will see the project in the **Application List**:

    ![Application List](https://api.onlyoffice.com/content/img/java/manager-app.jpg)

5. Click the link with the application name to run it.

### Step 6. Checking accessibility

In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of **documentserver** in the configuration files. And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of **example.com** in the configuration files.

If you integrated the editors successfully the result should look like the [demo preview](https://api.onlyoffice.com/editors/demopreview#DemoPreview) on our site.

## Running the example on Linux OS

### Step 1. Download and Install Document Server

First, download the [ONLYOFFICE Editors](https://api.onlyoffice.com/editors/demopreview) (the ONLYOFFICE Document Server).

See the detailed guide to learn how to [install Document Server for Linux](https://helpcenter.onlyoffice.com/server/developer-edition/linux/index.aspx?from=api_java_example).

### Step 2. Install the prerequisites and run the web site with the editors

1. Install **Java**:

    ```bash
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer
    ```

2. Download the archive with the Java example and unpack the archive:

    ```bash
        wget https://api.onlyoffice.com/app_data/editor/Java%20Example.zip
    ```

    ```bash
        unzip Java\ Example.zip
    ```

3. Change the current directory for the project directory:

    ```bash
        cd Java\ Example/
    ```

4. Edit the `settings.properties` configuration file. Specify the name of your local server with the ONLYOFFICE Document Server installed.

    ```bash
        nano src/main/resources/settings.properties
    ```

    Edit the following lines:

    ```property
        files.docservice.url.converter=https://documentserver/ConvertService.ashx
        files.docservice.url.tempstorage=https://documentserver/ResourceService.ashx
        files.docservice.url.api=https://documentserver/web-apps/apps/api/documents/api.js
        files.docservice.url.preloader=https://documentserver/web-apps/apps/api/documents/cache-scripts.html
    ```

    Where the **documentserver** is the name of the server with the ONLYOFFICE Document Server installed.

5. Install **Maven**:

    ```bash
    sudo apt-get install maven
    ```

6. Build:

    ```bash
    mvn package
    ```

7. Install **Tomcat** with the administration page:

    ```bash
    sudo apt-get install tomcat8 tomcat8-admin
    ```

8. Configure the admin user on Tomcat:

    ```bash
    sudo nano /var/lib/tomcat8/conf/tomcat-users.xml
    ```

    Insert the line:

    ```xml
    <role rolename="manager-gui"/>
    <user username="USERNAME" password="PASSWORD" roles="manager-gui"/>
    ```

    Where the **USERNAME** and **PASSWORD** are your own credentials data.

    Restart timcat:

    ```bash
    systemctl restart tomcat8
    ```

9. Open the tomcat administration page in browser with the admin user credentions:

    ```property
    http://localhost:8080/manager/html
    ```

10. Select the WAR file to upload from `target/OnlineEditorsExampleJava-1.0.war`.

11. See the result in your browser using the address:

    ```property
    http://localhost:8080/OnlineEditorsExampleJava-1.0/
    ```

### Step 3. Checking accessibility

In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of **documentserver** in the configuration files. And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of **example.com** in the configuration files.

If you integrated the editors successfully the result should look like the [demo preview](https://api.onlyoffice.com/editors/demopreview#DemoPreview) on our site.











