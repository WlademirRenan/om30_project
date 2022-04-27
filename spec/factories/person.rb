FactoryBot.define do
    factory :person do
      name { Faker::Name.name}
      cpf { CPF.generate }
      cns { '174817056080009' }
      email { Faker::Internet.email }
      birthday { Time.now }
      phone_number { Faker::Base.numerify('(##) ####-####') }
      image { 'a' }
      status { true }
      address_id { 1 }
    end
    trait :invalid_person do
      cpf { '12312312312' }
      email { 'aaa' }
      cns { '012345678912345'}
    end
  end