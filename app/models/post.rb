class Post < ApplicationRecord
  belongs_to :staff
  has_many :comments, dependent: :destroy

  scope :team_posts, ->(team_id) { joins(:staff).where("staffs.team_id = ?", team_id)}
end
