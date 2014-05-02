%% vim: ts=4 sw=4 et
-module(element_tinymce).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
     reflect/0,
     render_element/1
]).

-spec reflect() -> [atom()].
reflect() -> record_info(fields, inplace_tinymce).

-spec render_element(#tinymce{}) -> body().
render_element(Record = #tinymce{text=Text, class=Class}) ->
    ID = wf:temp_id(),
    wire_init(ID),
    wire_pre_postback(ID),
    [
        %LoadScript,
        #textarea{
            id=ID,
            html_id=ID,
            text=Text,
            class=[tinymce, Class]
        }
    ].

wire_init(ID) ->
    Init =
        "Nitrogen.$dependency_register_function('//tinymce.cachefly.net/4.0/tinymce.min.js', function() {
            tinymce.init({selector: 'textarea.wfid_~s'});
        })",
    wf:defer(wf:f(Init,[ID])).

wire_pre_postback(ID) ->
    wf:wire(#before_postback{script=wf:f("try {tinymce.get('~s').save() }catch(ex){}",[ID])}).
