class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  attachment :image
  validates :name, {presence: true}
  validates :description, {presence: true}
  validates :price_without_tax, {presence: true}
end
