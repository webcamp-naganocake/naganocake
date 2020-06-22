class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum order_status: { waiting: 0, confirmed: 1, making: 2, ready_for_shipping: 3, shipping: 4 }

end
