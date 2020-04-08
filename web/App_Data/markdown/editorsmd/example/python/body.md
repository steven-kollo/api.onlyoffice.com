# How to integrate online editors into your own web site on Python

## Introduction

To integrate **ONLYOFFICE online editors** into your own web site on **Python** you need to download and install ONLYOFFICE editors on your local server and use the [Python Example](https://api.onlyoffice.com/editors/demopreview) for their integration. We will show how to run the Python example on Linux OS.

>The integration examples are used to demonstrate document editors functions and the ways to connect **Document Server** to your own application. **DO NOT USE** these examples on your own server without **PROPER CODE MODIFICATIONS**!

This guide will show you the sequence of actions to integrate the editors successfully.

## Step 1. Download and Install Document Server

First, download [ONLYOFFICE Editors](https://api.onlyoffice.com/editors/demopreview) (the ONLYOFFICE Document Server).

See the detailed guide to learn how to install Document Server  [for Windows](https://helpcenter.onlyoffice.com/server/developer-edition/windows/index.aspx?from=api_python_example), [for Linux](https://helpcenter.onlyoffice.com/server/developer-edition/linux/index.aspx?from=api_python_example), or [for Docker](https://helpcenter.onlyoffice.com/server/developer-edition/docker/docker-installation.aspx?from=api_python_example).

## Step 2. Install the prerequisites and run the web site with the editors

1. Python comes preinstalled on most Linux distributions, and is available as a package on all others. Python 3.6+ is required. Please proceed to [official documentation](https://docs.python.org/3/using/unix.html) if you have any troubles.

2. Download the archive with the Python example and unpack the archive:

    ```bash
    wget "https://api.onlyoffice.com/app_data/editor/Python%20Example.zip"
    ```

    ```bash
    unzip Python\ Example.zip
    ```

3. Change the current directory for the project directory:

    ```bash
    cd Python\ Example
    ```

4. Install the dependencies:

    ```bash
    pip install Django==2.2.6
    ```

    ```bash
    pip install requests==2.22.0
    ```

    ```bash
    pip install pyjwt==1.7.1
    ```

5. Edit the `config.py` configuration file. Specify the name of your local server with the ONLYOFFICE Document Server installed. And specify the name of the server on which example is installed.

    ```bash
    nano config.py
    ```

    Edit the following lines:

    ```py
    DOC_SERV_CONVERTER_URL = 'https://documentserver/ConvertService.ashx'
    DOC_SERV_API_URL = 'https://documentserver/web-apps/apps/api/documents/api.js'
    DOC_SERV_PRELOADER_URL = 'https://documentserver/web-apps/apps/api/documents/cache-scripts.html'

    EXAMPLE_DOMAIN = 'https://exampleserver/'
    ```

    Where the **documentserver** is the name of the server with the ONLYOFFICE Document Server installed.

    And the **exampleserver** is the name of the server with the Python Example.

6. Run the **Python** server:

    ```property
    python manage.py runserver 0.0.0.0:80
    ```

7. See the result in your browser using the address:

    ```xml
    http://localhost
    ```

## Step 3. Checking accessibility

In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of **documentserver** in the configuration files. And you must also make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of **exampleserver** in the configuration files.

If you integrated the editors successfully the result should look like the [demo preview](https://api.onlyoffice.com/editors/demopreview#DemoPreview) on our site.
