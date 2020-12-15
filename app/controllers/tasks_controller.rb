
class TasksController < ApplicationController
  
  before_action :get_user
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
  	 @task = @user.tasks
  end

  def show
  end

  def new
    @task = @user.tasks.build
  end 

  def edit
  end
 
  def create
   @task = @user.tasks.build(task_params) 
    if @task.save
     redirect_to user_tasks_path(@user),notice:'task was successfully created'
    else
     render :new
    end	 
  end
  
  def update
    respond_to do |format|
     if @task.update(task_params)
        format.html {redirect_to user_tasks_path(@user), notice: 'User was successfully updated.'}  
        format.js
     else
        render :new 
     end
    end
  end  

  def destroy
    @task.destroy
    redirect_to user_tasks_path(@user),notice:'task was successfully destroy'
  end
  
  private

  def get_user
    @user = User.find(params[:user_id])
  end	
  
  def set_task
    @task = @user.tasks.find(params[:id])
  end
 
  def task_params
    params.require(:task).permit(:task_name, :task_note, :start_date, :end_date, :user_id)
  end  

end
