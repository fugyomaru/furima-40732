class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_item, only: [:edit, :update, :show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :condition_id, :charge_id, :area_id, :day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    return if @item.user == current_user

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
