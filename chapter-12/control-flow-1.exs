defmodule FizzBuzzWithCase do
  def upto(n) when n > 0 do
      1..n |> Enum.map(&fizzbuzz/1)
  end
  defp fizzbuzz(n) do
    case n do
      n when rem(n, 3) == 0 and rem(n, 5) == 0 -> "FizzBuzz"
      n when rem(n,3) == 0 -> "Fizz"
      n when rem(n, 5) == 0 -> "Buzz"
      _ -> n
    end
  end
end

defmodule FizzBuzzWithCond do
  def upto(n) when n > 0 do
      1..n |> Enum.map(&fizzbuzz/1)
  end
  defp fizzbuzz(n) do
    cond do
      rem(n, 3) == 0 and rem(n, 5) == 0 -> "FizzBuzz"
      rem(n, 3) == 0 -> "Fizz"
      rem(n, 5) == 0 -> "Buzz"
      true -> n
    end
  end
end

defmodule FizzBuzzWithGuards do
  def upto(n) when n > 0 do
      1..n |> Enum.map(&fizzbuzz/1)
  end
  defp fizzbuzz(n) when rem(n, 3) == 0 and rem(n, 5) == 0 do
    "FizzBuzz"
  end
  defp fizzbuzz(n) when rem(n, 3) == 0 do
    "Fizz"
  end
  defp fizzbuzz(n) when rem(n, 5) == 0 do
    "Buzz"
  end
  defp fizzbuzz(n) do
    n
  end
end

IO.inspect FizzBuzzWithCase.upto(17)
IO.inspect FizzBuzzWithCond.upto(17)
IO.inspect FizzBuzzWithGuards.upto(17)
