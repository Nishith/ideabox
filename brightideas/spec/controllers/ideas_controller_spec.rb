require 'spec_helper'

describe IdeasController do
  render_views
  let(:idea) {Factory(:idea)}

  before(:each) do
    @base_title = "Bright Ideas"
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have the right title" do
      get 'index'
      response.should have_selector("title",
                                    :content => @base_title + " | All Ideas")
    end

    it "should assign ideas as @ideas" do
      get 'index'
      assigns(:ideas).should_not be_nil
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', {:id => idea.to_param}
      response.should be_success
    end
    it "should assign idea as a particular idea" do
      get 'show', {:id => idea.to_param}
      assigns(:idea).should_not be_nil
    end
    it "should have the right title" do
      get 'show', {:id => idea.to_param}
      response.should have_selector("title",
                                    :content => @base_title + " | Show Idea")
    end
  end

end

