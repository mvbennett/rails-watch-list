class AddTitleToMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :name
    add_column :movies, :title, :string
  end
end
