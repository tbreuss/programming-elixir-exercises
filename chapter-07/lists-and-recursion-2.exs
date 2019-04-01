defmodule MyList do
  def max([head | tail]) do
    _max(tail, head)
  end
  defp _max([], maximum) do
    maximum
  end
  defp _max([head | tail], maximum) when head > maximum do
    _max(tail, head)
  end
  defp _max([_head | tail], maximum) do
    _max(tail, maximum)
  end
end

#IO.puts MyList.max [1,3,6,4]  # 6
#IO.puts MyList.max [2,10,5,7] # 10
#IO.puts MyList.max [3,3,3,3]  # 3
#IO.puts MyList.max [9,2,7,3]  # 9
