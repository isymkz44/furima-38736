FactoryBot.define do
  factory :user do
    first_name            { "石田"}
    last_name             { "裕太" }
    first_name_reading    { "イシダ" }
    last_name_reading     { "ユウタ" }
    email                 { "test@example" }
    nickname              { "イシユウ" }
    password              { "test123" }
    password_confirmation { password }
    birthday              { "1999-01-01" }
  end
end         