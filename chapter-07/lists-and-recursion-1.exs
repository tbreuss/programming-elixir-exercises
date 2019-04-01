defmodule MyList do
  def mapsum(list, func) do
    _mapsum(list, func, 0)
  end
  defp _mapsum([], _func, total) do
    total
  end
  defp _mapsum([ head | tail ], func, total) do
    _mapsum(tail, func, func.(head) + total)
  end
end

#IO.puts MyList.mapsum [1,2,3,4], &(&1 * &1) # 30
#IO.puts MyList.mapsum [1,2,3,4], &(&1 + 2)  # 18
#IO.puts MyList.mapsum [1,2,3,4], &(&1 - 2)  # 2
#IO.puts MyList.mapsum [1,2,3,4], &(&1 * 2)  # 20
#IO.puts MyList.mapsum [1,2,3,4], &(&1 / 2)  # 5.0
