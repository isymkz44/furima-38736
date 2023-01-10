class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit,:update]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to action: :show
    else
      render :edit
    end
  end

  def show
  end

   private
   def item_params
     params.require(:item).permit(:name,:description,:image,:price,:category_id,:condition_id,:shipping_charge_id,:shipping_date_id,:prefecture_id).merge(user_id: current_user.id)
   end

   def set_item
     @item = Item.find(params[:id])
   end
end
