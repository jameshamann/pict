class Comment < ApplicationRecord
  validates :comment, length: { minimum: 3 }
  belongs_to :user
  has_one :photo


end
