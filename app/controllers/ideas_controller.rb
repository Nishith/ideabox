class IdeasController < ApplicationController

  def new
    @idea = Idea.new
    @idea.owner = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  def create
    @idea = Idea.new(params[:idea])
    @idea.owner = current_user.email
    @idea.user_id = current_user

    respond_to do |format|
      if @idea.save
        flash[:notice] = 'idea was successfully saved.'
        format.html { redirect_to([@idea]) }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
    @ideas = Idea.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @ideas }
      format.rss
    end
  end

  def edit
    @idea ||= Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        flash[:notice] = 'Idea was successfully updated.'
        format.html { redirect_to([@idea]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to([@idea]) }
      format.xml  { head :ok }
    end
  end

end
