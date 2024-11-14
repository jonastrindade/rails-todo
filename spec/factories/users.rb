FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
    cpf { '13043067630' }
    role { 'common' }
  end
end
