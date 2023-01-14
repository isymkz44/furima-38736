class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item,only: [:new, :create]
  before_action :yourself_item,only: [:new]

  def new
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
       @buy_address.save
       redirect_to root_path
    else
       render :new
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :buy_id).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])#←←”id"だと、orderモデルのparamsのIDを取得することになるため、itemのidが欲しい場合はこう記述
  end

  def yourself_item
    if current_user == @item.user
      redirect_to "/"
    end
   end
end

