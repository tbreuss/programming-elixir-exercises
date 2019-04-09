defmodule MyList do

  def flatten([]) do
    []
  end
  def flatten([head | tail]) do
    if is_list(head) do
      flatten(head) ++ flatten(tail)
    else
      [head] ++ flatten(tail)
    end
  end

  def flatten2([]) do
    []
  end
  def flatten2([head | tail]) when is_list(head) do
    flatten(head) ++ flatten(tail)
  end
  def flatten2([head | tail]) do
    [head] ++ flatten(tail)
  end
end

IO.inspect MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]], 7])
IO.inspect MyList.flatten2([ 1, [ 2, 3, [4] ], 5, [[[6]]], 7])
