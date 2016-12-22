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

*THIS REPO IS ON ALPHA. IF YOU USE THIS, THERE MIGHT BE SOME ISSUES.*

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

Objects to Alpha~Beta.

Listed in alpabetical order.

- Necessary
  - [x] Default package bootstrapping using f, use-package, req-package
  - [x] Elisp package default setting
- High Priority
  - [x] Bash Shell script package default setting
  - [x] Batch script package default setting
  - [ ] C/C++ package default setting
  - [ ] CSS package default setting
  - [x] Elm package default setting
  - [x] Fish Shell script package default setting
  - [x] Git/GitHub package default setting
  - [x] Haskell package default setting
  - [x] HTML-like package default setting
  - [x] Java package default setting
  - [ ] JavaScript package default setting
  - [x] LaTeX package default setting
  - [ ] Less package default setting
  - [x] Markdown package default setting
  - [ ] Node.js package default setting
  - [ ] PHP package default setting
  - [x] Project support default seeting
  - [x] Python package default setting
  - [ ] Sass package default setting
  - [ ] SCSS package default setting
- Middle Priority
  - [ ] CoffeeScript package default setting
  - [ ] Database package default setting
  - [ ] Go package default setting
  - [x] OCaml package default setting
  - [x] Org package default setting
  - [ ] Rust package default setting
  - [x] Scala package default setting
  - [ ] Scheme package default setting
  - [x] TypeScript package default setting
- Low Priority
  - [ ] Android package default setting
  - [x] C# package default setting
  - [x] F# package default setting
  - [ ] Lisp package default setting
  - [x] Obj-C package default setting
  - [ ] Prolog package default setting
  - [ ] R package default setting
  - [ ] Ruby package default setting
  - [ ] Swift package default setting

## Author ##
Junyoung Clare Jang ( Github : Ailrun@github.com, Email : jjc9310@gmail.com )
