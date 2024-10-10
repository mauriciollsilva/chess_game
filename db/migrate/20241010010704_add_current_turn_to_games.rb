class AddCurrentTurnToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :current_turn, :string
  end
end
