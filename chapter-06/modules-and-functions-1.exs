defmodule Times do
  def double(n) do
    n * 2
  end
  def triple(n) do
    n * 3
  end
end

IO.puts Times.triple(1) # 3
IO.puts Times.triple(2) # 6
IO.puts Times.triple(3) # 9
