class Piece < ApplicationRecord
  belongs_to :game

  def move_to(new_position)
    self.update(position: new_position)  # Aqui você pode adicionar lógica de validação de movimento
  end
end
