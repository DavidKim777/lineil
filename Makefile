PROJECT = lineil
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0

DEPS = epgsql
dep_epgsql = git https://github.com/epgsql/epgsql.git 4.7.0

ERLANG = esl
ERL_LIBS = ./deps

include erlang.mk
