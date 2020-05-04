class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.interger :food,    null: false
      t.interger :calorie  
      t.interger :protein 
      t.interger :fat 
      t.interger :carbo 
      t.text :text
      t.image :text
      t.date :date         null: false
      .refereces :user,    forein_key: true
      t.timestamps         null: false
    end
  end
end
