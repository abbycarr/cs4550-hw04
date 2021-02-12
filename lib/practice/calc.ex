defmodule Practice.Calc do

  def is_op(c) do
    cond do
      c=="+"||c=="-"||c=="*"||c=="/" ->
        true
      true -> 
        false
    end
  end

  def importance(c) do
    cond do
      c=="*" || c=="/" ->
        2
      c=="+" || c=="-" ->
        1
      true ->
        -1
    end
  end

  def operate(c, n1, n2) when is_float(n1) do
    cond do
      c=="+" ->
        n1 + String.to_integer(n2)
      c=="-" ->
        n1 - String.to_integer(n2)
      c=="*" ->
        n1 * String.to_integer(n2)
      true ->
        n1 / String.to_integer(n2)
    end
  end

  def operate(c, n1, n2) when is_integer(n1) do
    cond do
      c=="+" ->
        n1 + String.to_integer(n2)
      c=="-" ->
        n1 - String.to_integer(n2)
      c=="*" ->
        n1 * String.to_integer(n2)
      true ->
        n1 / String.to_integer(n2)
    end
  end

  def operate(op, n1, n2), do: operate(op, String.to_integer(n1), n2)

  def add_op(op, list) do
    cond do 
      length(list) == 0 ->
        [op]
      importance(op) > importance(hd(list)) ->
        [op] ++ list
      true ->
        list ++ [op]
    end
  end

  def ends(ex) do
    length(ex) - 1
  end

  def to_post(expr, out, ops) do
    cond do
      length(expr) == 0 ->
        eval(0, out, ops)

      is_op(hd(expr)) ->
        to_post(Enum.slice(expr,1..(ends(expr))), out, add_op(hd(expr), ops))
      
      length(out) > 0 ->
        to_post(Enum.slice(expr,1..(ends(expr))), out ++ [hd(expr)],ops)
      
      true ->
        to_post(Enum.slice(expr,1..(ends(expr))),[hd(expr)],ops)
    end
  end

  def eval(total, out, ops) do
    cond do
      length(out) == 0 ->
        total
      length(out) == 1 && length(ops) == 0 ->
        String.to_integer(hd(out))
      total == 0 ->
        eval(operate(hd(ops),hd(out),Enum.at(out,1)),Enum.slice(out,2..(ends(out))),Enum.slice(ops,1..(ends(ops))))
      true ->
        eval(operate(Enum.at(ops, 0),total,Enum.at(out,0)),Enum.slice(out,1..(ends(out))),Enum.slice(ops,1..(ends(ops))))
    end
  end

  def splits(ex) do
    String.split(ex, ~r/\s+/)
  end

  def calc(expr) do
    to_post(splits(expr),[], [])
  end
end
