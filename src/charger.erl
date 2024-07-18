% @doc grisp_charger public API.
-module(charger).

-behavior(application).

% Callbacks
-export([start/2]).
-export([stop/1]).

%--- Callbacks -----------------------------------------------------------------

% @private
start(_Type, _Args) ->
    Sup = charger_sup:start_link(),
    grisp:add_device(i2c0, grisp_pac1933),
    grisp:add_device(i2c1, grisp_max17260),
    Sup.

% @private
stop(_State) -> ok.
