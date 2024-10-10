class Piece < ApplicationRecord
  belongs_to :game

  def valid_move?(new_position)
    # Extrair a linha e a coluna da nova posição
    new_row, new_col = new_position.split(',').map(&:to_i)

    case piece_type
    when "pawn"
      # Lógica para movimentação do peão
    when "rook"
      # Lógica para movimentação da torre
    when "knight"
      # Lógica para movimentação do cavalo
    when "bishop"
      # Lógica para movimentação do bispo
    when "queen"
      # Lógica para movimentação da rainha
    when "king"
      # Lógica para movimentação do rei
    end
  end
end
