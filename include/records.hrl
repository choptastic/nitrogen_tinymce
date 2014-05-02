-record(tinymce, {?ELEMENT_BASE(element_tinymce),
		text=""				:: text(),
		options=[]			:: proplist()
	}).
-record(inplace_tinymce, {?ELEMENT_BASE(element_inplace_tinymce),
		tag					:: any(),
		text=""				:: text(),
		html_encode=true	:: boolean(),
		start_mode=view		:: view | edit,
		validators=[]		:: [tuple()],
		delegate=undefined	:: module()
	}).
