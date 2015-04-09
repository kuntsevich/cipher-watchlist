class AddDeviseFields < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_password, :string, null: false, default: ""
    add_column :users, :remember_created_at, :datetime
  end
end
