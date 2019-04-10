defmodule MyCalculator do
  def calculate(list) do
    # call private method
    _calculate(list, 0)
  end
  defp _calculate([ ?/ | tail], num1) do
    # division
    num1 / _calculate(tail, 0)
  end
  defp _calculate([ ?* | tail], num1) do
    # multiplication
    num1 * _calculate(tail, 0)
  end
  defp _calculate([ ?+ | tail], num1) do
    # addition
    num1 + _calculate(tail, 0)
  end
  defp _calculate([ ?- | tail], num1) do
    # subtraction
    num1 - _calculate(tail, 0)
  end
  defp _calculate([digit | tail], num)  when digit in ' ' do
    # ignore whitespaces
    _calculate(tail, num)
  end
  defp _calculate([digit | tail], num) when digit in '0123456789' do
    # calculate the numbers (the left and right part)
    _calculate(tail, num * 10 + digit - ?0)
  end
  defp _calculate([], num2) do
    # return result
    num2
  end
  defp _calculate(_,_) do
    # return error
    "Invalid operation"
  end
end

IO.inspect MyCalculator.calculate('1 + 30'); # 31
IO.inspect MyCalculator.calculate('1 - 20'); # -19
IO.inspect MyCalculator.calculate('1 * 40'); # 40
IO.inspect MyCalculator.calculate('1 / 50'); # 0.02
IO.inspect MyCalculator.calculate('100 + 70'); # 170
IO.inspect MyCalculator.calculate('100 - 70'); # 30
IO.inspect MyCalculator.calculate('100 * 30'); # 3000
IO.inspect MyCalculator.calculate('100 / 40'); # 2.5
IO.inspect MyCalculator.calculate('1 # 2'); # Invalid Operation
IO.inspect MyCalculator.calculate('1 . 5'); # Invalid Operation
IO.inspect MyCalculator.calculate('2.3'); # Invalid Operation
IO.inspect MyCalculator.calculate('1+12'); # Invalid Operation
