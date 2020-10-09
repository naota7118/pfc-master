FactoryBot.define do

  factory :curry, class: Post do
    food { "curry"}
    calorie { 1000 }
    protein { 1000 }
    fat { 1000 }
    carbo { 1000 }
    text { "カレーを食べました" }
    weight { 70}
    user_id { 1 }
  end

  factory :ramen, class: Post do
    food { "ramen"}
    calorie { 1000 }
    protein { 1000 }
    fat { 1000 }
    carbo { 1000 }
    text { "ラーメンを食べました" }
    weight { 70 }
    user_id { 2 }
  end
end