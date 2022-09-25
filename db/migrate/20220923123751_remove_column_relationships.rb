# frozen_string_literal: true

class RemoveColumnRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :following_id, :integer
    remove_column :relationships, :follower_id, :integer
  end
end
