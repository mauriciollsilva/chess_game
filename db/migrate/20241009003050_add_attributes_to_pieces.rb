class AddAttributesToPieces < ActiveRecord::Migration[7.0]
  def change
    add_column :pieces, :piece_type, :string
    add_column :pieces, :color, :string
    add_column :pieces, :position, :string
  end
end
