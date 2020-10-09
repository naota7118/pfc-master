FactoryBot.define do
  factory :john, class: User do
    name { "john"}
    email { "john@example.com"}
    password { "password"}
    password_confirmation { "password"}
  end

  factory :nick, class: User do
    name { "nick"}
    email { "john@example.com"}
    password { "password"}
    password_confirmation { "password"}
  end
end