class Post < ApplicationRecord
  belongs_to :staff
  has_many :comments, dependent: :destroy

  scope :team_posts, -> {where('staff_id')}
end
