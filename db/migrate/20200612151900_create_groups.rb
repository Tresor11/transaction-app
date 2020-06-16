# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, unique: true, null: false
      t.string :icon, null: false
      t.integer :creator_id
      t.timestamps
    end
    add_index :groups, :name
    add_foreign_key :groups, :users, column: :creator_id
  end
end
