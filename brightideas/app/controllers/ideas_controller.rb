class IdeasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html, :xml, :js
  helper_method :sort_column, :sort_direction

  def new
    @idea = Idea.new

    respond_with(@idea)
  end

  def show
    @idea = Idea.find(params[:id])
    @owner = User.find(@idea.user_id)

    respond_with(@idea)
  end

  def create
    @idea = Idea.new(params[:idea])
    @idea.user_id = current_user.id
    @idea.like = 0
    @idea.dislike = 0

    if @idea.save
      flash[:notice] = 'Idea was successfully saved.'
    end
    respond_with(@idea)
  end

  def index
    @ideas = Idea.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    respond_with(@ideas)
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

    redirect_to ideas_path
  end

  def dislike
    @idea = Idea.find(params[:id])
    @idea.dislike = @idea.dislike + 1
    @idea.save

    redirect_to ideas_path
  end

  def credits
    respond_with(@idea)
  end

  private

  def sort_column
    Idea.column_names.include?(params[:sort]) ? params[:sort] : "like"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

