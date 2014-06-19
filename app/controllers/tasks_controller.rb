class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    respond_to do |format|
      @task = Task.new(task_create_params)
      @task.save
      format.html { redirect_to tasks_path }
    end
  end

  def update
    respond_to do |format|
      @task = Task.find(params[:id])
      @task.update(task_update_params)
      format.html { redirect_to tasks_path }
    end
  end

  def task_create_params
    params.permit(:name)
  end

  def task_update_params
    params.permit(:name, :completed_flag)
  end
end
