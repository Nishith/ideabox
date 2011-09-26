require 'spec_helper'

describe Idea do

  it "can be created" do
    lambda {
      Factory(:idea)
    }.should change(Idea, :count).by(1)
  end

  it "should not be valid without a name" do
    subject.should_not be_valid
    subject.errors[:title].should_not be_empty
  end

  it "should not be valid without a description" do
    subject.should_not be_valid
    subject.errors[:description].should_not be_empty
  end

  it "should not be valid with a negative like" do
    subject.like = -1
    subject.should_not be_valid
    subject.errors[:like].should_not be_empty
  end

  it "should not be valid with a negative dislike" do
    subject.dislike = -1
    subject.should_not be_valid
    subject.errors[:dislike].should_not be_empty
  end

  it 'belongs to a users' do
    subject.should respond_to(:users)
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

