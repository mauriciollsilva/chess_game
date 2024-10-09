class AddStatusAndCurrentPlayerToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :status, :string
    add_column :games, :current_player, :string
  end
end
