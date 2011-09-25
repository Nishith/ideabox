class AddDetailsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :about, :text
  end

  def self.down
    remove_column :users, :about
    remove_column :users, :name
  end
end
