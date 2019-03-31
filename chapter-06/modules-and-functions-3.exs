defmodule Times do
  def double(n) do
    n * 2
  end
  def triple(n) do
    n * 3
  end
  def quadruple(n) do
    double(n) * 2
  end
end

IO.puts Times.quadruple(0) # 0
IO.puts Times.quadruple(1) # 4
IO.puts Times.quadruple(2) # 8
IO.puts Times.quadruple(3) # 12
