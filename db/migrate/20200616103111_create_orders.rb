class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :postage
      t.integer :total_payment
      t.integer :payment_method,default: 0,null: false
      t.integer :order_status,default: 0,null: false
      t.string  :post_code
      t.string  :address
      t.string  :name
      t.timestamps
    end
  end
end
