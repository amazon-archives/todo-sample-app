class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_create_params)
    if @task.save
      redirect_to tasks_path
    else
      flash[:error] = "Task creation failed! #{print_errors(@task)}"
      redirect_to tasks_path
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_update_params)
      redirect_to tasks_path
    else
      flash[:error] = "Task failed to update! #{print_errors(@task)}"
      redirect_to tasks_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.delete
      redirect_to tasks_path
    else
      flash[:error] = "Task deletion failed! #{print_errors(@task)}"
      redirect_to tasks_path
    end
  end

  def task_create_params
    params.permit(:name)
  end

  def task_update_params
    params.permit(:name, :completed_flag)
  end

  def print_errors task
    task.errors.full_messages.join(", ") + "."
  end
end
