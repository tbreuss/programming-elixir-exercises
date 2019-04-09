defmodule MyString do
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
end

IO.inspect MyString.anagram?("Elvis","Lives")  # true
IO.inspect MyString.anagram?("Apple","Banana") # false
