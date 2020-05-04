defmodule Game do
  def over?(str) do
    !(str =~ "-")
  end

  def get_user_move do
    IO.gets("Select a move (1-9): ")
    |> String.trim()
  end
end
