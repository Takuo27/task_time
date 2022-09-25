# frozen_string_literal: true

class ChangeColumnNullToAchievements < ActiveRecord::Migration[6.1]
  def change
    change_column_null :achievements, :user_id, false
    change_column_null :achievements, :name, false
    change_column_null :achievements, :content, false
    change_column_null :achievements, :category, false
  end
end
