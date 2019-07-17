defmodule SpawnLink do
  import :timer, only: [sleep: 1]

  def sad_function do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
        exit(:boom)
    end
  end

  def run do
    pid = spawn_monitor(SpawnLink, :sad_function, [])
    send(pid, {self(), "Jaco"})

    sleep(2000)

    receive do
      msg ->
        IO.puts("MESSAGE RECEIVED: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing happened as far as I am concerned")
    end
  end
end

SpawnLink.run()
