# frozen_string_literal: true

class RemoveBirthdayFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :birthday, :date
  end
end
