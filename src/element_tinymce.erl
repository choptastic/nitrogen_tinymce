%% vim: ts=4 sw=4 et
-module(element_tinymce).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
     reflect/0,
     render_element/1
]).

-spec reflect() -> [atom()].
reflect() -> record_info(fields, tinymce).

-spec render_element(#tinymce{}) -> body().
render_element(Rec = #tinymce{text=Text, class=Class}) ->
    ID = wf:temp_id(),
    wire_init(ID, Rec),
    wire_before_postback(ID),
    [
        %LoadScript,
        #textarea{
            id=ID,
            html_id=ID,
            text=Text,
            class=[tinymce, Class]
        }
    ].

wire_init(ID, #tinymce{plugins=Plugins, toolbar1=TB1, toolbar2=TB2, toolbar3=TB3, menubar=Menubar, options=Options, apikey=Apikey0}) ->
    Json = build_json_options(ID, Plugins, TB1, TB2, TB3, Menubar, Options),
    Url = case wf:config(tinymce_url) of
        undefined ->
            AppApikey = wf:config(tinymce_apikey),
            Apikey = wf:to_binary(wf:coalesce([Apikey0, AppApikey])),
            Url = <<"//cdn.tiny.cloud/1/",Apikey/binary,"/tinymce/5/tinymce.min.js">>;
        U ->
            U
    end,
    Init =
        <<"Nitrogen.$dependency_register_function('~s', function() {
            tinymce.init(~s);
        })">>,
    wf:defer(wf:f(Init, [Url, Json])).

wire_before_postback(ID) ->
    wf:wire(#before_postback{script=wf:f("try {tinymce.get('~s').save() }catch(ex){}",[ID])}).


build_json_options(ID, Plugins, TB1, TB2, TB3, Menubar, Opt0) ->
    Opt = [
        {plugins, safe_to_binary(Plugins)},
        {toolbar1, safe_to_binary(TB1)},
        {toolbar2, safe_to_binary(TB2)},
        {toolbar3, safe_to_binary(TB3)},
        {menubar, Menubar},
        {selector, wf:f(<<"textarea.wfid_~s">>, [ID])}
        | [{wf:to_binary(K), safe_to_binary(V)} || {K,V} <- Opt0]
    ],
    iolist_to_binary(wf:json_encode(Opt)).

safe_to_binary(S) when ?IS_STRING(S) ->
    wf:to_binary(S);
safe_to_binary(L) when is_list(L) ->
    [safe_to_binary(X) || X <- L];
safe_to_binary(S) ->
    S.
