require 'spec_helper'

describe "users/view.html.erb" do

  before(:each) do
    assign(:user,
    [stub_model(User, :name => "James"),
    stub_model(User, :name => "James")])
  end

  it 'renders attributes in <p>' do
    render
  end
end
