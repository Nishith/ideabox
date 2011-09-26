require 'spec_helper'

describe User do

  it "can be created" do
    lambda {
      Factory(:users)
    }.should change(User, :count).by(1)
  end

  it "should not be valid without a name" do
    subject.should_not be_valid
    subject.errors[:name].should_not be_empty
  end

  it "should not be valid without an about me" do
    subject.should_not be_valid
    subject.errors[:about].should_not be_empty
  end

  it "should not be valid without an email" do
    subject.should_not be_valid
    subject.errors[:email].should_not be_empty
  end

  it "should not be valid without a password" do
    subject.should_not be_valid
    subject.errors[:password].should_not be_empty
  end

end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  about                  :text
#

