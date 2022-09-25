# frozen_string_literal: true

class RemoveYearsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :years, :integer
  end
end
