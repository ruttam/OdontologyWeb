class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :personalCode
      t.string :telephoneNr
      t.string :email
      t.string :address
      t.string :comments
      t.boolean :isActive
      t.datetime :lastAppointment

      t.timestamps null: false
    end
  end
end
