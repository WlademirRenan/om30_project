class Person < ApplicationRecord
  has_one :address
  accepts_nested_attributes_for :address

  validates :name, :cpf, :cns, :email, :birthday, :phone_number, :image, :status, presence: true
  validates :cpf, uniqueness: { case_sensitive: false }
  validate :cpf_validator, :cns_validator, :email_validator

  def cpf_validator
    errors.add(:cpf, 'inválido') unless CPF.valid?(cpf)
  end

  def cns_validator
    errors.add(:cns, 'inválido') unless ::Cns::Validator.valid?(cns.to_s)
  end

  def email_validator
    errors.add(:email, 'inválido') unless EmailValidator.valid?(email)
  end

  #after_commit sms
  #after_commit email

  #carrier_wave para image em 2 tamanhos
end
