# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name, null: false
      t.integer :author_id
      t.integer :group_id
      t.integer :amount, null: false
      t.timestamps
    end
    add_index :transactions, :author_id
    add_index :transactions, :group_id
  end
end
