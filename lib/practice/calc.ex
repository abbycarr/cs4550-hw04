defmodule Practice.Calc do
  def add(list) do
    (for n <- list, do: to_int(n)) |> Enum.sum
  end

  def sub(list) 
    (for n <- list, do: to_int(n)) |> Enum.sum
  end
  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.

    expr
    |> String.split(~r/\s+/)
    |> add

    # Hint:
    # expr
    # |> split
    # |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
    # |> convert to postfix
    # |> reverse to prefix
    # |> evaluate as a stack calculator using pattern matching
  end
end
