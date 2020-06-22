# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'test@test.com',
   password: 'testtest'
)

30.times do |n|
   Customer.create!(
      email: "test#{n + 1}@test.com",
      first_name: "名#{n + 1}",
      last_name: "姓#{n + 1}",
      first_name_kana: "セイ#{n + 1}",
      last_name_kana: "メイ#{n + 1}",
      password: "111111",
      postal_code: "1111111",
      address: "大阪府大阪市1-1-1 dmmビル#{n + 1}階",
      phone_number: "09000000000"
   )
end


# テストのために以下記述

Genre.create!(
   name: "ケーキ",
   is_genres_status: false
)

12.times do
   Item.create!(
      name: "cake",
      genre_id: 1,
      description: "商品説明商品説明商品説明",
      price_without_tax: 1000,
      is_sales_status: false
   )
end

Order.create!([
  {customer_id:1, postage:800, total_payment:1880, payment_method:1, order_status:1, post_code:"211-1111", address:"大阪府大阪市1-1-1 dmmビル1階", name:"姓1 名1"},
    {customer_id:2, postage:800, total_payment:1300, payment_method:1, order_status:2, post_code:"111-1111", address:"大阪府大阪市1-1-1 dmmビル2階", name:"姓2 名2"}
  ])

  20.times do |n|
   ShippingAddress.create!(
     name: "テスト太郎#{n + 1}",
     postal_code: "1234567",
     address: "京都府京都市山科区1-2-#{n + 1}",
     customer_id: n + 1
   )
 end


 5.times do |n|
   Order.create!(
     customer_id: n + 1,
     address: "奈良県奈良市奈良公園9-8-#{n + 1}",
     post_code: "1234567",
     name: "テスト乃助#{n + 1}",
     postage: "800",
     total_payment: "#{n * 800 + 800}",
     payment_method: 0
   )
 end

 5.times do |n|
   Order.create!(
     customer_id: 6 * n + 1,
     address: "和歌山県和歌山市9-8-#{n + 1}",
     post_code: "1234567",
     name: "test#{n + 1}",
     postage: "800",
     total_payment: "#{n * 800 + 800}",
     payment_method: 1
   )
 end

 5.times do |n|
   OrderDetail.create!(
     order_id: n + 1,
     item_id: n + 1,
     quantity: n + 3,
     price: "#{n * 800}"
   )
 end
