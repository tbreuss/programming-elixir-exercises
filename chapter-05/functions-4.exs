prefix = fn
  prefix -> fn
    name -> prefix <> " " <> name
  end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith") # Mrs Smith
IO.puts prefix.("Elixir").("Rocks") # Elixir Rocks
