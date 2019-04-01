defmodule MyList do
  def sum([]) do
    0
  end
  def sum([ head | tail ]) do
    head + sum(tail)
  end
end

# iex> c "lists-and-recursion-0.exs"
# [MyList]
# iex> MyList.sum([1,2,3,4,5])
# 15
# iex> MyList.sum([5,6,7,8,9])
# 35
