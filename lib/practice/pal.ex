defmodule Practice.Pal do
  def string_list(string) do
    string
    |> String.downcase()
    |> String.graphemes()
  end

  def palindrome?(w) do
    string_list(w) == Enum.reverse(string_list(w))
  end

end
