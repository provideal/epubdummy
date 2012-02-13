class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.references :epub
      t.references :semapp
      t.string     :name
      t.boolean    :active
      t.integer    :version
      t.timestamps
    end

    add_index :scenarios, :epub_id
  end
end
