require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品"do

    before do
      @item = FactoryBot.build(:item)
    end
    
   context "出品できるとき" do
      it "商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数。販売価格が正しく入力されていれば出品できる" do
         expect(@item).to be_valid
      end
   end

   context "出品できないとき" do
      it "画像が空だと出品できない" do
         @item.image = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと出品できない" do
         @item.name = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "カテゴリーが空だと出品できない" do
         @item.category_id = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が空だと出品できない" do
         @item.condition_id  = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が空だと出品できない" do
         @item.shipping_charge_id = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "発送元の地域が空だと出品できない" do
         @item.prefecture_id  = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数が空だと出品できない" do
         @item.shipping_date_id = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it "販売価格が空だと出品できない" do
         @item.price = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "販売価格が300円未満だと出品できない" do
         @item.price = "299"
         @item.valid?
         expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "販売価格が10000000円以上だと出品できない" do
         @item.price = "100000000100000000"
         @item.valid?
         expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "販売価格が半角数字でないと出品できない" do
         @item.price = "３００００"
         @item.valid?
         expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "商品価格に英字が混ざっている場合では出品できない" do
         @item.price = "1000abc"
         @item.valid?
         expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "" do
      end
   end
  end
end