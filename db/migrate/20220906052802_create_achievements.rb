class CreateAchievements < ActiveRecord::Migration[6.1]
  def change
    create_table :achievements do |t|
      t.integer :user_id
      t.string :name
      t.text :content
      t.integer :category

      t.timestamps
    end
  end
end
