class Feed < ApplicationRecord
  belongs_to :staff

  scope :team_feeds, -> {where('staff_id')}

end
