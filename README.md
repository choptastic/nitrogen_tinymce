# TinyMCE for Nitrogen (#tinymce)

A WYSIWYG textarea element for the [Nitrogen Web Framework](http://nitrogenoproject.com) using the editor [TinyMCE](http://www.tinymce.com/).

## Installing into a Nitrogen Application

Add it as a rebar dependency by adding into the deps section of rebar.config:

```erlang
	{nitrogen_tinymce, ".*", {git, "git://github.com/choptastic/nitrogen_tinymce.git", {branch, master}}}
```

### Using Nitrogen's built-in plugin installer (Requires Nitrogen 2.3.0)

**Note: This requires Nitrogen 2.3.0 (or at earliest this commit: https://github.com/nitrogen/nitrogen_core/commit/78eaf4849ebae5bd2895491c98edf717dc9523fc , which introduced the `#before_postback{}` action).**

Run `make` in your Application. The rest should be automatic.

## #tinymce Usage

```erlang
	#tinymce{id=my_html, text=Text},
```

## Attributes

+ `plugins` :: string() | binary() - A shortcut attribute for the [plugins](http://www.tinymce.com/wiki.php/Configuration:plugins) configuration options

+ `menubar` :: boolean() - Whether or not to show the menubar.

+ `toolbar1`, `toolbar2`, `toolbar3` :: string() | binary() -  A shortcut attribute for the [toolbarN](http://www.tinymce.com/wiki.php/Configuration:toolbar%3CN%3E) configuration option

+ `options` :: proplist() -  An erlang proplist consisting of additional options to be passed to the `init` function.  See [the TinyMCE docs for more options](http://www.tinymce.com/wiki.php/Configuration).  Example: `#tinymce{options=[{resize, false}, {height, 700}]}` disables resize and sets an absolute height of 700 pixels.

## Default

Without any options specified, this is how the default editor looks:

![preview](https://raw.githubusercontent.com/choptastic/nitrogen_tinymce/master/priv/readme/preview.png)

## License

Copyright (c) 2014, [Jesse Gumm](http://jessegumm.com)
([@jessegumm](http://twitter.com/jessegumm))

MIT License
