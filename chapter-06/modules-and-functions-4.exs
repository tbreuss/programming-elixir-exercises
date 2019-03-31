defmodule Calc do
  def sum(0) do
    0
  end
  def sum(n) do
    n + sum(n-1)
  end
end

# iex(1)> c "modules-and-functions-4.exs"
# [Calc]
# iex(2)> Calc.sum(0)
# 0
# iex(3)> Calc.sum(3)
# 6
# iex(4)> Calc.sum(4)
# 10
# iex(5)> Calc.sum(5)
# 15
# iex(6)> Calc.sum(6)
# 21
