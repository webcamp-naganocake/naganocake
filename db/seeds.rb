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
