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
    end
  end

end
