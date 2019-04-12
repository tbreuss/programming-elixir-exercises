defmodule MyString do
  @delimiter ". "
  def capitalize_sentences(string) do
    string
      |> split
      |> transform
      |> print
  end
  defp split(string) do
    string
      |> String.trim_trailing(@delimiter)
      |> String.split(@delimiter)
  end
  defp transform(list) do
    list
     |> Enum.map(&(String.downcase(&1)))
     |> Enum.map(&(String.capitalize(&1)))
     |> Enum.map(&(&1 <> @delimiter))
  end
  defp print(list) do
    IO.puts Enum.join(list)
  end
end

MyString.capitalize_sentences("oh. a DOG. woof. ")
