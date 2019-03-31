defmodule Factorial do
  def of(0) do
    1
  end
  def of(n) do
    n * of(n-1)
  end
end
