%%--------------------------------------------------------------------
%%
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 1998-2009. All Rights Reserved.
%% 
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%% 
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%% 
%% %CopyrightEnd%
%%
%%
%%-----------------------------------------------------------------
%% File: corba_nvlist.erl
%% Description:
%%    This file contains the CORBA::NVList handling 
%%
%%-----------------------------------------------------------------
-module(corba_nvlist).

-include_lib("orber/include/corba.hrl").
-include_lib("orber/src/orber_iiop.hrl").

%%-----------------------------------------------------------------
%% Standard interface CORBA::NVList
%%-----------------------------------------------------------------
-export([add_item/6,
	 free/1,
	 free_memory/1, 
	 get_count/1]).

%%-----------------------------------------------------------------
%% External exports
%%-----------------------------------------------------------------
-export([create_list/1,
	create_operation_list/1]).

%%------------------------------------------------------------
%% Implementation of standard interface CORBA::NVList
%%------------------------------------------------------------
add_item(List, Id, TC, Value, Len, ArgFlags) ->
    {ok, List}.

free(List) ->
    ok.

free_memory(List) ->
    ok.

get_count(List) ->
    {ok, 0}.

%%------------------------------------------------------------
%% Implementation of extra functions which creates NVList:s
%% theese ae used by the standard functions with the same name 
%% in the CORBA::ORB interface
%%------------------------------------------------------------

create_list(Count) ->
    {ok, create_list_2(Count, [])}.

create_list_2(0, Acc) ->
    Acc;
create_list_2(N, Acc) ->
   create_list_2(N-1, [[] | Acc]).

create_operation_list(OpDef) ->
    OpArgList = OpDef,
    {ok, create_operation_list_2(OpArgList, [])}.

create_operation_list_2([], Acc) ->
     Acc;
create_operation_list_2([OpArg | OpArgList], Acc) ->
    Rec = parse_oparg_def(OpArg),
    create_operation_list_2(OpArgList, [Rec | Acc]).

parse_oparg_def(OpArg) ->
    OpArg.











