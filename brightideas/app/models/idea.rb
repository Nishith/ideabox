class Idea < ActiveRecord::Base
  validates :title, :description, :presence => true
  validates :title, :uniqueness => true
  validates :like, :numericality => {:greater_than => -1}
  validates :dislike, :numericality => {:greater_than => -1}

  belongs_to :user

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
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

