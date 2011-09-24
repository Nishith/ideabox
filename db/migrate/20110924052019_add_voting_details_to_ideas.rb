class AddVotingDetailsToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :like, :integer
    add_column :ideas, :dislike, :integer
  end

  def self.down
    remove_column :ideas, :dislike
    remove_column :ideas, :like
  end
end
