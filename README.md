# sigma_form

A WYSIWYG textarea element for the [Nitrogen Web Framework](http://nitrogenoproject.com) using the editor [TinyMCE](http://www.tinymce.com/).

## Installing into a Nitrogen Application

Add it as a rebar dependency by adding into the deps section of rebar.config:

```erlang
	{nitrogen_tinymce, ".*", {git, "git://github.com/choptastic/nitrogen_tinymce.git", {branch, master}}}
```

### Using Nitrogen's built-in plugin installer (Requires Nitrogen 2.2.0)

Run `make` in your Application. The rest should be automatic.

### Manual Installation (Nitrogen Pre-2.2.0)

Run the following at the command line:

```shell
	./rebar get-deps
	./rebar compile
```

Then add the following includes into any module requiring the form

```erlang
	-include_lib("nitrogen_tinymce/include/records.hrl").
```

## Usage

```erlang
	#tinymce{id=my_html, text=Text},
```

## License

Copyright (c) 2014, [Jesse Gumm](http://sigma-star.com/page/jesse)
([@jessegumm](http://twitter.com/jessegumm))

MIT License
