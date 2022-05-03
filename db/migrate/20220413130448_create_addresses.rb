class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :zipcode, null: false
      t.string :street, null: false
      t.string :complement
      t.string :neighborhood, null: false
      t.string :city, null: false
      t.string :uf, null: false
      t.string :number, null: false
      t.string :code_ibge
      t.integer :person_id

      t.timestamps
    end
  end
end
