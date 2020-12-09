class Task < ApplicationRecord
    belongs_to :user
    
    validates :task_name,  
    presence: true,:message => 'Please Enter User name'  

    validates :task_note,
    presence: true

    validates :start_date,  
    presence: true  

    validates :end_date,  
    presence: true
    
end