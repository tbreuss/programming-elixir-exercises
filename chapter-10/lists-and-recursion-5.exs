defmodule MyEnum do

  def all?([], _func) do
    true
  end
  def all?([head | tail], func) do
    func.(head) and all?(tail, func)
  end

  def each([], _func) do
    :ok
  end
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func) do
    []
  end
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split([], n) do
    {[], []}
  end
  def split(list, n) do
    _split(list, n, [])
  end
  defp _split(list, n, accumulator) when n >= 0 do
    _dosplit(list, n, accumulator)
  end
  defp _split(list, n, accumulator) when n < 0 do
    _dosplit(list, length(list) + n, accumulator)
  end
  defp _dosplit([head | tail], n, accumulator) do
    if (length(accumulator) < n) do
      _dosplit(tail, n, accumulator ++ [head])
    else
      { accumulator, [head | tail] }
    end
  end

  def reverse([]) do
    []
  end
  def reverse([head | tail]) do
    reverse(tail) ++ [head]
  end

  def take([], n) do
    []
  end
  def take(list, n) do
    _take(list, n, [])
  end
  defp _take(list, n, accumulator) when n >= 0 do
    _dotake(list, n, accumulator)
  end
  defp _take(list, n, accumulator) when n < 0 do
    reverse(_dotake(reverse(list), length(list) + n + 1, accumulator))
  end
  defp _dotake([head | tail], n, accumulator) do
    if (length(accumulator) < n) do
      _dotake(tail, n, accumulator ++ [head])
    else
      accumulator
    end
  end
end


list = [1, 2, 3, 4, 5]

IO.inspect MyEnum.all?(list, &(&1 < 4)) # false
IO.inspect MyEnum.all?(list, &(&1 > 0)) # true

IO.inspect MyEnum.each(list, fn x -> IO.write(x) end)      # 12345
IO.inspect MyEnum.each(list, fn x -> IO.write(x + 3) end)  # 45678
IO.inspect MyEnum.each(list, fn x -> IO.write(x * 10) end) # 1020304050

IO.inspect MyEnum.filter(list, &(&1 < 4))          # [1,2,3]
IO.inspect MyEnum.filter(list, &(rem(&1, 2) == 0)) # [2,4]
IO.inspect MyEnum.filter(list, &(&1 > 10))         # []

IO.inspect MyEnum.split(list, 0);  # {[], [1, 2, 3, 4, 5]}
IO.inspect MyEnum.split(list, 2);  # {[1, 2], [3, 4, 5]}
IO.inspect MyEnum.split(list, -2); # {[1, 2, 3], [4, 5]}

IO.inspect MyEnum.reverse([]);    # []
IO.inspect MyEnum.reverse(list);    # []

IO.inspect MyEnum.take(list, 0);  # []
IO.inspect MyEnum.take(list, 2);  # [1, 2]
IO.inspect MyEnum.take(list, -3); # [3, 4, 5]
