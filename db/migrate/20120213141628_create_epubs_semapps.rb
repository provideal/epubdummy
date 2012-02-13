class CreateEpubsSemapps < ActiveRecord::Migration
  def change
    create_table :epubs_semapps, :id => false do |t|
      t.references :epub,   null: false
      t.references :semapp, null: false
    end

    add_index :epubs_semapps, :epub_id
    add_index :epubs_semapps, :semapp_id
  end
end
