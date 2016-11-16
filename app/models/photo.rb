class Photo < ApplicationRecord
  validates :name, length: { minimum: 1 }, uniqueness: true
  has_attached_file :avatar, styles: { medium: "300x300>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
end
