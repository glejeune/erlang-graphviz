-module(sample).
-export([simple_graph/0]).

simple_graph() ->
   graphviz:graph("G"),
   graphviz:add_node("A"),
   graphviz:add_node("B"),
   graphviz:add_edge("A", "B"),
   graphviz:to_dot("test.dot").
