class AddGameIdToPieces < ActiveRecord::Migration[7.0]
  def change
    add_column :pieces, :game_id, :integer
  end
end
