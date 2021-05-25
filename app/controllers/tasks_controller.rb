class TasksController < ApplicationController
  before_action :find_task, only: [:find, :edit, :update, :destroy]

  def tasks
    @tasks = Task.all
  end

  def find; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit; end

  def update
    @task.update(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path(@task)
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
