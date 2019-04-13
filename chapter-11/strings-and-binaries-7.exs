defmodule MyCSV do

  def read(filename) do
    file = File.open!(filename, [:read])
    headers = read_headers(file)
    read_body(file, headers)
  end

  defp read_headers(file) do
    line = IO.read(file, :line)
    parse_line(line, &String.to_atom(&1))
  end

  defp read_body(file, headers) do
    Enum.map(IO.stream(file, :line), &read_line(&1, headers))
  end

  defp read_line(line, headers) do
    parsed = parse_line(line, &convert_value(&1))
    Enum.zip(headers, parsed)
  end

  defp parse_line(line, mapper) do
    line
      |> String.trim
      |> String.split(",")
      |> Enum.map(mapper)
  end

  defp convert_value(value) do
    cond do
      Regex.match?(~r{^\d+$}, value) -> String.to_integer(value)
      Regex.match?(~r{^\d+\.\d+$}, value) -> String.to_float(value)
      Regex.match?(~r{^\:.+$}, value) -> String.to_atom(String.trim_leading(value, ":"))
      true -> value
    end
  end

end

defmodule Checkout do

  def buy(orders, tax_rates) do
    for order <- orders do
      net_amount = Keyword.get(order, :net_amount, 0.0)
      ship_to = Keyword.get(order, :ship_to)
      tax_rate = calc_tax_rate(ship_to, tax_rates)
      total_amount = calc_total_amount(net_amount, tax_rate)
      order ++ [total_amount: total_amount]
    end
  end

  def calc_tax_rate(ship_to, tax_rates) do
    Keyword.get(tax_rates, ship_to, 0.0)
  end

  def calc_total_amount(net_amount, tax_rate) do
    net_amount + (net_amount * tax_rate)
  end

end


tax_rates = [ NC: 0.075, TX: 0.08 ]

orders = MyCSV.read("resources/orders.csv")

IO.inspect Checkout.buy(orders, tax_rates)

# [[id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5],
# [id: 124, ship_to: :OK, net_amount: 35.5, total_amount: 35.5],
# [id: 125, ship_to: :TX, net_amount: 24.0, total_amount: 25.92],
# [id: 126, ship_to: :TX, net_amount: 44.8, total_amount: 48.384],
# [id: 127, ship_to: :NC, net_amount: 25.0, total_amount: 26.875],
# [id: 128, ship_to: :MA, net_amount: 10.0, total_amount: 10.0],
# [id: 129, ship_to: :CA, net_amount: 102.0, total_amount: 102.0],
# [id: 130, ship_to: :NC, net_amount: 50.0, total_amount: 53.75]]
