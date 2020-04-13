# How to integrate online editors into your own web site on PHP

## Introduction

To integrate __ONLYOFFICE online editors__ into your own website on __PHP__ you need to download and install ONLYOFFICE editors on your local server and use the [PHP Example](/editors/demopreview) for their integration. We will show you how to run the PHP example on [Windows OS](/editors/example/php#Windows) and [Linux OS](/editors/example/php#Linux).

>The integration examples are used to demonstrate document editors functions and the ways to connect __Document Server__ to your own application. __DO NOT USE__ these examples on your own server without __PROPER CODE MODIFICATIONS__!

This guide will show you the sequence of actions to integrate the editors successfully.

## Running the example on Windows OS

### Step 1. Download and Install Document Server on Windows OS

First, download the [ONLYOFFICE Editors](/editors/demopreview) (the ONLYOFFICE Document Server).

See the detailed guide to learn how to [install Document Server for Windows](https://helpcenter.onlyoffice.com/server/developer-edition/windows/index.aspx?from=api_php_example).

### Step 2. Download the PHP code for the editors integration

Download the [PHP example](/editors/demopreview) from our site.

You need to connnect the editors to your web site. For that specify the path to the editors installation in the __config.php__ file:

```php
$GLOBALS['DOC_SERV_CONVERTER_URL'] = "https://documentserver/ConvertService.ashx";
$GLOBALS['DOC_SERV_API_URL'] = "https://documentserver/web-apps/apps/api/documents/api.js";
$GLOBALS['DOC_SERV_PRELOADER_URL'] = "https://documentserver/web-apps/apps/api/documents/cache-scripts.html";
```

where the __documentserver__ is the name of the server with the ONLYOFFICE Document Server installed.

If you want to experiment with the editor configuration, modify the [parameters](/editors/advanced) it the _doceditor.php_ file.

### Step 3. Install the prerequisites

You can use any web server capable of runnig PHP code to run the sample. We will demonstrate how to run the PHP sample using __Internet Information Services (IIS)__ web server. To set up and configure PHP on IIS __PHP Manager for IIS__ will be used.

* __IIS: version 7__ or later (refer to [Microsoft official website](https://docs.microsoft.com/en-us/iis/application-frameworks/scenario-build-a-php-website-on-iis/configuring-step-1-install-iis-and-php) to learn how to install IIS);
* __PHP__ (download it from the <http://php.net> site);
* __PHP Manager for IIS__ (download it from the [Microsoft open source site](https://phpmanager.codeplex.com/releases/view/69115)).

### Step 4. IIS configuration

1. __PHP Manager for IIS__ configuration:

    After __PHP Manager for IIS__ installation is complete launch the __IIS Manager__:

    Start -> ControlPanel -> System and Security -> Administrative Tools -> Internet Information Services (IIS) Manager

    and find the __PHP Manager__ feature in the __Features View__ in __IIS__.

    ![manager.png](/content/img/php/manager.png)

    You need to register the installed PHP version in __IIS__ using __PHP Manager__.

    Double-click __PHP Manager__ to open it, click the __Register new PHP version__ task and specify the full path to the main PHP executable file location. For example: _C:\Program Files\PHP\php-cgi.exe_.

    ![php-version-1.jpg](/content/img/php/php-version-1.jpg)

    After clicking __OK__ the new __PHP version__ will be registered with IIS and will become active.

    ![php-version-2.png](/content/img/php/php-version-2.jpg)

2. Configure IIS to handle PHP requests:

    For IIS to host PHP applications, you must add handler mapping that tells IIS to pass all PHP-specific requests to the PHP application framework by using the FastCGI protocol.

    Double-click the _Handler Mappings_ feature:

    ![handlerxlick.png](/content/img/php/handlerclick.png)

    In the __Action__ panel, click __Add Module Mapping__. In the __Add Module Mapping__ dialog box, specify the configuration settings as follows:

    * Request path: *.__php__,
    * Module: __FastCgiModule__,
    * Executable: "__C:\[Path to your PHP installation]\php-cgi.exe__",
    * Name: __PHP via FastCGI__,

    click __OK__.

    ![handler-add.png](/content/img/php/handler-add.png)

    After IIS manager configuration is complete everything is ready for running the __PHP__ example.

### Step 5. Running your web site with the editors

1. Add your web site in the IIS Manager:

    On the __Connections__ panel right-click the __Sites__ node in the tree, then click __Add Website__.

    ![add.png](/content/img/csharp/add.png)

2. In the ___Add Website___ dialog box specify the name of the folder with the PHP project in the __Site name__ box.

    Specify the path to the folder with your project in the __Physical Path__ box.

    Specify the unique value used only for this website in the __Port__ box.

    ![php-add.png](/content/img/editor/php-add.png)

3. Browse your web site with the IIS manager:

    Right-click the site -> __Manage Website__ -> __Browse__

    ![browse.png](/content/img/php/browse.png)

### Step 6. Checking accessibility

In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the __Document Server__ with the address which you specify instead of documentserver in the configuration files. And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of __example.com__ in the configuration files.

## Running the example on Linux OS

### Step 1. Download and Install Document Server on Linux OS

First, download the [ONLYOFFICE Editors](/editors/demopreview) (the ONLYOFFICE Document Server).

See the detailed guide to learn how to [install Document Server for Linux](https://helpcenter.onlyoffice.com/server/developer-edition/linux/index.aspx?from=api_php_example).

### Step 2. Install the prerequisites and run the web site with the editors

1. Install __Apache__ and __PHP__:

    ```bash
    apt-get install -y apache2 php7.0 libapache2-mod-php7.0
    ```

2. Download the archive with the PHP example and unpack the archive:

    ```bach
    cd /var/www/html
    ```

    ```bach
    wget https://api.onlyoffice.com/app_data/editor/PHP%20Example.zip
    ```

    ```bach
    unzip PHP\ Example.zip
    ```

3. Change the current directory for the project directory:

    ```bach
    cd PHP\ Example/
    ```

4. Edit the _config.php_ configuration file. Specify the name of your local server with the __ONLYOFFICE Document Server__ installed.

    ```bach
    nano config.php
    ```

    Edit the following lines:

    ```php
    $GLOBALS['DOC_SERV_CONVERTER_URL'] = "https://documentserver/ConvertService.ashx";
    $GLOBALS['DOC_SERV_API_URL'] = "https://documentserver/web-apps/apps/api/documents/api.js";
    $GLOBALS['DOC_SERV_PRELOADER_URL'] = "https://documentserver/web-apps/apps/api/documents/cache-scripts.html";
    ```

    Where the __documentserver__ is the name of the server with the ONLYOFFICE Document Server installed.

5. Set permission for site:

    ```bach
    chown -R www-data:www-data /var/www/html
    ```

6. Restart apache:

    ```apache
    service apache2 restart
    ```

7. See the result in your browser using the address:

    ```xyi
    http://localhost/PHP%20Example/
    ```

### Step 3. Checking accessibility

In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of _documentserver_ in the configuration files. And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of __example.com__ in the configuration files.

If you integrated the editors successfully the result should look like the [demo preview](/editors/demopreview#DemoPreview) on our site.
