class User < ApplicationRecord

  devise :omniauthable, :omniauth_providers => [:facebook]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    has_many :photos, dependent: :destroy
    has_many :comments, dependent: :destroy
   end
 end
end
