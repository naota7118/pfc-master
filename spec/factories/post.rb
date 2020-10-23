# frozen_string_literal: true

FactoryBot.define do
  factory :curry, class: Post do
    food { "curry" }
    calorie { 1000 }
    protein { 1000 }
    fat { 1000 }
    carbo { 1000 }
    text { "カレーを食べました" }
    weight { 70 }
    user_id { 1 }
  end

  factory :ramen, class: Post do
    food { "ramen" }
    calorie { 1000 }
    protein { 1000 }
    fat { 1000 }
    carbo { 1000 }
    text { "ラーメンを食べました" }
    weight { 70 }
    user_id { 2 }
  end

  factory :saladchicken, class: Post do
    food { "ramen" }
    calorie { 1000 }
    protein { }
    fat { }
    carbo { }
    text { "やっぱり減量食はサラダチキンがいちばん！" }
    weight { 70 }
    user_id { 3 }
  end

  factory :natto, class: Post do
    food { "natto" }
    calorie { 100 }
    protein { 100 }
    fat { 100 }
    carbo { 100 }
    text { }
    weight { 65 }
    user_id { 4 }
  end

  factory :udon, class: Post do
    food { "udon" }
    calorie { 500 }
    protein { 500 }
    fat { 500 }
    carbo { 500 }
    text { "うどんも食べたいけどあまり食べられない" }
    image { }
    weight { 67 }
    user_id { 5 }
  end
end
