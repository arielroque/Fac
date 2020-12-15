# :wrench: Custom Applications/Commands

#### Easily add new programs / commands to your fac

```bash
# Go to Fac Resources
cd ~/fac/src/resources

# Open applications.csv (We will open with Vim but you could open to your favorite editor)
vim applications.csv
```

After open applications.csv you will see something like this

```bash
#Referenced applications are described following the rule: COMMAND_NAME;ALIAS;TYPE  

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

### Applications.csv structure

Each identifies a program and follows the following structure: **command name**; **alias**; **type**
| Command Name | Alias| Type  |
| :------------- |:-------------:| :-----:|
|Name to identify the program / command| Alias to call the program or command itself | BROWSER - browsers <br> IDE for Ides <br> GENERAL for programs or commands|


