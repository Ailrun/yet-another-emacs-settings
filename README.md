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
![](https://img.shields.io/badge/Emacs->24.5-green.svg?style=flat)
![](https://img.shields.io/badge/Version-0.01.01-lightgrey.svg?style=flat)
![](https://img.shields.io/badge/Status-Alpha-yellow.svg?style=flat)

*THIS REPO IS ON ALPHA. IF YOU USE THIS, THERE MIGHT BE SOME ISSUES.*

## Description ##
*Emacs* has so many packages in it. Therefore new users of *Emacs* will be confused by mountain of packages and bury *Emacs* for good.

**Yet Another Emacs Settings** (**YAES**) is a *Emacs* setting files to lighten those confusing.

## Usage ##

### How to Install ###
First, find your default loading path of emacs.

If you didn't use any tweak or `-u` option for emacs start-up, it is your home directory and you can move to there by following commands,

```
cd ~
```

or, if you use windows, you can find home using emacs with commands, `C-x C-f ~/ <RET>`. (First line of the buffer is path of your home directory)

In your home directory, what you needs to install are following.

```
git clone https://github.com/Ailrun/yet-another-emacs-settings .emacs.d
cd .emacs.d
make
```

If you don't have make command, install GNU make for your OS.

### Configurations ###

Will be added ASAP.

## Status ##

To Alpha~Beta

- Necessary
  - [x] Default package bootstrapping using f, use-package, req-package
  - [x] Elisp package default setting
- High Priority
  - [x] Bash Shell script package default setting
  - [ ] Batch script package default setting
  - [ ] C/C++ package default setting
  - [x] Fish Shell script package default setting
  - [x] Git/GitHub package default setting
  - [x] Haskell package default setting
  - [x] Java package default setting
  - [ ] JavaScript package default setting
  - [x] LaTeX package default setting
  - [x] Markdown package default setting
  - [ ] Node.js package default setting
  - [ ] PHP package default setting
  - [x] Project support default seeting
  - [x] Python package default setting
  - [ ] web package default setting
- Middle Priority
  - [ ] CoffeeScript package default setting
  - [ ] Database package default setting
  - [ ] Go package default setting
  - [x] OCaml package default setting
  - [x] Org package default setting
  - [ ] Rust package default setting
  - [x] Scala package default setting
  - [ ] Scheme package default setting
  - [ ] TypeScript package default setting
- Low Priority
  - [ ] Android package default setting
  - [x] C# package default setting
  - [x] F# package default setting
  - [ ] Lisp package default setting
  - [ ] Obj-C package default setting
  - [ ] Prolog package default setting
  - [ ] R package default setting
  - [ ] Ruby package default setting
  - [ ] Swift package default setting

## Author ##
Junyoung Clare Jang ( Github : Ailrun@github.com, Email : jjc9310@gmail.com )
