%%%-------------------------------------------------------------------
%% @doc adder3 public API
%% @end
%%%-------------------------------------------------------------------

-module(file_test_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    file_test_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
