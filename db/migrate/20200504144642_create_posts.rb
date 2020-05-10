class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :food, null: false
      t.integer :calorie  
      t.integer :protein 
      t.integer :fat 
      t.integer :carbo 
      t.text :text
      t.text :image
      t.timestamps
    end
  end
end
