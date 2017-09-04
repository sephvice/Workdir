class Team < ApplicationRecord
  belongs_to :company
  has_many :staffs
  validates :name, presence: true

  scope :member_feeds, -> {where('company_id')}
end
