defmodule MyString do

  def center(list) do
    list
      |> calc_max_length
      |> center_strings
      |> print_strings
  end

  defp calc_max_length(list) do
    Enum.map_reduce(list, 0, fn x, acc ->
        length = String.length(x)
        {x, max(length, acc)}
      end
    )
  end

  defp center_strings({list, max_length}) do
    Enum.map(list, fn x ->
        length = String.length(x)
        ~s[#{String.duplicate(" ", div(max_length - length,2))}#{x}]
      end
    )
  end

  defp print_strings(list) do
    Enum.each(list, fn x -> IO.puts(x) end)
  end

end

MyString.center(["cat", "zebra", "elephant"])
IO.puts "\n"
MyString.center(["short", "verylongword", "longword"])
