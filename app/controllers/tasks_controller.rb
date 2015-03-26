class TasksController < ApplicationController
	def index
		render :action => 'new'
	end

	def create
		task_parameters = params[:task].is_a?(String) ? JSON.parse(params[:task]) : params[:task]
		@task = Task.new(task_parameters)

		if @task.save
			redirect_to @task
		end
	end

	private
		def valid_params
			params.require(:task).permit(:title, :description)
		end
end