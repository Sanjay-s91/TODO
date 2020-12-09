
class PagesController < ApplicationController

 def search
   if params[:search].blank?  
      redirect_to root_path, notice: "Empty field!"
   else  
       @parameter = params[:search].downcase  
       @results = Task.all.where("lower(task_note) LIKE :search", search: @parameter) 
   end  
  end

end
