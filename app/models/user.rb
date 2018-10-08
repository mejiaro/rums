class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@techlatam\.la\z/,
                  message: "must be a TechLatams account" }


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      user = User.create(
        email: data['email'],
        name: data['name'],        
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
