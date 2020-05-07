defmodule Game do
  def over?(str) do
    !(str =~ "-")
  end

  def get_user_move do
    IO.gets("Select a move (1-9): ")
    |> String.trim
    |> String.to_integer
  end

  def move(board_str, position, player) do
    cond do
      position == 0 ->
        player <> String.slice(board_str, (position + 1)..8)
      position == 8 ->
        String.slice(board_str, 0..(position - 1)) <> player
      true ->
        String.slice(board_str, 0..(position - 1)) <> player <> String.slice(board_str, (position + 1)..8)
    end
  end
end
