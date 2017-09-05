class Feed < ApplicationRecord
  belongs_to :staff
  has_many :comments

  scope :team_feeds, -> {where('staff_id')}

end
