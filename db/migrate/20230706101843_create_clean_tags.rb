class CreateCleanTags < ActiveRecord::Migration[6.1]
  def change
    create_table :clean_tags do |t|
      t.references :clean, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.string :maker

      t.timestamps
    end
  end
end
