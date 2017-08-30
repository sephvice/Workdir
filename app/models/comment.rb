class Comment < ApplicationRecord
  belongs_to :feed
  belongs_to :staff
end
