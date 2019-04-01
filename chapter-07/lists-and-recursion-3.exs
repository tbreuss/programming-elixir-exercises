defmodule MyList do
  def caesar([], _n) do
    []
  end
  def caesar([head | tail], n) when head + n < 123 do
    [head + n | caesar(tail, n)]
  end
  def caesar([_head | tail], n) do
    [ '?' | caesar(tail, n)]
  end
end

# iex> MyList.caesar('abcdefg', 13)
# 'nopqrst'

# iex> MyList.caesar('hijklmn', 13)
# [117, 118, 119, 120, 121, 122, '?']
