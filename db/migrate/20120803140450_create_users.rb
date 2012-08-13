class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
