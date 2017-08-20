class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.date :dob
      t.integer :gender
      t.integer :role
      t.text :picture

      t.timestamps
    end
  end
end
