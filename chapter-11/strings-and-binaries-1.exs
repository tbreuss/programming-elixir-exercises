defmodule MyString do
  def only_printable_chars?([]) do
    true
  end
  def only_printable_chars?([head | tail]) do
    if String.printable?(to_string([head])) do
      only_printable_chars?(tail)
    else
      false
    end
  end
end

IO.inspect MyString.only_printable_chars?('')                 # true
IO.inspect MyString.only_printable_chars?('ABCabc')           # true
IO.inspect MyString.only_printable_chars?([ 65, 66, 22, 70 ]) # false
