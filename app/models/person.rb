class Person < ApplicationRecord
  validates :name, :cpf, :cns, :email, :birthday, :fone_number, :image, :status, presence: true
  validates :cpf, uniqueness: { case_sensitive: false }
  

  validate :cpf_valid, :cns_valid, :email_valid, :birthday_valid

  #validar cpf
  def cpf_valid
    errors.add(:cpf, 'Cpf inválido') unless CPF.valid?(cpf)
  end

  #validar cns
  def cns_valid 
    false
  end

  #validar email
  def email_valid 

  end

  #validar birthday
  def birthday_valid 

  end

  #after_commit sms
  #after_commit email

  #carrier_wave para image em 2 tamanhos

  #nested attr para address
end
