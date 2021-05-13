class Plan < ApplicationRecord
    belongs_to :user
    attachment :topphoto
    
    has_many :courses
end
