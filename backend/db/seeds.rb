20.times do
    User.create!(
       name: Faker::JapaneseMedia::DragonBall.character,
       email: Faker::Internet.email,
       birthday: Faker::Date.birthday(min_age: 12, max_age: 80),
       password: Faker::Crypto.sha256,
       note: "あああああ"
     )
end