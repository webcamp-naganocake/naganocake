class AddIsGenresStatusToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :is_genres_status, :boolean, default: false, null: false
  end
end
