defmodule Practice.Factor do
  
  def factor(x) when is_integer(x), do: factor(x, 2, []) |> Enum.sort()
  def factor(x), do: factor(Integer.parse(x), 2, []) |> Enum.sort()
  
  def factor(x, current, factors) when x < current, do: factors
  def factor(x, current, factors) when x == current, do: [current | factors]
  def factor(x, current, factors) when rem(x, current)==0, do: factor(div(x,current), 2, [current | factors])
  def factor(x, current, factors), do: factor(x, current + 1, factors)

end