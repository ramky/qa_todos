class TasksController < ApplicationController
  before_filter :require_user
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.uncompleted
    @completed = Task.completed
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      show_flash_error(@task)
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      show_flash_error(@task)
      render :edit
    end
  end

  def update_completed
    set_task
    @task.completed? ? @task.completed = false : @task.completed = true
    if @task.save
      redirect_to root_path, notice: 'Task status was successfully updated.'
    else
      show_flash_error(@task)
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :completed, :deadline, :user_id)
    end
end
