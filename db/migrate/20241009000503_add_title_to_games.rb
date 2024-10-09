class AddTitleToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :title, :string
    add_column :games, :description, :text
    add_column :games, :release_date, :date
  end
end
