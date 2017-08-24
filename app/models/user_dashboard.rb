class UserDashboard < ApplicationRecord

  has_many :post
  has_many :department
  accepts_nested_attributes_for :post, :reject_if => lambda { |a| a[:content].blank}, allow_destroy: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

end
