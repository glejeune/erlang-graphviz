-module(graph_test).
-include_lib("eunit/include/eunit.hrl").

create_graph_test() ->
   graphviz:graph("G"),
   graphviz:add_node("A"),
   graphviz:add_node("B"),
   graphviz:add_edge("A", "B"),
   1 = 1.
