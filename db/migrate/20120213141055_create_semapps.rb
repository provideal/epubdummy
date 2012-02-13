class CreateSemapps < ActiveRecord::Migration
  def change
    create_table :semapps do |t|
      t.references :user
      t.string     :name
      t.timestamps
    end

    add_index :semapps, :user_id
  end
end
