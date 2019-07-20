defmodule Parallel do
  def pmap(collection, fun) do
    me = self()

    collection
    |> Enum.map(fn elem ->
      spawn_link(fn ->
        IO.inspect(me, label: "me")
        IO.inspect(self(), label: "child")
        send(me, {self(), fun.(elem)})
      end)
    end)
    |> Enum.map(fn pid ->
      receive do
        {^pid, result} -> result
      end
    end)
  end
end
