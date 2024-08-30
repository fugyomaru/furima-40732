class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    @order_purchaser = OrderPurchaser.new
  end

  def create
    @order_purchaser = OrderPurchaser.new(order_purchaser_params)
    if @order_purchaser.valid?
      @order_purchaser.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_purchaser_params
    params.require(:order_purchaser).permit(:postal_code, :area_id, :city, :street_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
