FactoryBot.define do
    factory :person do
      name { Faker::Name.name}
      cpf { CPF.generate }
      cns { '123456' }
      email { Faker::Internet.email }
      birthday { Time.now }
      fone_number { Faker::Base.numerify('(##) ####-####') }
      image { 'a' }
      status { true }
      address_id { 1 }
    end
    trait :invalid_person do
      cpf { '12312312312' }
    end
  end