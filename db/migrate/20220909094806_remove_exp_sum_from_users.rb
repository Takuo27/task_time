# frozen_string_literal: true

class RemoveExpSumFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :exp_sum, :integer
  end
end
