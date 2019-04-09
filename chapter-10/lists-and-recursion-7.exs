defmodule MyList do
  def span(from, to) when from > to do
    []
  end
  def span(from, to) do
    [ from | span(from+1, to) ]
  end
end

# How to get prime numbers? I have no clue...
