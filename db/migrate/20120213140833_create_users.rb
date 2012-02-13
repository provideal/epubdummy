class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :login
      t.string  :firstname
      t.string  :lastname
      t.string  :password_digest
      t.integer :roles_mask
      t.timestamps
    end

    add_index :users, :login, unique: true
  end
end
