class Staff < ApplicationRecord
  has_many :feeds
  belongs_to :team
  has_many :teams
  has_many :company, through: :teams
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
