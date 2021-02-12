defmodule Practice.Factor do
  
  defp is_prime(x) do
    2..x 
    |> Enum.filter(fn a -> rem(x, a) == 0 end) 
    |> length() == 1 
  end
  
  
  def next_prime(n) do
    cond do
      is_prime(n) ->
        n
      true ->
        next_prime(n + 1)
      end
  end

  def factor(x) when is_integer(x), do: factor(x, 2, []) |> Enum.sort()
  def factor(x), do: factor(String.to_integer(x), 2, []) |> Enum.sort()
  
  def factor(x, current, factors) when x < current, do: factors
  def factor(x, current, factors) when x == current, do: [current | factors]
  def factor(x, current, factors) when rem(x, current)==0, do: factor(div(x,current), 2, [current | factors])
  def factor(x, current, factors), do: factor(x, current + 1, factors)

end