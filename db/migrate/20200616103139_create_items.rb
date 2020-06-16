class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :price_without_tax
      t.string :image_id
      t.boolean :is_sales_status, default: false, null: false
      t.timestamps
    end
  end
end
