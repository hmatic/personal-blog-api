class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false 
      t.integer :role, null: false, default: 0
      t.string :password_digest, null: false
      t.string :token, null: false, default: ''

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :token, unique: true
  end
end
