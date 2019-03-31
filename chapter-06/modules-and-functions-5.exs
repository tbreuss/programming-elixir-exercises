defmodule Calc do
  def gcd(x, 0) do
    x
  end
  def gcd(x, y) do
    gcd(y, rem(x, y))
  end
end

# iex(1)> c "modules-and-functions-5.exs"
# [Calc]
# iex(2)> Calc.gcd(1, 12)
# 1
# iex(3)> Calc.gcd(4, 12)
# 4
# iex(4)> Calc.gcd(8, 12)
# 4
# iex(5)> Calc.gcd(9, 12)
# 3
# iex(6)> Calc.gcd(10, 12)
# 2
