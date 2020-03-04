---
layout: page
title: Getting Started
---
Your first step is to [download the koans here](https://github.com/mdoel/browser_testing_koans/blob/master/download/browserkoans.zip?raw=true). These are the exercises you will be working through.
Unzip that file into a folder/directory you can get to via a shell prompt.

## Getting Ruby
To complete these, you'll need to have a working implementation of Ruby. The
[https://rubykoans.com](Ruby Koans site) offers good advice on how to do that.
Note that at present, running these koans from within a container like Docker
or WSL is not supported.

In your unpacked directory, you should see a number of ruby files plus a Ruby
Bundler file. Get the necceary gems via:

```
bundle install
```

## Getting WebDriver
You also need to have working WebDrivers installed. Pretty much all major
browsers are now supported, but these koans make use of chrome and firefox
variants because they are well supported on major platform.

The Firefox version of WebDriver is called `geckodriver`. If you are on a Mac
and use Homebrew, you can:

```
brew install geckodriver
```

If you are on Windows and are using chocolatey, you can:

```
choco install geckodriver
```

If those don't work, find documentation at the
[Mozilla Github Page](https://github.com/mozilla/geckodriver/).

Chrome's driver is called `chromedriver`. On the Mac:

```
brew install chromedriver
```

On Windows:

```
choco install chromedriver
```

And if neither of those work, find documentation at the
[Chromium project site](https://chromedriver.chromium.org/).