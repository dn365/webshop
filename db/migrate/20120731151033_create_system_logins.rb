class CreateSystemLogins < ActiveRecord::Migration
  def change
    create_table :system_logins do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
