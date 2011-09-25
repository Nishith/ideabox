class Idea < ActiveRecord::Base
  validates :title, :description, :presence => true
  validates :title, :uniqueness => true
end
# == Schema Information
#
# Table name: ideas
#
#  id          :integer         not null, primary key
#  title       :text
#  description :text
#  like        :integer
#  dislike     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

