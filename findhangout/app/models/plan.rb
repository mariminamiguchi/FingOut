class Plan < ApplicationRecord
    belongs_to :user
    attachment :topphoto
    
    has_many :courses
    has_many :favorites
    has_many :likers, through: :favorites, source: :user
  
  
  # def like(plan)
  #   self.favorites.find_or_create_by(plan_id: plan.id)
  # end
  
  # def unlike(plan)
  #   favorite = self.favorites.find_by(plan_id: plan.id)
  #   favorite.destroy if favorite
  # end
  
  # def liking?(plan)
  #   self.likings.include?(plan)
  # end
end
