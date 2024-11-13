FactoryBot.define do
  factory :user do
    email { 'jonastrinda@gmail.com' }
    password { 'jonastrinda@gmail.com' }
    cpf { '13043067630' }
    role { 'common' }
  end
end
