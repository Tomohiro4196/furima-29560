class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,    presense: true
  validates :birthday,    presense: true
  validates :family_name, presense: true
  validates :first_name,  presense: true
  validates :family_kana, presense: true
  validates :first_kana,  presense: true
end
