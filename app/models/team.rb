class Team < ApplicationRecord
  belongs_to :company
  has_many :staff
  validates :name, presence: true
end
