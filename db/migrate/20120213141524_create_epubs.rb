class CreateEpubs < ActiveRecord::Migration
  def change
    create_table :epubs do |t|
      t.string :name
      t.string :file
      t.timestamps
    end
  end
end
