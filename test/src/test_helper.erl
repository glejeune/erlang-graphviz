-module(test_helper).
-export([test/0]).

test() ->
   eunit:test([
      graph_test
   ]).

