class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :cns, null: false
      t.string :email, null: false
      t.date :birthday, null: false
      t.integer :phone_number, null: false
      t.string :image, null: false
      t.boolean :status, null: false
      t.integer :address_id

      t.timestamps
    end
  end
end
