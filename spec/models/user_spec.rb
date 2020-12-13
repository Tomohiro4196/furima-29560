require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'Sign-up correctly' do
      it '必須事項が全て揃っていれば、新規登録ができる' do
        expect(@user).to be_valid
      end

      it 'メールアドレスに@が入っていれば登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end

      it 'メールアドレスに同じものがなければ登録できる' do
       user1 = FactoryBot.build(:user)
       user1.email = 'user1@user.com'
       user2 = FactoryBot.build(:user)
       user2.email = 'user2@user.com'
       expect(user2).to be_valid
      end

      it 'passwordが6文字以上かつ英数字混合であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end

      it 'first_name/family_nameが全角であれば登録できる' do
        @user.family_name = '山田'
        @user.first_name = '哲人'
      end

      it 'フリガナが全て全角カタカナであれば登録できる' do
        @user.first_kana = 'テツト'
        @user.family_kana = 'ヤマダ'
      end
    end

  end

end
