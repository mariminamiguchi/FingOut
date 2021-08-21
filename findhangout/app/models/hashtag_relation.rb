class HashtagRelation < ApplicationRecord
    belongs_to :plan
    belongs_to :hashtag
    with_options presence: true do
        validates :plan_id
        validates :hashtag_id
    end
end
