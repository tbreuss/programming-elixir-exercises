defmodule SpawnTest do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "#{msg}"})
        greet()
    end
  end

  def run do
    # process 1
    pid1 = spawn(SpawnTest, :greet, [])
    send(pid1, {self(), "FRED"})

    # process 2
    pid2 = spawn(SpawnTest, :greet, [])
    send(pid2, {self(), "BETTY"})

    receive do
      {:ok, message} ->
        IO.puts(message)
    end

    receive do
      {:ok, message} ->
        IO.puts(message)
    end
  end
end

SpawnTest.run()

# Is the order in which the replies are received deterministic in theory? In practice?
# No.  

# If either answer is no, how could you make it so?
# Hm...?
