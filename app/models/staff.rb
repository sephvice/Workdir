class Staff < ApplicationRecord
  has_many :feeds
  belongs_to :team

  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :staff_feeds, -> {where('team_id')}

end
