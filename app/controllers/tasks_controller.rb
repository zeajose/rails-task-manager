class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @new_task = Task.new(title: params["task"][:title], details: params["task"][:details])
    @new_task.save
    redirect_to tasks_path(@new_task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(title: params["task"][:title],
      details: params["task"][:details],
      completed: params["task"][:completed])
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
end
