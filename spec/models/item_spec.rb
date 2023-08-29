require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it '必要な情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 0')
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @item.fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee status must be other than 0")
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @item.fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee status can't be blank")
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.delivery_schedule_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery schedule must be other than 0")
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @item.delivery_schedule_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery schedule can't be blank")
      end
      it '価格が空欄だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end