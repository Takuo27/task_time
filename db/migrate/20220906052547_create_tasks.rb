# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.time :time
      t.text :content
      t.integer :category
      t.integer :user_id

      t.timestamps
    end
  end
end
