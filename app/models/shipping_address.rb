class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }, presence: true
  validates :address, presence: true
  validates :name, presence: true

end
