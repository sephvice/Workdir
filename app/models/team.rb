class Team < ApplicationRecord
  belongs_to :company
  belongs_to :staff
  validates :staff, presence: true
  validates :team, presence: true
end
