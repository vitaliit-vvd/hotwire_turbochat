# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true
      t.index %i[user_id message_id], unique: true

      t.timestamps
    end

    change_table :messages do |t|
      t.integer :likes_count, null: false, default: 0
    end
  end
end
