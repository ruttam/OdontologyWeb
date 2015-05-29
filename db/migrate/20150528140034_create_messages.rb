class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :email
      t.text :msg
      t.integer :val

      t.timestamps null: false
    end
  end
end
