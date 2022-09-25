# frozen_string_literal: true

class ChangeColumnNullToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tasks, :time, false
    change_column_null :tasks, :content, false
    change_column_null :tasks, :category, false
    change_column_null :tasks, :user_id, false
  end
end
