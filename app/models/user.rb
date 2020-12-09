class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname    
    validates :birthday
    validates :family_name
    validates :first_name
    validates :family_kana
    validates :first_kana
  end

 
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[a-z])(?=.*?[0-9]).{6,70}$/

    errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
