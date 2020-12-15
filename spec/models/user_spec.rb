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
        expect(@user).to be_valid
      end

      it 'フリガナが全て全角カタカナであれば登録できる' do
        @user.family_kana = 'ヤマダ'
        @user.first_kana = 'テツト'
        expect(@user).to be_valid
      end
    end

    context 'unable to sign-up' do
      it 'nicknameが空欄では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空欄では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは重複できない' do
        @user.save
        user2 = FactoryBot.build(:user)
        user2.email = @user.email
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end

      it '@を含まないemailは登録できない' do
        @user.email = 'abcd123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空欄では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは6文字以上でなければならない' do
        @user.password = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは半角英数字混合でなければならない' do
        @user.password = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password should include 1 lowercase and 1 digit, and more than 6')
      end

      it 'password_confirmationが空欄では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'ユーザー本名の名前がなければ登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name は全角のみで入力してください')
      end

      it 'ユーザー本名の苗字がなければ登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name は全角のみで入力してください')
      end

      it 'ユーザー本名は全角でなければならない' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角のみで入力してください')
      end

      it 'フリガナがなければ登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank", 'First kana は全角カタカナのみで入力して下さい')
      end

      it 'フリガナは全角カタカナでないと登録できない' do
        @user.first_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana は全角カタカナのみで入力して下さい')
      end

      it '生年月日がなければ登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
