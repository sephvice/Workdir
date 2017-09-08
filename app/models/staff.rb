class Staff < ApplicationRecord
  has_many :feeds
  has_many :posts
  belongs_to :team
  has_many :comments

  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def co_teams
    team.staffs
  end
end
