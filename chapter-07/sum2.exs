defmodule MyList do
  def sum(list), do: _sum(list, 0)
    # private methods
  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head+total)
end
