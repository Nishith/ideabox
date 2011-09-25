class IdeasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html, :xml, :js
  
  def new
    @idea = Idea.new
    @idea.user_id = current_user.id
    @idea.like = 0
    @idea.dislike = 0

    respond_with(@idea)
  end

  def show
    @idea = Idea.find(params[:id])
    @owner = User.find(@idea.user_id)

    respond_with(@idea)
  end

  def create
    @idea = Idea.new(params[:idea])
    if @idea.save
      flash[:notice] = 'Idea was successfully saved.'
    end
    respond_with(@idea)
  end

  def index
    @ideas = Idea.order(params[:sort])
    respond_with(@idea)
  end

  def edit
    @idea ||= Idea.find(params[:id])
    respond_with(@idea)
  end

  def update
    @idea = Idea.find(params[:id])

    if @idea.update_attributes(params[:idea])
        flash[:notice] = 'Idea was successfully updated.'
    end
    respond_with(@idea)
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = "Successfully deleted the idea"
    respond_with(@idea)
  end

  def like
    @idea = Idea.find(params[:id])
    @idea.like = @idea.like + 1
    @idea.save

    respond_with(@idea)
  end

  def dislike
    @idea = Idea.find(params[:id])
    @idea.dislike = @idea.dislike + 1
    @idea.save

    respond_with(@idea)
  end

  def credits
    respond_with(@idea)
  end
end

