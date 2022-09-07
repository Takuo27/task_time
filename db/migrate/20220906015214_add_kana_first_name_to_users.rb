class AddKanaFirstNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :kana_first_name, :string
    add_column :users, :kana_last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :years, :integer
    add_column :users, :level, :integer
    add_column :users, :exp_sum, :integer
    add_column :users, :is_deleted, :boolean
  end
end
