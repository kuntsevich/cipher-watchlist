class AddUsersMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.integer :user_id
      t.string  :name
      t.string  :image
      t.text    :description
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
