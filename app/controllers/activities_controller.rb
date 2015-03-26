class ActivitiesController < ApplicationController

  def index
  	@activities = Activity.all
  	render :action => 'index'
  end

  def new
  	@activity = Activity.new
  	render :action => 'new'
  end

  def create
  	@activity = Activity.new(valid_activity_parameters)
  	if @activity.save
  		redirect_to activities_path
  	else
  		redirect_to new_activity_path
  	end
  end

  def show
  	@activity = Activity.find(params[:id])
  	render :action => 'show'
  end

  def edit
  	@activity = Activity.find(params[:id])
  	render :action => 'edit'
  end

  def update
  	@activity = Activity.find(params[:id])
  	if @activity.update_attributes(valid_activity_parameters)
  		flash[:notice] = "Successfully update task ID " + @activity.id.to_s
  		redirect_to @activity
  	else
  		flash[:notice] = "Failed to update task ID " + @activity.id.to_s
  		render_to edit_activity_path
  	end
  end

  def destroy
  	@activity = Activity.find(params[:id])
  	if @activity.destroy
  		flash[:notice] = "Successfully deleted task ID " + @activity.id.to_s
  	else
  		flash[:notice] = "Failed to delete task ID " + @activity.id.to_s
  	end
  	redirect_to activities_path
  end

  private
	  def valid_activity_parameters
	    params.require(:activity).permit(:name, :description, :done)
	  end

end
