class OrderPurchaser
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :street_address, :building_name, :phone_number, :order_id, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id:, item_id:)
    Purchaser.create(postal_code:, area_id:, city:, street_address:,
                     building_name:, phone_number:, order_id: order.id)
  end
end
