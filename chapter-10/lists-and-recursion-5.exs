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

  def test do
    [10, 20, 30, 40, 50]
  end
end


list = [1, 2, 3, 4, 5]

IO.puts MyEnum.all?(list, &(&1 < 4)) # false
IO.puts MyEnum.all?(list, &(&1 > 0)) # true

MyEnum.each(list, fn x -> IO.write(x) end)     # 12345
IO.puts ""
MyEnum.each(list, fn x -> IO.write(x * 2) end) # 246810

IO.puts ""
IO.inspect Enum.filter(list, &(&1 < 4)) # [1,2,3]
IO.inspect Enum.filter(list, &(rem(&1, 2) == 0)) # [2,4]
IO.inspect Enum.filter(list, &(&1 > 10)) # []

