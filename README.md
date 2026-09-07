# Yet Another Emacs Settings #

There are **Yet Another Emacs Settings** you should try.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
## Table of Contents ##

- [Yet Another Emacs Settings](#yet-another-emacs-settings)
    - [Version](#version)
    - [Description](#description)
    - [Usage](#usage)
        - [How to Install](#how-to-install)
        - [Configurations](#configurations)
    - [Status](#status)
    - [Author](#author)

<!-- markdown-toc end -->

## Version ##
![](https://img.shields.io/badge/Version-0.02.00-lightgrey.svg?style=flat)
![](https://img.shields.io/badge/Status-Alpha-yellow.svg?style=flat)

## Description ##
*Emacs* (with *elpa*) has so many packages in it. Therefore new users of *Emacs* will be confused by mountain of packages and bury *Emacs* for good.

**Yet Another Emacs Settings** (**YAES**) is a *Emacs* setting files to lighten those confusion.

## Usage ##

### How to Install ###
First, find your default loading path of emacs.

If you didn't use any tweak and `-u` option for emacs start-up, it starts at your home directory.  
You can move to there by following commands on -Nix and OSX.

```
cd ~
```

If you use windows, you can find home at emacs using `C-x C-f ~/ <RET>` commands. (First line of the buffer is path of your home directory)

Open your home directory with git, what you needs to install are following.

```
git clone https://github.com/Ailrun/yet-another-emacs-settings .emacs.d
cd .emacs.d
```

If you don't have make command, install GNU make for your OS.

### Configurations ###

Will be added ASAP.

## Status ##

Listed in alpabetical order.

- Necessary
  - [x] Default package bootstrapping using elpaca, f, use-package
  - [x] Elisp package settings
  - [x] Language server protocol package settings
- High Priority
  - [x] Bash Shell script package settings
  - [x] Batch script package settings
  - [x] Fish Shell script package settings
  - [x] Git/GitHub package settings
  - [x] Haskell package settings
  - [x] HTML-like package settings
  - [x] Java package settings
  - [x] JavaScript package settings
  - [x] LaTeX package settings
  - [x] Markdown package settings
  - [x] Node.js package settings
  - [x] OCaml package settings
  - [x] Project support default seeting
  - [x] Python package settings
  - [x] TypeScript package settings
- Middle Priority
  - [ ] Go package settings
  - [ ] Org package settings
  - [x] Rust package settings
  - [x] Scala package settings
  - [ ] Scheme package settings
- Low Priority
  - [ ] Android package settings
  - [x] C# package settings
  - [ ] Database package settings
  - [x] Elm package settings
  - [x] F# package settings
  - [ ] Lisp package settings
  - [x] Obj-C package settings
  - [ ] R package settings
  - [ ] Ruby package settings
  - [ ] Swift package settings

## Author ##
Junyoung Clare Jang (@Ailrun)
