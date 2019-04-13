defmodule MyUtils do
  def ok!({:ok, data}) do
    data
  end
  def ok!({error_type, error_msg}) do
    raise "#{error_type} #{error_msg}"
  end
end

io_device = MyUtils.ok!(File.open("/etc/passwd"))
IO.stream(io_device, :line)
 |> Enum.take(15)
 |> Enum.map(&IO.puts(&1))

try do
  MyUtils.ok!(File.open("non_existing_file"))
rescue e ->
  IO.puts "ERROR"
  IO.puts e.message
end
