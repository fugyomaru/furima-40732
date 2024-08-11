require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品ができる場合' do
      it '全ての項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_textが空では出品できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end

      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが1では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'charge_idが1では出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it 'area_idが1では出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'day_idが1では出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
