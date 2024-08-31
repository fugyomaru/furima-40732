class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_purchaser = OrderPurchaser.new
  end

  def create
    @order_purchaser = OrderPurchaser.new(order_purchaser_params)
    if @order_purchaser.valid?
      pay_item
      @order_purchaser.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_purchaser_params
    params.require(:order_purchaser).permit(:postal_code, :area_id, :city, :street_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_purchaser_params[:token],
      currency: 'jpy'
    )
  end
end
