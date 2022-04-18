class Person < ApplicationRecord
  validates :name, :cpf, :cns, :email, :birthday, :fone_number, :image, :status, presence: true
end
