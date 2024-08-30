require 'rails_helper'

RSpec.describe OrderPurchaser, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_purchaser = FactoryBot.build(:order_purchaser, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_purchaser).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_purchaser.building_name = ''
        expect(@order_purchaser).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_purchaser.postal_code = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが正しい形式でないと保存できないこと' do
        @order_purchaser.postal_code = '1234567'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'area_idが空だと保存できないこと' do
        @order_purchaser.area_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Area can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_purchaser.city = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空だと保存できないこと' do
        @order_purchaser.street_address = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_purchaser.phone_number = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では保存できないこと' do
        @order_purchaser.phone_number = '090123456'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上では保存できないこと' do
        @order_purchaser.phone_number = '090123456789'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが数字以外を含む場合保存できないこと' do
        @order_purchaser.phone_number = '090-1234-5678'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Phone number is invalid')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_purchaser.user_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_purchaser.item_id = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
