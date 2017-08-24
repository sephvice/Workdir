class Company < ApplicationRecord
  has_many :teams
  has_many :staffs
  has_many :staff, through: :teams
end
