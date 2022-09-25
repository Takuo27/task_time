# frozen_string_literal: true

class ChangeColumnNullToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :last_name, false
    change_column_null :users, :first_name, false
    change_column_null :users, :kana_first_name, false
    change_column_null :users, :kana_last_name, false
    change_column_null :users, :phone_number, false
    change_column_null :users, :level, false
    change_column_null :users, :exp_sum, false
    change_column_null :users, :is_deleted, false
    change_column_null :users, :birthday, false
  end
end
