class ItemsController < ApplicationController
  def index
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
