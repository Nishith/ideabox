class UsersController < ApplicationController
  def new
  end

  def index
  end

  def view
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @idea }
    end
  end

end
