defmodule SpawnLink do
  import :timer, only: [sleep: 1]

  def child(parent) do
    send(parent, {:ok, "Hello"})
    exit(:gone)
  end

  def run do
    spawn_link(SpawnLink, :child, [self()])
    
    sleep(500)

    receive do
      msg ->
        IO.puts("MESSAGE RECEIVED: #{inspect(msg)}")
    end
  end
end

SpawnLink.run()
