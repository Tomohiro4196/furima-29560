require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/商品.jpg')
    @item.save
    @order_address = FactoryBot.build(:order_address)
    @order_address.buyer_id = @user.id
    @order_address.item_id = @item.id
    sleep 0.1
  end

  describe '商品購入' do
    context 'purchase item correctly' do
      it '必須事項があれば購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名がなくても購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context 'unable to purchase' do
      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'zip-codeが空では購入できない' do
        @order_address.zip_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank", 'Zip code is invalid. Include hyphen(-)')
      end

      it 'Zip_codeには-(ハイフン)がないと購入できない' do
        @order_address.zip_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end

      it '都道府県がid = 1では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村区がなければ購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地がなければ購入できない' do
        @order_address.town_block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Town block can't be blank")
      end

      it '電話番号が必須であること' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以下でなけれればならない' do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not valid')
      end
    end
  end
end
