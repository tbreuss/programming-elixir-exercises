defmodule MyString do

  # version using recursion
  def anagram?(str1, str2) do
    _anagram?(
      str1
        |> String.downcase
        |> String.to_charlist,
      String.downcase(str2)
    )
  end
  defp _anagram?([], _) do
    true
  end
  defp _anagram?([ head | tail ], str2) do
    if String.contains?(str2, to_string([head])) do
      _anagram?(tail, str2)
    else
      false
    end
  end

  # version using Enum methods
  def anagram2?(str1, str2) do
    transform(str1) === transform(str2)
  end
  defp transform(string) when is_list(string) do
    string
      |> List.to_string
      |> transform
  end
  defp transform(string) do
    string
      |> String.downcase
      |> String.to_charlist
      |> Enum.sort
  end
end

IO.inspect MyString.anagram?("Elvis","Lives")  # true
IO.inspect MyString.anagram?("Apple","Banana") # false

IO.inspect MyString.anagram2?('elvis',"lives")  # true
IO.inspect MyString.anagram2?('apple','banana') # false
IO.inspect MyString.anagram2?("Elvis",'LIVES')  # true
IO.inspect MyString.anagram2?('Apple',"Banana") # false
