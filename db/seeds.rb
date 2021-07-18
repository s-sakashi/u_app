# メインのサンプルユーザー
User.create!(name:  "Sakashi",
    email: "sakashi@uapp.com",
    password:              "foobar",
    password_confirmation: "foobar",
    admin: true,
    activated: true,
    activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@uapp.com"
password = "password"
User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)
end


# 温泉データを作成する
Hotspring.create!(
    name: "道後温泉",
    address: "愛媛県松山市道後湯之町５−６",
    ph: 9.1,
    quality: "アルカリ性単純泉")


# ユーザーの一部を対象にレビューを生成する
users = User.order(:created_at).take(20)
hotsprings = Hotspring.all
hotsprings.each do |hotspring|
  star = rand(1..5)
  content = "ここにレビューを書く。"
  users.each { |user| user.reviews.create!(star: star, comment: content, hotspring_id: hotspring.id) }
end