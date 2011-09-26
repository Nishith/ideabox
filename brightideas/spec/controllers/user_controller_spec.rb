require 'spec_helper'

describe UsersController do

  describe "GET 'view'" do
    it "should be successful" do
      get 'view', {:id => '1'}
      response.should be_success
    end
  end

end
