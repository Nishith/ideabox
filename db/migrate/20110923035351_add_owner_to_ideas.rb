class AddOwnerToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :owner, :text
  end

  def self.down
    remove_column :ideas, :owner
  end
end
