class Plan < ApplicationRecord
    belongs_to :user
    attachment :topphoto
    
    has_many :courses
    has_many :favorites
    has_many :likers, through: :favorites, source: :user
    
    has_many :hashtag_relations
    has_many :hashtags, through: :hashtag_relations
  
  
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
  
  after_create do
    plan = Plan.find_by(id: self.id)
    hashtags = self.outline.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    plan.hashtags = []
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      plan.hashtags << tag
    end
  end
  
  # before_update do
  #   plan = Plan.find_by(id: self.id)
  #   plan.hashtags.clear
  #   hashtags = self.outline.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   hashtags.uniq.map do |hashtag|
  #     tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
  #     plan.hashtags << tag
  #   end
  # end
  
end
