
class User < ApplicationRecord
    has_one_attached :image
    has_many :tasks ,dependent: :destroy 
    
    has_secure_password

    validates :first_name,  
    presence: true, length: {minimum: 2}  

    validates :last_name,  
    presence: true  

    validates :email,  
    presence: true,
    format: {  
        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
    } 

end
