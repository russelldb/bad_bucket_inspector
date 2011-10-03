-module(bi).

-export([main/1]).

main([Bucket, Node]) ->
    io:format("~p~n", [main(list_to_atom(Bucket), list_to_atom(Node))]).
    
main(Bucket, Node) ->
    true = net_kernel:hidden_connect(Node),
    pong = net_adm:ping(Node),
    bucket_inspector:inspect(Bucket, Node).
