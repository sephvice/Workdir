class Company < ApplicationRecord
  has_many :teams
  has_many :staffs, through: :teams
end
