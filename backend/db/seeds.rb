10.times do
    User.create!(
       name: Faker::JapaneseMedia::DragonBall.character,
       email: Faker::Internet.email,
       birthday: Faker::Date.birthday(min_age: 12, max_age: 80),
       password: Faker::Crypto.sha256,
       note: "あああああ"
     )
end

subjects = ["HTML5", "CSS3", "JavaScript", "Ruby", "Sinatra", "Ruby on Rails", "サイト制作"]
colors = ["Orange", "Blue", "Yellow", "Red", "Gray", "#3366ff", "Green"]
subjects.zip(colors) do |subject, color|
    Subject.create!(
        name: subject, 
        color: color 
    )
end

100.times do
    StudiedRecord.create!(
       user_id: (1..10).to_a.sample,
       date: Faker::Date.between(from: '2020-01-01', to: '2020-12-31'),
       studied_type: [1, 2].sample,
       square_count: [1, 2, 3].sample,
       note: "ProgateのRails7周目完了しました"
     )
end

100.times do |i|
    SquareRecordSubject.create!(
       studied_record_id: i +1,
       subject_id: (1..7).to_a.sample
     )
end

10.times do |i|
    SquareRecordSubject.create!(
       studied_record_id: i +1,
       subject_id: (1..7).to_a.sample
     )
end



