

![fac logo](https://user-images.githubusercontent.com/17733053/76709507-04f29100-66de-11ea-9a8a-0b6a81d588aa.png)

## :question: What is Fac?
Fac is a powerful script that helps to optimize the opening of your workspaces. Create custom commands to **open programs** or perform **actions** quickly.

## :clapper: Demonstration

![fac_introduce](https://user-images.githubusercontent.com/17733053/103103614-eb815c80-4600-11eb-9a2b-e34cb5a9165c.gif)

## :bookmark: Requirement

- [**Unix Shell**](https://en.wikipedia.org/wiki/Bash_(Unix_shell))

## :building_construction: Installation

```bash
# Clone  the repository
git clone https://github.com/arielroque/Fac.git

# Enter in the directory using cd
cd Fac

# Add permition to execute the Fac Scripts
chmod +x ./*

# Execute the following script
source install.sh

```
## :computer: Usage

After install,close the terminal to persist the changes and open another terminal with following command to open Fac:
```bash
fac open
```
### Others commands

To see another commands from Fac CLI, run:
 ```bash
fac 
```
#### Available Commands

```bash
   open         Open the Fac
   ls           List all created commands
   rm           Remove a command created
   uninstall    Uninstall Fac
```
## :wrench: Custom Applications/Commands

Customizing Fac with new programs or commands is easy, please read [CUSTOMIZING.md](/CUSTOMIZING.md) for details.

## :camera: Screenshots
![fac_screenshot](https://user-images.githubusercontent.com/17733053/103104782-115e2f80-4608-11eb-8f6a-726bf955cd9d.png)

## :wastebasket: Uninstall

If you want to delete the Fac from your computer, just use the following command

```bash
fac uninstall
```
## :rocket: Contributing

Pull request are also welcome , please read  [CONTRIBUTING.md](/CONTRIBUTING.md)  for details on our code of conduct, and the process for submitting pull requests to us.
    
-   Check  [issue templates](https://github.com/arielroque/Fac/issues)  for the suggested issue formats

## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Farielroque%2Ffac.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Farielroque%2Ffac?ref=badge_large)

This project is licensed under the Apache License - see the [LICENSE.md](https://github.com/arielroque/fac/blob/developer/LICENSE) for details
