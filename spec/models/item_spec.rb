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
