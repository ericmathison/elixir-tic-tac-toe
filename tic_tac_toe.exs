defmodule Game do
  def over?(str) do
    !(str =~ "-")
  end

  def get_user_move do
    IO.gets("Select a move (1-9): ")
    |> String.trim
    |> String.to_integer
    |> Kernel.-(1)
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

  def won?(board_str, player) do

    # board positions
    # 0 1 2
    # 3 4 5
    # 6 7 8

    winning_combos = [[0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 4, 8], [6, 4, 2]]
    Enum.any?(Enum.map(winning_combos, fn combo ->
      if String.at(board_str, Enum.at(combo, 0)) == player and
         String.at(board_str, Enum.at(combo, 1)) == player and
         String.at(board_str, Enum.at(combo, 2)) == player do
        true
      else
        false
      end
    end))
  end
end
