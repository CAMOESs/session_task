class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  #skip_before_action :onlySingnIn

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, success: 'タスクを登録しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, success: '「タスクを登録しました」'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, danger: 'タスクを削除しました'
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :content)
    end
end
