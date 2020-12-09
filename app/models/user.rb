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
    return if password =~ /^(?=.*?[a-z])(?=.*?[0-9]).{6,70}$/

    errors.add :password, 'should include 1 lowercase and 1 digit'
  end
end
