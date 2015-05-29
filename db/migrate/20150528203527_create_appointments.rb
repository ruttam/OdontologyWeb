class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.text :comment
      t.boolean :isUrgent
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
