# :wrench: Custom Applications/Commands

#### Easily add new programs / commands to your Fac

```bash
# Go to Fac Resources
cd ~/fac/src/resources

# Open applications.csv (We will open with Vim but you could open to your favorite editor)
vim applications.csv
```

### Applications.csv structure

Each identifies a program and follows the following structure: **name**; **action**; **type**
| name | action| type  |
| :------------- |:-------------:| :-----:|
|Name to identify the program / command| Action to call the program or command itself | BROWSER for browsers <br> IDE for Ides <br> GENERAL for programs or commands|

After open applications.csv you will see something like this

```bash
#Referenced applications are described following the rule: NAME;ACTION;TYPE  

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

1) Define the Name
   
   Define the name from the application that will be added. This is used to identify the application when Fac list the applications/commands

2) Define the Action
   
   The first step is identify the alias to call the application at the terminal. You can search Google to find it if you do not know

   The Insomnia App have the alias *insomnia*. If we install insomnia in your PC and run the command insomnia , the application you be opened

3) Define the Type
   
   Fac Applications can be of 3 types: BROWSER, IDE, GENERAL. As Insomnia is neither a browser nor  an ide, let's put it in general

   The result is the following line to be added to the applications.csv:

```bash
Insomnia;insomnia;GENERAL
```
#### Adding a Command

In this example we will add a command to delete all docker containers

1) Define the Name
   
   Define the name from the command that will be added. This is used to identify the command when Fac list the applications/commands

2) Define the Action
   
   The action here is the commands that will run in the terminal. Since we intend to delete all docker containers, we will use the following command:
   ```bash
   docker rm -vf $(docker ps -a -q)
   ```
  
3) Define the Type
   
   Fac define that commands are the GENERAL type

The result is the following line to be added to the applications.csv:

```bash
Delete Containers;docker rm -vf $(docker ps -a -q);GENERAL

```




