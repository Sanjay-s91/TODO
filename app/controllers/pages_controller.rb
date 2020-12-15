
class PagesController < ApplicationController

 def search
   if params[:search].blank?  
      redirect_to root_path, notice: "Empty field!"
   else  
       @parameter = params[:search].downcase 

       @results = Task.all.where("lower(task_note) LIKE :search AND user_id = :user_id", search: @parameter,user_id:session[:user_id]) 
       
   end  
  end

end
