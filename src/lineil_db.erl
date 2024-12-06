-module(lineil_db).
-behavior(gen_server).
%% API
-export([start_link/0]).
-export([stop/1]).
-export([init/1]).

-export([handle_call/3]).
-export([handle_cast/2]).

start_link() ->
  gen_server:start_link({local, ?MODULE}, ?MODULE, [[]], []).

init(_) ->
  DbHost = application:get_env(lineil, db_host),
  User = application:get_env(lineil, user),
  Password = application:get_env(lineil, password),
  DB = application:get_env(lineil, database),
  Opts = #{
    host => DbHost,
    username => User,
    password => Password,
    database => DB
  },
  {ok, Conn} = epgsql:connect(Opts),
  State = #{connection => Conn},
  {ok, State}.

stop(Conn) ->
  epgsql:close(Conn),
  ok.

handle_call(Msg, _From, State) ->
  io:format("unexpected messeg ~p", [Msg]),
  {reply, ok, State}.

handle_cast(_Msg, State) ->
  {noreply, State}.
