-module(bucket_inspector).

-export([inspect/2]).

inspect(Bucket, Server) ->
    {ok, C} = riak:client_connect(Server),
    {ok, Keys} = C:list_keys(Bucket),
    inspect_objects(Bucket, Keys, C).

inspect_objects(_Bucket, [], _Client) ->
    ok;
inspect_objects(Bucket, [H|T], Client) ->
    Client:get(Bucket, H),
    inspect_objects(Bucket, T, Client).
