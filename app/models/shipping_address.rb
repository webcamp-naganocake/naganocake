class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def shipping_address_for_view
  	self.postal_code + "　" + self.address + "　" + self.name
  end

end
