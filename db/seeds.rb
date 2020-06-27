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

# 30.times do |n|
#    Customer.create!(
#       email: "test#{n + 1}@test.com",
#       first_name: "名#{n + 1}",
#       last_name: "姓#{n + 1}",
#       first_name_kana: "セイ#{n + 1}",
#       last_name_kana: "メイ#{n + 1}",
#       password: "111111",
#       postal_code: "1111111",
#       address: "大阪府大阪市1-1-1 dmmビル#{n + 1}階",
#       phone_number: "09000000000"
#    )
# end


# テストのために以下記述

Genre.create!(
   name: "ケーキ",
   is_genres_status: true
)

Genre.create!(
   name: "クッキー",
   is_genres_status: true
)

Genre.create!(
   name: "チョコレート",
   is_genres_status: true
)

Genre.create!(
   name: "アイスクリーム",
   is_genres_status: true
)

Genre.create!(
   name: "タルト",
   is_genres_status: true
)

Genre.create!(
   name: "フランスパン",
   is_genres_status: true
)

Genre.create!(
   name: "シュークリーム",
   is_genres_status: true
)

Item.create!(
    name: "フルーツタルト",
    genre_id: 5,
    description: "フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！フルーツ盛り沢山！",
    price_without_tax: 1000,
    image: open("./app/assets/images/cake-1284548_640.jpg")
   )

Item.create!(
    name: "イチゴタルト",
    genre_id: 5,
    description: "イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！イチゴ盛り沢山！",
    price_without_tax: 1200,
    image: open("./app/assets/images/footer-cake.jpg")
   )

Item.create!(
    name: "フランスパン",
    genre_id: 6,
    description: "フランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパンフランスの硬いパン",
    price_without_tax: 1200,
    image: open("./app/assets/images/an_20190501_026-thumb-940x626-6728.jpg")
   )

Item.create!(
    name: "ブルーベリーケーキ",
    genre_id: 1,
    description: "ブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキブルーベリーのケーキ",
    price_without_tax: 500,
    image: open("./app/assets/images/baked-goods-1846460_640.jpg")
   )

Item.create!(
    name: "レアチーズケーキ",
    genre_id: 1,
    description: "レアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキレアチーズケーキ",
    price_without_tax: 1600,
    image: open("./app/assets/images/blur-1869227_640.jpg")
   )

Item.create!(
    name: "チーズケーキ",
    genre_id: 1,
    description: "チーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキチーズケーキ",
    price_without_tax: 400,
    image: open("./app/assets/images/cheese-cake.jpg")
   )

Item.create!(
    name: "生チョコ",
    genre_id: 3,
    description: "生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ生チョコ",
    price_without_tax: 350,
    image: open("./app/assets/images/img_honkaku_choconama_171110.jpg")
   )

Item.create!(
    name: "シュークリーム",
    genre_id: 7,
    description: "？？？？",
    price_without_tax: 200,
    image: open("./app/assets/images/img_milky_chou_A_191115.jpg")
   )

Item.create!(
    name: "特製フルーツタルト",
    genre_id: 5,
    description: "ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！ながのCAKE特製フルーツタルト！",
    price_without_tax: 200,
    image: open("./app/assets/images/anv_fruits_torte.jpg")
   )


Item.create!(
    name: "アイスケーキ",
    genre_id: 4,
    description: "アイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキアイスケーキ",
    price_without_tax: 200,
    image: open("./app/assets/images/ice-1786311_640.jpg")
   )


Item.create!(
    name: "ティラミスケーキ",
    genre_id: 1,
    description: "ティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキティラミス風ケーキ",
    price_without_tax: 200,
    image: open("./app/assets/images/img_hokkaido_tiramisu_200204.jpg")
   )


Item.create!(
    name: "アップルパイ",
    genre_id: 5,
    description: "アップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイアップルパイ",
    price_without_tax: 200,
    image: open("./app/assets/images/img_kokusan_apple_pie.jpg")
   )


# Order.create!([
#   {customer_id:1, postage:800, total_payment:1880, payment_method:1, order_status:1, post_code:"211-1111", address:"大阪府大阪市1-1-1 dmmビル1階", name:"姓1 名1"},
#     {customer_id:2, postage:800, total_payment:1300, payment_method:1, order_status:2, post_code:"111-1111", address:"大阪府大阪市1-1-1 dmmビル2階", name:"姓2 名2"}
#   ])

#   20.times do |n|
#    ShippingAddress.create!(
#      name: "テスト太郎#{n + 1}",
#      postal_code: "1234567",
#      address: "京都府京都市山科区1-2-#{n + 1}",
#      customer_id: n + 1
#    )
#  end


#  5.times do |n|
#    Order.create!(
#      customer_id: n + 1,
#      address: "奈良県奈良市奈良公園9-8-#{n + 1}",
#      post_code: "1234567",
#      name: "テスト乃助#{n + 1}",
#      postage: "800",
#      total_payment: "#{n * 800 + 800}",
#      payment_method: 0
#    )
#  end



 # 5.times do |n|
 #    Order.create!(
 #      customer_id: 6 * n + 1,
 #      address: "和歌山県和歌山市9-8-#{n + 1}",
 #      post_code: "1234567",
 #      name: "test#{n + 1}",
 #      postage: "800",
 #      total_payment: "#{n * 800 + 800}",
 #      payment_method: 1
 #    )
 #  end


 #  5.times do |n|
 #    OrderDetail.create!(
 #      order_id: n + 1,
 #      item_id: n + 1,
 #      quantity: n + 3,
 #      price: "#{n * 800}"
 #    )
 #  end

 # 5.times do |n|
 #   OrderDetail.create!(
 #     order_id: n + 1,
 #     item_id: n + 1,
 #     quantity: n + 3,
 #     price: "#{n * 800}"
 #   )
 # end
