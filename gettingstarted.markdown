---
layout: page
title: Getting Started
---
Your first step is to [download the koans here](https://github.com/mdoel/browser_testing_koans/blob/master/download/browserkoans.zip?raw=true). These are the exercises you will be working through.
Unzip that file into a folder/directory you can get to via a shell prompt.

## Getting Ruby Ready
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
choco install selenium-gecko-driver
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

## Running the First Test

Once you have unpacked the zip file and navigated to it in a terminal, use `rake` to
begin testing. You'll see something like this:

```
~/koans $ rake
C:/Ruby26-x64/bin/ruby.exe path_to_enlightenment.rb
AboutDrivingBrowsers#test_selenium_throws_load_error_if_underlying_driver_is_missing has damaged your karma.

The Master says:
  You have not yet reached enlightenment.

The answers you seek...
  Expected "FILL ME IN" to equal false

Please meditate on the following code:
  C:/Directory/with/koans/about_driving_browsers.rb:21:in `test_selenium_throws_load_error_if_underlying_driver_is_missing'

mountains are merely mountains
your path thus far [X_________________________________________________] 0/30
~/koans $
```

As with the [Ruby Koans](https://rubykoans.com), you see a first failing test.
In this case, we can see that the failure occurs on line 21 of `about_driving_browsers.rb`.
This is a test to verify that we understand what happens
when we try to use selenium when the underlying WebDriver implementation is
missing.

Open that file in your code editor and see the implementation:

```ruby
13:   def test_selenium_throws_load_error_if_underlying_driver_is_missing
14:     driver_launched = false
15:     begin
16:       driver = Selenium::WebDriver.for :phantomjs
17:       driver.quit
18:       driver_launched = true
19:     rescue LoadError
20:     end
21:     assert_equal __, driver_launched
22:   end
```

Let's look at that code. We can see that `driver_launched` is initialized to
`false`. We then try on line 16 to start WebDriver with the `phantomjs`
driver implementation. [PhantomJS](https://phantomjs.org/) is a scriptable
headless browser that is sometimes used in unit and integration testing contexts.
If you don't already have the driver for that installed, Selenium will
fail with a `LoadError` which we catch on line 19. Because line 18 never
got executed, `driver_launched` retains its initial value when we finally get
to the line that caused our test failure.

We were told that `FILL ME IN` was expected to equal `false`. The `__` blank
on that line is the thing you should fill in. In this case, we replace it
with `false`. This changes the line to assert that `driver_launched` is equal
to `false`.

This example helps you see a few things. We see that we start using WebDriver
in Ruby through the `Selenium::WebDriver` module. We see that invoking that
requires us to specify one of the supported browsers. Finally, we learn that
if we try to use a browser that is not installed or found on our `PATH`,
we can expect a `LoadError` to be raised.

After we've made our change, we can run `rake` again to move on.

```
~/koans $ rake
C:/Ruby26-x64/bin/ruby.exe path_to_enlightenment.rb
AboutDrivingBrowsers#test_selenium_throws_load_error_if_underlying_driver_is_missing has expanded your awareness.
AboutDrivingBrowsers#test_selenium_throws_exception_if_unknown_driver_invoked has damaged your karma.

The Master says:
  You have not yet reached enlightenment.
  You are progressing. Excellent. 1 completed.

The answers you seek...
  Expected "FILL ME IN" to equal true

Please meditate on the following code:
  C:/Directory/with/koans/about_driving_browsers.rb:31:in `rescue in test_selenium_throws_exception_if_unknown_driver_invoked'
  C:/Directory/with/koans/about_driving_browsers.rb:26:in `test_selenium_throws_exception_if_unknown_driver_invoked'

learn the rules so you know how to break them properly
your path thus far [.X________________________________________________] 1/30
```

Excellent, we've now completed the first example and have moved onto the next
failing test for us to examine and fix.

## Switching Between Headless and Headed
By default, almost all examples run using a headed browser (i.e. the browser is
visible on screen). You can switch to headedless mode instead if you wish.
Open up `browser.rb` and look for the `HEADLESS` constant. Change that from
`false` to `true` and then almost all examples will run without you seeing
the browser on your screen.