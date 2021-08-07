class Course < ApplicationRecord
    belongs_to :plan
    
    attachment :photo
end