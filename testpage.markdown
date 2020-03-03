---
layout: page
title: Test Page
---
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/interaction.js"></script>

This page is used as the target page for testing many of the examples
in the Browser Koans.

<p id="mypara">
    This is a paragraph with an id of mypara and the second paragraph overall.
    The first president of the United States was George Washington.
</p>

<p class="myclass">
    This is the first paragraph with a class of myclass and the third overall.
    The second president of the United States was John Adams.
</p>

<p class="myclass">
    This is the second paragraph with a class of myclass and the fourth overall.
    The third president of the United States was Thomas Jefferson.
</p>

<p class="p-with-link">
    If you want to learn Ruby in a way that mimics this, head on over to
    <a href="http://rubykoans.com">http://rubykoans.com</a>
</p>

<p id="delayed-text">Loading...</p>

<p id="load-me-dynamically">Invoke loadItDynamically() to change this.</p>

## Test Form
Pick one or both options and submit!
<form id="testform" action="#">
    <div><label for="option-1">Option 1</label><input id="option-1" type="checkbox" /></div>
    <div><label for="option-2">Option 2</label><input id="option-2" type="checkbox" /></div>
    <div><label for="textentry">Enter some text:</label><input id="textentry" type="text" /></div>
    <div><input id="form-submit" type="submit"></div>
</form>
<h3 style="margin-top: 40px;">Form Results</h3>
<div>
    <p>Result of checkboxes: <span id="result-checkboxes">No options chosen</span></p>
    <p>Text entry value: <span id="result-text">Nothing entered</span></p>
</div>