require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/商品.jpg')
  end

  describe '商品出品' do
    context 'sell items correctly' do
      it '必須事項があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context 'unable to sell items' do
      it '画像が１枚必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image ファイルを選択してください')
      end

      it '商品名がなければ出品ができないこと' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明がなければ出品ができないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが選択されていなければ出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end

      it '商品の状態が選択されていなければ出品できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を選択してください')
      end

      it '配送料の負担が選択されていなければ出品できないこと' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee を選択してください')
      end

      it '発送元の場所が選択されていなければ出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture を選択してください')
      end

      it '発送までの日数が選択されていなければ出品できないこと' do
        @item.days_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days ship を選択してください')
      end

      it '価格を設定しなければ出品ができないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300-9,999,999の範囲で入力してください')
      end

      it '価格が300未満であれば出品ができないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300-9,999,999の範囲で入力してください')
      end

      it '価格が10,000,000以上であれば出品ができないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300-9,999,999の範囲で入力してください')
      end

      it '価格は半角数字でないと出品ができないこと' do
        @item.price = 'asdf'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300-9,999,999の範囲で入力してください')
      end
    end
  end
end
