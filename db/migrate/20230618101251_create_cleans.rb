class CreateCleans < ActiveRecord::Migration[6.1]
  def change
    create_table :cleans do |t|
      t.string :maker
      t.string :name
      t.string :genre
      t.string :parts
      t.text :about
      t.string :image
      t.integer :overall
      t.integer :light
      t.integer :power
      t.integer :care
      t.integer :time
      t.string :cost
      t.integer :user_id



      t.timestamps
    end
  end
end
