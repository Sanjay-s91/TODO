
class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all

  end	
 
  def show
  end
   
  def new
    @user = User.new  
  end

  def edit
  end

  def create
   @user = User.new(user_params)
    respond_to do |format|
     if @user.save
       session[:user_id] = @user.id
       format.html{redirect_to users_path,notice: 'User was successfully created'}
       format.js
     else
       render :new
     end	
   end
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.html {redirect_to users_path, notice: 'User was successfully updated.'}  
        format.js
      end  
    else
        render :edit
    end 
  end

  def destroy
   @user.destroy
    respond_to do |format|
     format.js
     format.html { redirect_to users_url,  notice: 'User was successfully destroyed.'}
     format.json { head :no_content }
 
    end 
  end
  
  def set_user
   @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,:image,:password, :password_confirmation)
  end

end

