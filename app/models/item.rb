class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true

  belongs_to :user
end
