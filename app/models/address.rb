class Address < ApplicationRecord
  validates :zipcode, :street, :number, :neighborhood, :city, :uf, presence: true

  #find or create address
end
