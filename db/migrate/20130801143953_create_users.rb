class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :surname1
      t.string :surname2
      t.string :company

      t.timestamps
    end
  end
end
