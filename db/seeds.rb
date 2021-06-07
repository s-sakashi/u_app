# メインのサンプルユーザー
User.create!(name:  "Sakashi",
    email: "sakashi@uapp.com",
    password:              "foobar",
    password_confirmation: "foobar")

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@uapp.com"
password = "password"
User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password)
end