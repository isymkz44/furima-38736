require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
    end
    context '購入ができる場合' do
      it 'カード情報、郵便番号、都道府県、市町村区、番地、建物名、電話番号が正しく入力されていれば保存できる' do
        expect(@buy_address).to be_valid
      end
      it '建物名は入力がなくても保存できる' do
        @buy_address.building_name = nil
        expect(@buy_address).to be_valid
      end
    end

    context '購入ができない場合' do
      it 'カード情報が空の場合は購入できない' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空の場合は購入できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、ハイフンがないと購入できない' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号は、３桁と４桁でハイフンを挟まないと購入できない' do
        @buy_address.postal_code = '12-34567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号は、半角でないと購入できない' do
        @buy_address.postal_code = '１２３-４５６７'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が空の場合は購入できない' do
        @buy_address.prefecture_id = '0'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空の場合は購入できない' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空の場合は購入できない' do
        @buy_address.house_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号は空では購入できない' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は10桁未満では購入できない' do
        @buy_address.phone_number = '123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は12桁以上では購入できない' do
        @buy_address.phone_number = '123456789012'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は半角数字でない場合は購入できない' do
        @buy_address.phone_number = '１２３４５６７８９０'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'itemが紐づいていないと購入できない' do
        @buy_address.item_id = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include ("Item can't be blank")
      end
      it 'userが紐づいていないと購入できない' do
        @buy_address.user_id = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include ("User can't be blank")
      end
    end
  end
end
