class Idea < ActiveRecord::Base
  belongs_to :user
end
# == Schema Information
#
# Table name: ideas
#
#  id          :integer         not null, primary key
#  title       :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  owner       :text
#  user_id     :integer
#  like        :integer
#  dislike     :integer
#

