class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

   private
   def create_params
     params.require(:item).permit(:name,:description,:image,:price,:category_id,:condition_id,:shipping_charge_id,:shipping_date_id,:prefecture_id).merge(user_id: current_user.id)
   end
end
