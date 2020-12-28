# :wrench: Custom Applications/Commands

#### Easily add new programs / commands to your Fac

```bash
# Go to Fac Resources
cd ~/fac/src/resources

# Open applications.csv (We will open with Vim but you could open to your favorite editor)
vim applications.csv
```

### Applications.csv structure

Each identifies a program and follows the following structure: **name**; **alias**; **type**
| name | alias| type  |
| :------------- |:-------------:| :-----:|
|Name to identify the program / command| Alias to call the program or command itself | BROWSER for browsers <br> IDE for Ides <br> GENERAL for programs or commands|

After open applications.csv you will see something like this

```bash
#Referenced applications are described following the rule: NAME;ALIAS;TYPE  

Google Chrome;google-chrome;BROWSER
Google Chrome Anonymous;google-chrome --incognito;BROWSER
Google Chrome (Security Disable);google-chrome-stable --disable-web-security --user-data-dir=~/.config/google-chrome/Default";BROWSER
Mozila Firefox;firefox;BROWSER

Visual Code Project;code;IDE
Sublime Ide Project;subl;IDE

Libre Office;libreoffice;GENERAL
Calculator;gnome-calculator;GENERAL
Slack;slack;GENERAL
Spotify;spotify;GENERAL
```
#### Adding a New Application

In this example we will add the Insomnia App

1) Look for the alias from the application
   The first step is identify the alias to call the application at the terminal. You can search Google to find it if you do not know

   The Insomnia App have the alias *insomnia*. If we install insomnia in your PC and run the command insomnia , the application you be opened

2) Define the Name
   Define the name from the application that will be added. This is used to identify the application when Fac list the applications

3) Define the Type
   Fac Applications can be of 3 types: BROWSER, IDE, GENERAL. As Insomnia is neither a browser nor  an ide, let's put it in general

The result is the following line to be added to the applications.csv:

```bash
Insomnia;insomnia;GENERAL
```
#### Adding a Command


