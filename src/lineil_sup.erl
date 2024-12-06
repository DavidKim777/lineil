-module(lineil_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
	Procs = [
		#{
			id => lineil_db,
			start => {lineil_db, start_link, []},
			restart => transient,
			shutdown => 5000,
			type => worker
		}
	],
	{ok, {{one_for_one, 1, 5}, Procs}}.
