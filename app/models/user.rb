class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable   
         
  katakana_reg = /\A^[ァ-ンー－]+$\z/
  zennkaku_reg = /\A^[ぁ-んァ-ン一-龥]\z/

  with_options presence: true do
    validates :nickname    
    validates :birthday
      with_options format: {
        with: zennkaku_reg,
        message: "は全角のみで入力してください"
      } do
        validates :family_name
        validates :first_name
      end

      with_options format: { 
        with:  katakana_reg,
        message: "は全角カタカナのみで入力して下さい"
      } do
        validates :family_kana
        validates :first_kana
      end
  end

  validate :password_complexity


  def password_complexity
    return if password =~ /^(?=.*?[a-z])(?=.*?[0-9]).{6,70}$/

    errors.add :password, 'should include 1 lowercase and 1 digit'
  end
end
