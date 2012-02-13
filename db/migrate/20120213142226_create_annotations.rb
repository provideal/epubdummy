class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.references :user
      t.references :scenario
      t.text       :data
      t.timestamps
    end

    add_index :annotations, :user_id
    add_index :annotations, :scenario_id
  end
end
