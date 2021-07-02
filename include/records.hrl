-define(TINYMCE_DEFAULT_TOOLBAR_1, <<"insertfile undo redo | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent">>).
-define(TINYMCE_DEFAULT_TOOLBAR_2, <<"styleselect fontsizeselect | forecolor backcolor | link image emoticons">>).
-define(TINYMCE_DEFAULT_PLUGINS, <<"advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime nonbreaking save table contextmenu directionality emoticons template paste textcolor media">>).

-record(tinymce, {?ELEMENT_BASE(element_tinymce),
		text=""				:: text(),
		plugins=  ?TINYMCE_DEFAULT_PLUGINS 		:: text() | [atom() | text()],
		toolbar1= ?TINYMCE_DEFAULT_TOOLBAR_1	:: text(),
		toolbar2= ?TINYMCE_DEFAULT_TOOLBAR_2 	:: text(),
		toolbar3= <<"">>	:: text(),
		menubar=true		:: boolean(),
        apikey              :: undefined | text(),
		options=[]			:: proplist()
	}).
-record(inplace_tinymce, {?ELEMENT_BASE(element_inplace_tinymce),
		tag					:: any(),
		text=""				:: text(),
		html_encode=true	:: boolean(),
		start_mode=view		:: view | edit,
		validators=[]		:: [tuple()],
		delegate=undefined	:: module(),
        apikey              :: undefined | text(),
		options=[]			:: proplist()
	}).
